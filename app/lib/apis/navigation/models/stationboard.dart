import 'dart:ui';

import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

mixin StationBoard {
  Stop get stop;
  List<StationboardConnection> get connections;
  String get stopName;
  List<Object> get errors;
  bool get hasError;
}

mixin BaseStop {
  String get name;
  String? get id;
  String get displayName;
}

abstract class Stop with BaseStop, WithTimeMixin, LocatedMixin {}

mixin WithTimeMixin {
  DateTime? get departure;
  DateTime? get arrival;
}

mixin BaseStationboardConnection {
  DateTime get time;
  TransportationMode get type;

  @Deprecated("Use bgcolor and fgcolor")
  String get color;

  Color? get bgcolor;
  Color? get fgcolor;

  Stop get terminal;
  String? get line;
  String? get operator;
  String get number;
  String? get g;
  String? get l;
  String? get track;

  List<DelayedStop> get subsequentStops;
}

abstract class StationboardConnection with BaseStationboardConnection, WithDelayMixin {}

abstract class DelayedStop with WithDelayMixin implements Stop {}

mixin WithDelayMixin {
  int? get depDelay;
  int? get arrDelay;
}

mixin LocatedMixin {
  double? get lat;
  double? get lon;

  LatLon? get position;
}

abstract class Exit with WithDelayMixin, _ExitMixin implements Stop {}

mixin _ExitMixin {
  String? get officialName;
  String? get track;
  int get waitTime;
  bool get isAddress;
}
