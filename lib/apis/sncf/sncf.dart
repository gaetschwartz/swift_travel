import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/search.ch/cff.dart';
import 'package:swift_travel/apis/search.ch/models/cff_completion.dart';
import 'package:swift_travel/apis/search.ch/models/cff_route.dart';
import 'package:swift_travel/apis/search.ch/models/cff_stationboard.dart';
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
  Future<List<CffCompletion>> complete(String string,
      {bool showCoordinates = true,
      bool showIds = true,
      bool noFavorites = true,
      bool filterNull = true}) async {
    if (string.isEmpty) return [];

    final queryParameters = {'q': string, ..._queryParameters};

    final response = await _client.get(
      baseUrl + 'places?' + queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&'),
    );

    log(response.request.url.toString());

    final decode = jsonDecode(response.body) as Map<String, dynamic>;

    final sncfCompletion = SncfCompletion.fromJson(decode);
    final places = sncfCompletion.places;
    log('Found ${places.length} places');
    final list = places.map((e) => CffCompletion(label: e.name ?? '???')).toList();
    log('Found ${list.length} completions');
    return list;
  }

  @override
  Future<List<CffCompletion>> findStation(double lat, double lon,
      {int? accuracy, bool? showCoordinates, bool? showIds}) {
    throw UnimplementedError();
  }

  @override
  Future<CffRoute> rawRoute(String query) {
    throw UnimplementedError();
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
    throw UnimplementedError();
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
  }) =>
      throw UnimplementedError();
}
