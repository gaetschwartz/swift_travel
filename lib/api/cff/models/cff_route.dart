import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swiss_travel/api/cff/models/route_connection.dart';

part 'cff_route.freezed.dart';
part 'cff_route.g.dart';

@freezed
abstract class CffRoute with _$CffRoute {
  @JsonSerializable(explicitToJson: true)
  factory CffRoute({
    int count,
    @JsonKey(name: "min_duration") double minDuration,
    @JsonKey(name: "max_duration") double maxDuration,
    @Default([]) List<RouteConnection> connections,
  }) = _CffRoute;

  factory CffRoute.fromJson(Map<String, dynamic> json) => _$CffRouteFromJson(json);
}
