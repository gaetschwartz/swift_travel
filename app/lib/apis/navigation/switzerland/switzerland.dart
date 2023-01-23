import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/switzerland/geo_admin_ch.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/completion.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/route.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/switzerland/trias_2020.dart';
import 'package:swift_travel/constants/config.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/utils/route_uri.dart';

const searchChApi = NavigationApiFactory(
  SearchChApi.new,
  name: 'SBB CFF FFS',
  shortName: 'SBB',
  countryEmoji: '🇨🇭',
  countryName: 'Switzerland',
  id: NavigationApiId('sbb'),
);

final _trias2020ApiProvider = FutureProvider((ref) => ref
    .read(configProvider.future)
    .then((value) => Trias2020Api(value.triasKey!)));

class SearchChApi extends BaseNavigationApi {
  static const kUseTrias2020 = false;
  static const kUseGeoAdmin = true;

  SearchChApi(this.ref);

  static const queryBuilder =
      QueryBuilder<String>('timetable.search.ch', _json);
  static String _json(String s) => '/api/$s.json';
  final Ref ref;

  final _client = http.Client();

  final log = Logger.of('SearchChApi');

  @override
  Locale locale = const Locale('en');

  Map<String, String> get headers =>
      {'accept-language': locale.toLanguageTag()};

  Future<Trias2020Api> get trias => ref.read(_trias2020ApiProvider.future);

  final _geoAdmin = GeoAdminEngine();

  @override
  Future<List<NavigationCompletion>> complete(
    String string, {
    bool showCoordinates = false,
    bool showIds = false,
    LocationType? locationType,
  }) async {
    const filterNull = true;

    if (kUseTrias2020 && locationType == LocationType.station) {
      return (await trias).complete(
        string,
        showCoordinates: showCoordinates,
        showIds: showIds,
      );
    }
    if (kUseGeoAdmin && locationType == null) {
      return _geoAdmin.complete(
        string,
        showCoordinates: showCoordinates,
        showIds: showIds,
      );
    }
    final uri = queryBuilder('completion', {
      'show_ids': showIds.toInt(),
      'show_coordinates': showCoordinates.toInt(),
      'nofavorites': 1,
      'term': string,
    });

    final response = await _client.get(uri, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve completion : ${response.body}");
    }

    final decode = jsonDecode(response.body) as List;

    final completions = decode
        .where((dynamic e) {
          if (filterNull) {
            if ((e as Map)['label'] == null) {
              return false;
            }
          }
          return true;
        })
        .map((dynamic e) => SchCompletion.fromJson(e as Map<String, dynamic>))
        .toList();

    return completions;
  }

  @override
  Future<List<NavigationCompletion>> find(
    double lat,
    double lon, {
    int? accuracy = 10,
    bool showCoordinates = true,
    bool showIds = true,
  }) async {
    if (kUseTrias2020) {
      return (await trias).find(lat, lon);
    }
    final uri = queryBuilder('completion', {
      'latlon': '$lat,$lon',
      'accuracy': accuracy,
      'show_ids': showIds.toInt(),
      'show_coordinates': showCoordinates.toInt(),
      'nofavorites': true.toInt(),
    });

    if (kDebugMode) {
      log.log(uri.toString());
    }
    final response = await _client.get(uri, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't find station : ${response.body}");
    }
    final decode = jsonDecode(response.body) as List<Object?>;

    return decode
        .map((e) => SchCompletion.fromJson(e! as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  Future<StationBoard> stationboard(
    Stop stop, {
    DateTime? when,
    SearchChMode mode = SearchChMode.departure,
    List<TransportationTypes> transportationTypes = const [],
  }) async {
    const limit = 32;
    const showTracks = true;
    const showSubsequentStops = true;
    const showDelays = true;
    const showTrackchanges = true;
    final params = {
      'stop': stop.id ?? stop.name,
      'limit': limit,
      'show_tracks': showTracks.toInt(),
      'show_subsequent_stops': showSubsequentStops.toInt(),
      'show_delays': showDelays.toInt(),
      'show_trackchanges': showTrackchanges.toInt(),
      'mode': mode.name,
      if (transportationTypes.isNotEmpty)
        'transportation_types': transportationTypes.join(','),
    };
    final s = queryBuilder('stationboard', params);
    if (kDebugMode) {
      log.log(s.toString());
    }

    final response = await _client.get(s, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve stationboard : ${response.body}");
    }
    final decode = await Future.microtask(() => timedDecode(response.body));

    final sbbStationboard = SchStationboard.fromJson(decode);

    return sbbStationboard;
  }

  Map<String, dynamic> timedDecode(String body) {
    if (kDebugMode) {
      late final Map<String, dynamic> map;
      final w = Stopwatch()..start();
      map = jsonDecode(body) as Map<String, dynamic>;
      w.stop();
      if (w.elapsedMilliseconds > 10) {
        log.log(
          '⚠ Took ${w.elapsedMilliseconds} ms to decode ${body.length} characters',
        );
        debugPrintStack();
      }
      return map;
    } else {
      return jsonDecode(body) as Map<String, dynamic>;
    }
  }

  @override
  Future<NavRoute> route(
    String departure,
    String arrival, {
    required DateTime date,
    required TimeOfDay time,
    SearchChMode timeType = SearchChMode.departure,
    bool showDelays = true,
    int number = 4,
    int previous = 0,
  }) async {
    final params = {
      'from': departure,
      'to': arrival,
      'date': '${date.month}/${date.day}/${date.year}',
      'time': '${time.hour}:${time.minute}',
      'time_type': describeEnum(timeType),
      'show_trackchanges': 1,
      'show_delays': showDelays.toInt(),
      'pre': previous,
      'num': number,
    };

    final s = queryBuilder('route', params);
    if (Env.isDebugMode) {
      log.log('builder: $s');
    }
    return rawRoute(s);
  }

  @override
  Future<NavRoute> rawRoute(Uri query) async {
    final response = await _client.get(query, headers: headers);
    if (response.statusCode != 200) {
      throw Exception("Couldn't retrieve raw route: ${response.body}");
    }

    final map = timedDecode(response.body);

    return SchRoute.fromJson(map).copyWith(requestUrl: query.toString());
  }

  @override
  void dispose() {
    _geoAdmin.dispose();
    _client.close();
  }
}

class QueryBuilder<T> {
  const QueryBuilder(this.authority, this.pathBuilder, {this.useHttps = true});

  final String authority;
  final bool useHttps;
  final String Function(T input) pathBuilder;

  Uri call(T input, Map<String, Object?>? parameters) {
    final path = pathBuilder(input);
    final params = parameters == null || parameters.isEmpty
        ? null
        : parameters.map((key, value) => MapEntry(key, value.toString()));
    return useHttps
        ? params == null
            ? Uri.https(authority, path)
            : Uri.https(authority, path, params)
        : params == null
            ? Uri.http(authority, path)
            : Uri.http(authority, path, params);
  }
}

enum TransportationTypes { train, tram, bus, ship, cableway }

enum SearchChMode {
  departure,
  arrival,
}

extension SearchChModeX on SearchChMode {
  String toApiString() {
    switch (this) {
      case SearchChMode.departure:
        return 'depart';
      case SearchChMode.arrival:
        return 'arrival';
    }
  }
}
