import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/apis/navigation/sncf/models/departures.dart';
import 'package:swift_travel/apis/navigation/sncf/models/sncf_completion.dart';
import 'package:swift_travel/constants/config.dart';

final sncfFactory = NavigationApiFactory(
  (reader) => SncfApi(reader),
  name: 'SNCF',
  shortName: 'SNCF',
  countryEmoji: '🇫🇷',
  countryName: 'France',
);

class SncfApi extends BaseNavigationApi {
  SncfApi(this._read);

  final Reader _read;

  @override
  Locale get locale => const Locale('en');

  late final config = _read(configProvider.future);

  Future<Map<String, String?>> get globalParameters async {
    final c = await config;
    return {'key': c.sncfKey};
  }

  final _client = http.Client();

  @override
  Future<List<Completion>> complete(String string,
      {bool showCoordinates = true,
      bool showIds = true,
      bool noFavorites = true,
      bool filterNull = true}) async {
    if (string.isEmpty) {
      return [];
    }

    final queryParameters = {
      ...await globalParameters,
      'q': string,
    };

    final uri = Uri.https('api.navitia.io', '/v1/coverage/fr-idf/places', queryParameters);

    if (kDebugMode) {
      log(uri.toString());
    }

    final response = await _client.get(uri);

    final decode = jsonDecode(response.body) as Map<String, dynamic>;
    //  print(decode);
    final sncfCompletion = SncfCompletion.fromJson(decode);
    final places = sncfCompletion.places;
    log('Found ${places.length} places');
    return places;
  }

  @override
  Future<List<Completion>> findStation(double lat, double lon,
      {int? accuracy, bool? showCoordinates, bool? showIds}) {
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
    bool? arrival,
    int? limit,
    bool? showTracks,
    bool? showSubsequentStops,
    bool? showDelays,
    bool? showTrackchanges,
    List<TransportationTypes>? transportationTypes,
  }) async {
    final queryParameters = {
      ...await globalParameters,
      if (when != null) 'from_datetime': when.toIso8601String(),
    };
    print(stop);
    final uri = Uri.https(
      'api.navitia.io',
      '/v1/coverage/fr-idf/stop_areas/${stop.id ?? stop.name}/departures',
      queryParameters,
    );

    if (kDebugMode) {
      log(uri.toString());
    }

    final response = await _client.get(uri);

    final decode = jsonDecode(response.body) as Map<String, dynamic>;

    /*  final out = <String, dynamic>{...decode};
    out['links'] = <void>[];
    out['disruptions'] = <void>[];
    print(const JsonEncoder.withIndent('|').convert(out)); */

    final stationboard = SncfStationboard.fromJson(decode).copyWith(stop: stop);
    print(stationboard);
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
    TimeType? typeTime,
    bool showDelays = true,
    int previous = 1,
  }) =>
      throw UnimplementedError('SNCF.route is not supported yet.');
}
