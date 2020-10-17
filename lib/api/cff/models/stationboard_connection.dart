import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swiss_travel/api/cff/models/stop.dart';
import 'package:swiss_travel/api/cff/models/subsequent_stop.dart';
import 'package:swiss_travel/api/cff/models/terminal.dart';
import 'package:swiss_travel/api/cff/models/types_enum.dart';

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
    String number,
    Stop terminal,
    String operator, {
    @JsonKey(name: "*G") String g,
    @JsonKey(name: "*L") String l,
    @Default([]) @JsonKey(name: "subsequent_stops") List<SubsequentStop> subsequentStops,
  }) = _StationboardConnection;

  factory StationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$StationboardConnectionFromJson(json);
}
