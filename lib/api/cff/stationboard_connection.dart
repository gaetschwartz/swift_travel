import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_free/api/cff/terminal.dart';

part 'stationboard_connection.freezed.dart';
part 'stationboard_connection.g.dart';

@freezed
abstract class StationboardConnection with _$StationboardConnection {
  @JsonSerializable(explicitToJson: true)
  factory StationboardConnection(
    DateTime time,
    String type,
    String line,
    String color,
    String number,
    Terminal terminal,
    String operator, {
    @JsonKey(name: "*G") String g,
    @JsonKey(name: "*L") String l,
  }) = _StationboardConnection;

  factory StationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$StationboardConnectionFromJson(json);
}
