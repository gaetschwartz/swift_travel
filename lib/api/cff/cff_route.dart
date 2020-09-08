import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_free/api/cff/route_connection.dart';

part 'cff_route.freezed.dart';
part 'cff_route.g.dart';

@freezed
abstract class CffRoute with _$CffRoute {
  @JsonSerializable(explicitToJson: true)
  factory CffRoute({
    int count,
    int minDuration,
    int maxDuration,
    List<RouteConnection> connections,
  }) = _CffRoute;

  factory CffRoute.fromJson(Map<String, dynamic> json) => _$CffRouteFromJson(json);
}
