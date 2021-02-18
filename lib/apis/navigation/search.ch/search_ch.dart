import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/completion.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stationboard.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/route_uri.dart';

final searchChApi = NavigationApiFactory(
  () => SearchChApi._(),
  name: 'SBB CFF FFS',
  shortName: 'SBB',
  countryEmoji: '🇨🇭',
  countryName: 'Switzerland',
);

class SearchChApi extends NavigationApi {
  SearchChApi._();

  static const queryBuilder = QueryBuilder<String>('timetable.search.ch', _json);
  static String _json(String s) => '/api/$s.json';

  final http.Client _client = http.Client();

  Map<String, String> get headers => {'accept-language': super.locale.toLanguageTag()};

  @override
  Future<List<SbbCompletion>> complete(
    String string, {
    bool showCoordinates = false,
    bool showIds = false,
    bool noFavorites = true,
    bool filterNull = true,
  }) async {
    final uri = queryBuilder('completion', {
      'show_ids': showIds.toInt(),
      'show_coordinates': showCoordinates.toInt(),
      'nofavorites': noFavorites.toInt(),
      'term': string,
    });

    //log(uri);
    //log(headers.toString());

    final response = await _client.get(uri, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve completion : ${response.body}");
    }

    final decode = jsonDecode(response.body) as List;

    final completions = <SbbCompletion>[];

    for (final item in decode) {
      if (!filterNull || item['label'] != null) {
        completions.add(SbbCompletion.fromJson(item as Map<String, dynamic>));
      }
    }

    return completions;
  }

  @override
  Future<List<SbbCompletion>> findStation(
    double lat,
    double lon, {
    int? accuracy = 10,
    bool showCoordinates = true,
    bool showIds = false,
  }) async {
    final uri = queryBuilder('completion', {
      'latlon': '$lat,$lon',
      'accuracy': accuracy,
      'show_ids': showIds.toInt(),
      'show_coordinates': showCoordinates.toInt()
    });
    if (kDebugMode) log(uri.toString());
    final response = await _client.get(uri, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't find station : ${response.body}");
    }
    final decode = jsonDecode(response.body) as List<Object?>;

    return decode
        .map((e) => SbbCompletion.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  Future<CffStationboard> stationboard(String stopName,
      {DateTime? when,
      bool arrival = false,
      int? limit = 32,
      bool showTracks = false,
      bool showSubsequentStops = true,
      bool showDelays = true,
      bool showTrackchanges = false,
      List<TransportationTypes> transportationTypes = const []}) async {
    final params = {
      'stop': stopName,
      'limit': limit,
      'show_tracks': showTracks.toInt(),
      'show_subsequent_stops': showSubsequentStops.toInt(),
      'show_delays': showDelays.toInt(),
      'show_trackchanges': showTrackchanges.toInt(),
      'mode': arrival ? 'arrival' : 'depart'
    };
    if (transportationTypes.isNotEmpty) {
      params['transportation_types'] = transportationTypes.join(',');
    }
    final s = queryBuilder('stationboard', params);
    if (kDebugMode) log(s.toString());
    final response = await _client.get(s, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve stationboard : ${response.body}");
    }
    final decode = await Future.microtask(() => jsonDecode(response.body) as Map<String, dynamic>);

    final cffStationboard = CffStationboard.parse(decode);
    return cffStationboard.map((value) => value.copyWith(stopName: stopName), error: (e) => e);
  }

  @override
  Future<CffRoute> route(
    String departure,
    String arrival, {
    required DateTime date,
    required TimeOfDay time,
    TimeType typeTime = TimeType.depart,
    bool showDelays = true,
    int number = 4,
    int previous = 0,
  }) async {
    final params = {
      'from': departure,
      'to': arrival,
      'date': '${date.month}/${date.day}/${date.year}',
      'time': '${time.hour}:${time.minute}',
      'time_type': describeEnum(typeTime),
      'show_trackchanges': 1,
      'show_delays': showDelays.toInt(),
      'pre': previous,
      'num': number,
    };

    final s = queryBuilder('route', params);
    if (isDebugMode) print('builder: $s');
    return await rawRoute(s);
  }

  @override
  Future<CffRoute> rawRoute(Uri query) async {
    final response = await _client.get(query, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve raw route: ${response.body}");
    }
    final stopwatch = Stopwatch()..start();
    final map = jsonDecode(response.body) as Map<String, dynamic>;
    stopwatch.stop();

    if (stopwatch.elapsedMilliseconds > 16) print('⚠ Decoding took more than a frame');
    print('Decoding ${response.body.length} characters took ${stopwatch.elapsedMilliseconds} ms');

    return CffRoute.fromJson(map).copyWith(requestUrl: query.toString());
  }

  @override
  void dispose() {
    _client.close();
  }
}

class QueryBuilder<T> {
  final String authority;
  final bool https;
  final String Function(T input) pathBuilder;

  const QueryBuilder(this.authority, this.pathBuilder, {this.https = true});

  Uri call(T input, Map<String, Object?>? parameters) {
    final path = pathBuilder(input);
    final params = parameters == null || parameters.isEmpty
        ? null
        : parameters.map((key, value) => MapEntry(key, value.toString()));
    return https
        ? params == null
            ? Uri.https(authority, path)
            : Uri.https(authority, path, params)
        : params == null
            ? Uri.http(authority, path)
            : Uri.http(authority, path, params);
  }
}

enum TransportationTypes { train, tram, bus, ship, cableway }

enum TimeType { depart, arrival }
