import 'dart:ui';

import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

import 'stationboard.dart';

/// The response to [BaseNavigationApi.route]
mixin NavRoute {
  /// The different routes (aka [RouteConnection])
  List<RouteConnection> get connections;

  /// The number of routes
  int get count;

  /// Optionnal messages (usually errors)
  List<String> get messages;

  /// The request time
  DateTime? get dateTime;

  /// The request URL.
  String? get requestUrl;
}

/// A route from [from] to [to].
mixin RouteConnection {
  /// The departure of the route
  String get from;

  /// The arrival of the route
  String get to;

  /// The time of departure
  DateTime? get departure;

  /// The time of arrival
  DateTime? get arrival;

  /// The total duration of the travel
  Duration? get duration;

  /// The different "steps" of the route
  List<Leg> get legs;

  /// The departure delay
  int? get depDelay;

  RouteConnection copyWithLegs(List<Leg> legs);
}

mixin Leg {
  String get name;
  Exit? get exit;

  int? get depDelay;

  TransportationMode? get type;
  String? get track;
  String? get terminal;

  Color? get fgColor;
  Color? get bgColor;

  String? get number;
  String? get tripid;
  String? get stopid;

  Duration? get walkingTime;
  String? get line;
  List<Stop> get stops;
  String? get officialName;
  DateTime? get departure;
  DateTime? get arrival;
  double get waitTime;
  bool get isAddress;
  Map<String, String> get attributes;
  String get displayName;

  LatLon? get position;

  Leg copyWithLatLon({required double lat, required double lon});
}
