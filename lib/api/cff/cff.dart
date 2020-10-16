import 'package:flutter/material.dart';
import 'package:swiss_travel/blocs/cff.dart';

import 'models/cff_completion.dart';
import 'models/cff_route.dart';
import 'models/cff_stationboard.dart';

abstract class CffBase {
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
