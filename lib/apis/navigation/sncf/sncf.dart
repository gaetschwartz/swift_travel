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
  final Reader _read;
  SncfApi(this._read);

  @override
  Locale locale = const Locale('en');

  static const baseUrl = 'https://api.navitia.io/v1/coverage/sncf/';

  Future<Map<String, String?>> get globalParameters async {
    final config = await _read(configProvider.future);
    return {'key': config.sncfKey};
  }

  final _client = http.Client();

  @override
  Future<List<Completion>> complete(String string,
      {bool showCoordinates = true,
      bool showIds = true,
      bool noFavorites = true,
      bool filterNull = true}) async {
    if (string.isEmpty) return [];

    final queryParameters = {
      ...await globalParameters,
      'q': string,
    };

    final uri = Uri.https('api.navitia.io', '/v1/coverage/sncf/places', queryParameters);

    if (kDebugMode) print(uri.toString());
    final response = await _client.get(uri);

    final decode = jsonDecode(response.body) as Map<String, dynamic>;

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
  Future<StationBoard> stationboard(String stopName,
      {DateTime? when,
      bool? arrival,
      int? limit,
      bool? showTracks,
      bool? showSubsequentStops,
      bool? showDelays,
      bool? showTrackchanges,
      List<TransportationTypes>? transportationTypes}) {
    throw UnimplementedError('SNCF.stationboard is not supported yet.');
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
