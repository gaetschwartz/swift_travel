import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:swift_travel/apis/cff/cff.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/apis/cff/models/cff_stationboard.dart';

abstract class NavigationApi {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  set locale(Locale locale) {
    _locale = locale;
    log('Set locale to $locale');
  }

  Future<List<CffCompletion>> complete(
    String string, {
    bool showCoordinates,
    bool showIds,
    bool noFavorites,
    bool filterNull,
  });

  Future<List<CffCompletion>> findStation(
    double lat,
    double lon, {
    int accuracy,
    bool showCoordinates,
    bool showIds,
  });

  Future<CffStationboard> stationboard(
    String stopName, {
    DateTime when,
    bool arrival,
    int limit,
    bool showTracks,
    bool showSubsequentStops,
    bool showDelays,
    bool showTrackchanges,
    List<TransportationTypes> transportationTypes,
  });

  Future<CffRoute> route(
    String departure,
    String arrival, {
    DateTime date,
    TimeOfDay time,
    TimeType typeTime,
  });

  void dispose();

  Future<CffRoute> rawRoute(String query);
}
