import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

import 'stationboard.dart';

mixin NavRoute {
  int get count;
  List<String> get messages;
  DateTime? get dateTime;
  String? get requestUrl;
  List<RouteConnection> get connections;
}
mixin RouteConnection {
  String get from;
  String get to;
  DateTime? get departure;
  DateTime? get arrival;
  double? get duration;
  List<Leg> get legs;
  int get depDelay;

  RouteConnection copyWithLegs(List<Leg> legs);
}

mixin Leg {
  String get name;
  Exit? get exit;
  int get depDelay;
  Vehicle? get type;
  String? get track;
  String? get terminal;
  String? get fgcolor;
  String? get number;
  String? get bgcolor;
  String? get tripid;
  String? get stopid;
  double? get runningTime;
  String? get line;
  List<Stop> get stops;
  String? get sbbName;
  DateTime? get departure;
  DateTime? get arrival;
  int get waitTime;
  bool get isaddress;
  Map<String, String> get attributes;
  String get displayName => name.split('@').first;

  LatLon? get position;

  Leg copyWithLatLon({required double lat, required double lon});
}

abstract class Exit = Object with Stop, WithDelayMixin, _ExitMixin;

mixin _ExitMixin {
  String? get sbbName;
  String? get track;
  int get waittime;
  bool get isaddress;
}
