import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/search.ch/models/exit.dart';
import 'package:swift_travel/apis/search.ch/models/stop.dart';
import 'package:swift_travel/apis/search.ch/models/subsequent_stop.dart';
import 'package:swift_travel/apis/search.ch/models/vehicle_iconclass.dart';

part 'stationboard_connection.freezed.dart';
part 'stationboard_connection.g.dart';

@freezed
abstract class StationboardConnection with _$StationboardConnection {
  @JsonSerializable(explicitToJson: true)
  const factory StationboardConnection(
    DateTime time,
    Vehicle type,
    String color,
    Stop terminal, {
    String line,
    String operator,
    @Default('') String number,
    @JsonKey(name: '*G') String g,
    @JsonKey(name: '*L') String l,
    @JsonKey(name: 'subsequent_stops', defaultValue: []) List<SubsequentStop> subsequentStops,
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson) int depDelay,
    @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson) int arrDelay,
  }) = _StationboardConnection;

  factory StationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$StationboardConnectionFromJson(json);
}
