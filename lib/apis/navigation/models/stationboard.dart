import 'package:swift_travel/apis/data.sbb.ch/models/sbb_models.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';

mixin StationBoard {
  Stop get stop;
  List<StationboardConnection> get connections;
  String get stopName;
  List<Object> get messages;
  bool get hasError;
}

mixin BaseStop {
  String get name;
  String? get id;
}
mixin Stop {
  String get name;
  String? get id;
  String? get stopid;
  DateTime? get departure;
  double? get lat;
  double? get lon;
  LatLon? get position;
}

mixin StationboardConnection {
  DateTime get time;
  Vehicle get type;
  String get color;
  Stop get terminal;
  String? get line;
  String? get operator;
  String get number;
  String? get g;
  String? get l;

  List<SubsequentStop> get subsequentStops;

  int get depDelay;

  int get arrDelay;
}
mixin SubsequentStop {
  String get name;
  String? get id;
  DateTime? get dep;
  DateTime? get arr;
  double? get lat;
  double? get lon;
  int get depDelay;
  int get arrDelay;
}
