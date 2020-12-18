import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/cff/models/disruption.dart';

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
    @Default({}) Map<String, Disruption> disruptions,
    @JsonKey(name: 'dep_delay') String depDelay,
  }) = _RouteConnection;

  factory RouteConnection.fromJson(Map<String, dynamic> json) => _$RouteConnectionFromJson(json);
}
