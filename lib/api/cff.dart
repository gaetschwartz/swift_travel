import 'package:flutter/material.dart';
import 'package:travel_free/api/cff/cff_stationboard.dart';
import 'package:travel_free/blocs/cff.dart';

import 'cff/cff_completion.dart';
import 'cff/cff_route.dart';
import 'cff/stop.dart';

abstract class CffBase {
  Future<List<CffCompletion>> complete(
    String string, {
    bool showCoordinates,
    bool showIds,
    bool nofavorites,
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
    Stop departure,
    Stop arrival, {
    DateTime date,
    TimeOfDay time,
    TimeType typeTime,
  });
}
