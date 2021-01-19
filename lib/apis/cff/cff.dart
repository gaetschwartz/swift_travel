import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/apis/cff/models/cff_stationboard.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';

final cffFactory = NavigationApiFactory(
  () => CffApi._(),
  name: 'SBB CFF FFS',
  shortName: 'SBB',
  coutryEmoji: '🇨🇭',
  coutryName: 'Switzerland',
);

class CffApi extends NavigationApi {
  CffApi._();

  final QueryBuilder queryBuilder =
      QueryBuilder('https://timetable.search.ch/api', (s) => '$s.json');
  final http.Client _client = http.Client();

  Map<String, String> get headers => {'accept-language': super.locale.toLanguageTag()};

  @override
  Future<List<CffCompletion>> complete(
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

    final completions = <CffCompletion>[];

    for (final item in decode) {
      if (!filterNull || item['label'] != null) {
        completions.add(CffCompletion.fromJson(item as Map<String, dynamic>));
      }
    }

    return completions;
  }

  @override
  Future<List<CffCompletion>> findStation(
    double lat,
    double lon, {
    int accuracy = 10,
    bool showCoordinates = true,
    bool showIds = false,
  }) async {
    final uri = queryBuilder('completion', {
      'latlon': '$lat,$lon',
      'accuracy': accuracy,
      'show_ids': showIds.toInt(),
      'show_coordinates': showCoordinates.toInt()
    });
    log(uri);
    final response = await _client.get(uri, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't find station : ${response.body}");
    }
    final decode = jsonDecode(response.body) as List;

    final completions = decode
        .map<CffCompletion>((e) => CffCompletion.fromJson(e as Map<String, dynamic>))
        .toList();
    return completions;
  }

  @override
  Future<CffStationboard> stationboard(String stopName,
      {DateTime when,
      bool arrival = false,
      int limit = 32,
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
    if (when != null) throw UnimplementedError('Todo');
    final s = queryBuilder('stationboard', params);
    log(s);
    final response = await _client.get(s, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve stationboard : ${response.body}");
    }
    final decode = await compute(jsonDecode, response.body) as Map<String, dynamic>;

    return CffStationboard.fromJson(decode).copyWith(stopName: stopName);
  }

  @override
  Future<CffRoute> route(
    String departure,
    String arrival, {
    @required DateTime date,
    @required TimeOfDay time,
    TimeType typeTime = TimeType.depart,
    bool showDelays = true,
  }) async {
    assert(date != null && time != null);
    final params = {
      'from': departure,
      'to': arrival,
      'date': '${date.month}/${date.day}/${date.year}',
      'time': '${time.hour}:${time.minute}',
      'time_type': describeEnum(typeTime),
      'show_trackchanges': 1,
      'show_delays': showDelays.toInt(),
    };

    final s = queryBuilder('route', params);
    log('builder : $s');
    return rawRoute(s);
  }

  @override
  Future<CffRoute> rawRoute(String query) async {
    final response = await _client.get(query, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve raw route : ${response.body}");
    }
    final stopwatch = Stopwatch()..start();
    final map = jsonDecode(response.body) as Map<String, dynamic>;
    log('decode took ${stopwatch.elapsedMilliseconds} ms');

    if (map['disruptions'] != null) log(map['disruptions'].toString());
    map['requestUrl'] = query;
    return CffRoute.fromJson(map);
  }

  @override
  void dispose() {
    _client.close();
  }
}

class QueryBuilder {
  final String baseUrl;
  final String Function(String action) actionBuilder;

  const QueryBuilder(this.baseUrl, this.actionBuilder);

  String call(String action, Map<String, dynamic> parameters) {
    final url = StringBuffer('$baseUrl/${actionBuilder(action)}');
    if (parameters.isNotEmpty) {
      final params = parameters.keys
          .map((k) => '$k=${Uri.encodeQueryComponent(parameters[k].toString())}')
          .join('&');
      url.write('?$params');
    }
    return url.toString();
  }
}

enum TransportationTypes { train, tram, bus, ship, cableway }

enum TimeType { depart, arrival }

extension BoolX on bool {
  int toInt() => this ? 1 : 0;
}
