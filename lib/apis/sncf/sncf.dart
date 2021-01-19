import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/cff/cff.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/apis/cff/models/cff_stationboard.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/sncf/key.dart';
import 'package:swift_travel/apis/sncf/models/sncf_completion.dart';

class SncfRepository implements NavigationApi {
  final Dio _client = Dio(BaseOptions(
      baseUrl: 'https://api.navitia.io/v1/coverage/sncf', queryParameters: {'key': sncfKey}));

  @override
  Locale locale = const Locale('en');

  @override
  Future<List<CffCompletion>> complete(String string,
      {bool showCoordinates, bool showIds, bool noFavorites, bool filterNull}) async {
    if (string.isEmpty) return [];

    final response = await _client.get(
      '/places',
      queryParameters: {'q': string},
      options: Options(responseType: ResponseType.json),
    );

    log(response.request.uri.toString());

    final decode = response.data as Map<String, dynamic>;
    //  log(decode.toString());
    final sncfCompletion = SncfCompletion.fromJson(decode);
    final places = sncfCompletion.places;
    log('Found ${places.length} places');
    final list = places.map((e) => CffCompletion(label: e.name ?? '???')).toList();
    log('Found ${list.length} completions');
    return list;
  }

  @override
  Future<List<CffCompletion>> findStation(double lat, double lon,
      {int accuracy, bool showCoordinates, bool showIds}) {
    // TODO: implement findStation
    throw UnimplementedError();
  }

  @override
  Future<CffRoute> rawRoute(String query) {
    // TODO: implement rawRoute
    throw UnimplementedError();
  }

  @override
  Future<CffRoute> route(String departure, String arrival,
      {DateTime date, TimeOfDay time, TimeType typeTime}) {
    // TODO: implement route
    throw UnimplementedError();
  }

  @override
  Future<CffStationboard> stationboard(String stopName,
      {DateTime when,
      bool arrival,
      int limit,
      bool showTracks,
      bool showSubsequentStops,
      bool showDelays,
      bool showTrackchanges,
      List<TransportationTypes> transportationTypes}) {
    // TODO: implement stationboard
    throw UnimplementedError();
  }

  @override
  void dispose() {
    _client.close();
  }
}
