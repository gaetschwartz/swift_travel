import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/navigation/france/models/departures.dart';
import 'package:swift_travel/apis/navigation/france/models/sncf_completion.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/switzerland/switzerland.dart';
import 'package:swift_travel/constants/config.dart';

const sncfFactory = NavigationApiFactory(
  SncfApi._,
  name: 'SNCF',
  shortName: 'SNCF',
  countryEmoji: '🇫🇷',
  countryName: 'France',
  id: NavigationApiId('sncf'),
);

class SncfApi extends BaseNavigationApi {
  SncfApi._(this.ref);

  final Ref ref;
  final log = Logger.of('SncfApi');

  @override

  /// SNCF doesn't support locales so we just return the default locale
  Locale get locale => const Locale('fr');
  @override
  set locale(Locale locale) {}

  late final config = ref.read(configProvider.future);

  Future<Map<String, String?>> get globalParameters async {
    final c = await config;

    return {'key': c.sncfKey};
  }

  final _client = http.Client();

  @override
  Future<List<NavigationCompletion>> complete(
    String string, {
    bool showCoordinates = true,
    bool showIds = true,
    LocationType? locationType,
  }) async {
    if (string.isEmpty) {
      return [];
    }

    final queryParameters = {
      ...await globalParameters,
      'q': string,
    };

    final uri = Uri.https(
        'api.navitia.io', '/v1/coverage/fr-idf/places', queryParameters);

    if (kDebugMode) {
      log.log(uri.toString());
    }

    final response = await _client.get(uri);

    final decode = jsonDecode(response.body) as Map<String, dynamic>;
    //  log.log(decode);
    final sncfCompletion = SncfCompletion.fromJson(decode);
    final places = sncfCompletion.places;
    log.log('Found ${places.length} places');

    return places;
  }

  @override
  Future<List<NavigationCompletion>> find(
    double lat,
    double lon, {
    int? accuracy,
    bool? showCoordinates,
    bool? showIds,
  }) {
    throw UnimplementedError('SNCF.findStation is not supported yet.');
  }

  @override
  Future<NavRoute> rawRoute(Uri query) {
    throw UnimplementedError('SNCF.rawRoute is not supported yet.');
  }

  @override
  Future<StationBoard> stationboard(
    Stop stop, {
    DateTime? when,
    SearchChMode? mode,
    int? limit,
    List<TransportationTypes>? transportationTypes,
  }) async {
    final queryParameters = {
      ...await globalParameters,
      if (when != null) 'from_datetime': when.toIso8601String(),
    };
    log.log(stop);
    final uri = Uri.https(
      'api.navitia.io',
      '/v1/coverage/fr-idf/stop_areas/${stop.id ?? stop.name}/departures',
      queryParameters,
    );

    if (kDebugMode) {
      log.log(uri.toString());
    }

    final response = await _client.get(uri);

    final decode = jsonDecode(response.body) as Map<String, dynamic>;

    /*  final out = <String, dynamic>{...decode};
    out['links'] = <void>[];
    out['disruptions'] = <void>[];
    log.log(const JsonEncoder.withIndent('|').convert(out)); */

    final stationboard = SncfStationboard.fromJson(decode).copyWith(stop: stop);
    if (kDebugMode) {
      log.log(stationboard.toString());
    }
    return stationboard;
  }

  @override
  void dispose() {
    _client.close();
  }

  @override
  Future<NavRoute> route(
    String departure,
    String arrival, {
    required DateTime date,
    required TimeOfDay time,
    SearchChMode? timeType,
    bool showDelays = true,
    int previous = 1,
  }) =>
      throw UnimplementedError('SNCF.route is not supported yet.');
}
