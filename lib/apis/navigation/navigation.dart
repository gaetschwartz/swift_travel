import 'package:flutter/material.dart';
import 'package:models/cff/cff_completion.dart';
import 'package:models/cff/cff_route.dart';
import 'package:models/cff/cff_stationboard.dart';
import 'package:swift_travel/apis/cff/cff.dart';

abstract class NavigationApi {
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

  Future<CffRoute> rawRoute(String query);
}
