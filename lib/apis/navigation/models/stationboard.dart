import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';

mixin StationBoard {
  TResult mapBoard<TResult>(
    TResult Function(StationboardData board) onData, {
    required TResult Function(StationboardError e) onError,
  });
}

mixin StationboardError {
  List<String> get messages;
}

mixin StationboardData {
  Stop get stop;
  List<StationboardConnection> get connections;
  String get stopName;
}

mixin Stop {
  String get name;
  String? get id;
  String? get stopid;
  DateTime? get departure;
  double? get lat;
  double? get lon;
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
