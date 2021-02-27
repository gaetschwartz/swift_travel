import 'package:swift_travel/apis/data.sbb.ch/models/sbb_models.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';

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
  double? get lat;
  double? get lon;
  LatLon? get position;

  Leg copyWithLatLon({required double lat, required double lon});
}

mixin Exit {
  int get arrDelay;
  String get name;
  DateTime? get arrival;
  double? get lat;
  double? get lon;
  String? get sbbName;
  String? get stopid;
  String? get track;
  int get waittime;
  bool get isaddress;

  LatLon? get position;
}
