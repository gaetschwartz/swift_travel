import 'package:freezed_annotation/freezed_annotation.dart';

import 'leg.dart';

part 'route_connection.freezed.dart';
part 'route_connection.g.dart';

@freezed
abstract class RouteConnection with _$RouteConnection {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  factory RouteConnection({
    String from,
    DateTime departure,
    String to,
    DateTime arrival,
    double duration,
    @Default([]) List<Leg> legs,
  }) = _RouteConnection;

  factory RouteConnection.fromJson(Map<String, dynamic> json) => _$RouteConnectionFromJson(json);
}
