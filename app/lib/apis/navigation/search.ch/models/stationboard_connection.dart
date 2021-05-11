import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';

import 'exit.dart';
import 'stop.dart';
import 'subsequent_stop.dart';

part 'stationboard_connection.freezed.dart';
part 'stationboard_connection.g.dart';

@freezed
class SbbStationboardConnection with _$SbbStationboardConnection, StationboardConnection {
  @JsonSerializable(explicitToJson: true, checked: true)
  const factory SbbStationboardConnection({
    required DateTime time,
    required Vehicle type,
    required String color,
    @JsonKey(name: 'terminal') required SbbStop sbbTerminal,
    String? line,
    @JsonKey(name: 'operator') String? operator,
    @Default('') String number,
    @JsonKey(name: '*G') String? g,
    @JsonKey(name: '*L') String? l,
    @JsonKey(name: 'subsequent_stops', defaultValue: <SbbSubsequentStop>[])
    @Default(<SbbSubsequentStop>[])
        List<SbbSubsequentStop> sbbSubsequentStops,
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
    @Default(0)
        int depDelay,
    @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
    @Default(0)
        int arrDelay,
  }) = _SbbStationboardConnection;
  const SbbStationboardConnection._();

  factory SbbStationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$SbbStationboardConnectionFromJson(json);

  @override
  List<DelayedStop> get subsequentStops => sbbSubsequentStops;

  @override
  Stop get terminal => sbbTerminal;
}
