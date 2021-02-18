import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/disruption.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/exit.dart';

import 'leg.dart';

part 'route_connection.freezed.dart';
part 'route_connection.g.dart';

@freezed
abstract class RouteConnection with _$RouteConnection {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory RouteConnection({
    required String from,
    required String to,
    DateTime? departure,
    DateTime? arrival,
    double? duration,
    @Default(<Leg>[]) List<Leg> legs,
    @Default(<String, Disruption>{}) Map<String, Disruption> disruptions,
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson) required int depDelay,
  }) = _RouteConnection;

  factory RouteConnection.fromJson(Map<String, dynamic> json) => _$RouteConnectionFromJson(json);
}
