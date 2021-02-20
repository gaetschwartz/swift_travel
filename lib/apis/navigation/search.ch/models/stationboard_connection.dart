import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/exit.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/subsequent_stop.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';

part 'stationboard_connection.freezed.dart';
part 'stationboard_connection.g.dart';

@freezed
class SbbStationboardConnection with _$SbbStationboardConnection, StationboardConnection {
  @JsonSerializable(explicitToJson: true)
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
  List<SubsequentStop> get subsequentStops => sbbSubsequentStops;

  @override
  Stop get terminal => sbbTerminal;
}
