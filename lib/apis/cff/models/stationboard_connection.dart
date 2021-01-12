import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/cff/models/exit.dart';
import 'package:swift_travel/apis/cff/models/stop.dart';
import 'package:swift_travel/apis/cff/models/subsequent_stop.dart';
import 'package:swift_travel/apis/cff/models/types_enum.dart';

part 'stationboard_connection.freezed.dart';
part 'stationboard_connection.g.dart';

@freezed
abstract class StationboardConnection with _$StationboardConnection {
  @JsonSerializable(explicitToJson: true)
  factory StationboardConnection(
    DateTime time,
    Vehicle type,
    String line,
    String color,
    Stop terminal,
    String operator, {
    @Default("") String number,
    @JsonKey(name: '*G') String g,
    @JsonKey(name: '*L') String l,
    @JsonKey(name: 'subsequent_stops', defaultValue: []) List<SubsequentStop> subsequentStops,
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson) int depDelay,
    @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson) int arrDelay,
  }) = _StationboardConnection;

  factory StationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$StationboardConnectionFromJson(json);
}
