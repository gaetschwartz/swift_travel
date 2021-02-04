import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/search.ch/models/route_connection.dart';

part 'local_route.freezed.dart';
part 'local_route.g.dart';

@freezed
abstract class LocalRoute with _$LocalRoute {
  const factory LocalRoute(
    String from,
    String to, {
    String displayName,
  }) = _LocalRoute;

  factory LocalRoute.fromRouteConnection(RouteConnection connection) =>
      _LocalRoute(connection.from, connection.to);

  factory LocalRoute.fromJson(Map<String, dynamic> json) => _$LocalRouteFromJson(json);
}
