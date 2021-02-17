import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/search.ch/models/completion.dart';
import 'package:swift_travel/apis/search.ch/models/route.dart';
import 'package:swift_travel/apis/search.ch/models/stationboard.dart';
import 'package:swift_travel/apis/search.ch/search_ch.dart';
import 'package:swift_travel/apis/sncf/key.dart';
import 'package:swift_travel/apis/sncf/models/sncf_completion.dart';
import 'package:swift_travel/utils/typed_data.dart';

final sncfFactory = NavigationApiFactory(
  () => SncfApi._(),
  name: 'SNCF',
  shortName: 'SNCF',
  countryEmoji: '🇫🇷',
  countryName: 'France',
);

class SncfApi extends NavigationApi {
  SncfApi._();

  @override
  Locale locale = const Locale('en');

  static const baseUrl = 'https://api.navitia.io/v1/coverage/sncf/';
  static const _queryParameters = UnmodifiableMap({'key': sncfKey});

  final _client = http.Client();

  @override
  Future<List<NavCompletion>> complete(String string,
      {bool showCoordinates = true,
      bool showIds = true,
      bool noFavorites = true,
      bool filterNull = true}) async {
    if (string.isEmpty) return [];

    final uri =
        Uri.https('api.navitia.io', '/v1/coverage/sncf/places', {'q': string, ..._queryParameters});
    if (kDebugMode) print(uri.toString());
    final response = await _client.get(uri);

    final decode = jsonDecode(response.body) as Map<String, dynamic>;

    final sncfCompletion = SncfCompletion.fromJson(decode);
    final places = sncfCompletion.places;
    log('Found ${places.length} places');
    final list = places.map((e) => NavCompletion(label: e.name ?? '???')).toList(growable: false);
    log('Found ${list.length} completions');
    return list;
  }

  @override
  Future<List<NavCompletion>> findStation(double lat, double lon,
      {int? accuracy, bool? showCoordinates, bool? showIds}) {
    throw UnimplementedError('SNCF.findStation is not supported yet.');
  }

  @override
  Future<CffRoute> rawRoute(Uri query) {
    throw UnimplementedError('SNCF.rawRoute is not supported yet.');
  }

  @override
  Future<CffStationboard> stationboard(String stopName,
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
  Future<CffRoute> route(
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
