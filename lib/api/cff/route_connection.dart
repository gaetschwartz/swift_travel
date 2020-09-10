import 'package:freezed_annotation/freezed_annotation.dart';

import 'leg.dart';

part 'route_connection.freezed.dart';
part 'route_connection.g.dart';

@freezed
abstract class RouteConnection with _$RouteConnection {
  @JsonSerializable(explicitToJson: true)
  factory RouteConnection({
    String from,
    DateTime arrival,
    @Default([]) List<Leg> legs,
    int duration,
    String to,
    DateTime departure,
  }) = _RouteConnection;

  factory RouteConnection.fromJson(Map<String, dynamic> json) => _$RouteConnectionFromJson(json);
}
