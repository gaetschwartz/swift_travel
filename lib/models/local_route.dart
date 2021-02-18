import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route_connection.dart';
import 'package:swift_travel/mocking/mocking.dart';

part 'local_route.freezed.dart';
part 'local_route.g.dart';

@freezed
abstract class LocalRoute with _$LocalRoute {
  @JsonSerializable(includeIfNull: false)
  const factory LocalRoute(
    String from,
    String to, {
    String? displayName,
    DateTime? timestamp,
  }) = _LocalRoute;

  factory LocalRoute.now(
    String from,
    String to, {
    String? displayName,
  }) =>
      _LocalRoute(from, to, displayName: displayName, timestamp: MockableDateTime.now());

  factory LocalRoute.fromRouteConnection(
    RouteConnection connection, {
    DateTime? timestamp,
    String? displayName,
  }) =>
      _LocalRoute(
        connection.from,
        connection.to,
        timestamp: timestamp,
        displayName: displayName,
      );

  factory LocalRoute.fromJson(Map<String, dynamic> json) => _$LocalRouteFromJson(json);
}
