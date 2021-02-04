import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/search.ch/models/route_connection.dart';

part 'local_route.freezed.dart';
part 'local_route.g.dart';

@freezed
abstract class LocalRoute implements _$LocalRoute {
  @JsonSerializable(includeIfNull: false)
  const factory LocalRoute(
    String from,
    String to, {
    String displayName,
    DateTime timestamp,
  }) = _LocalRoute;

  factory LocalRoute.now(
    String from,
    String to, {
    String displayName,
  }) =>
      _LocalRoute(from, to, displayName: displayName, timestamp: DateTime.now());

  // ignore: unused_element
  const LocalRoute._();

  factory LocalRoute.fromRouteConnection(
    RouteConnection connection, {
    DateTime timestamp,
  }) =>
      _LocalRoute(
        connection.from,
        connection.to,
        timestamp: timestamp,
      );

  factory LocalRoute.fromJson(Map<String, dynamic> json) => _$LocalRouteFromJson(json);

  LocalRoute get reversed => LocalRoute(to, from, displayName: displayName);
}
