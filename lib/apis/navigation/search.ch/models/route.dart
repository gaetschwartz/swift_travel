import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route_connection.dart';

part 'route.freezed.dart';
part 'route.g.dart';

@freezed
abstract class CffRoute with _$CffRoute {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory CffRoute({
    @Default(0) int count,
    @JsonKey(name: 'min_duration') double? minDuration,
    @JsonKey(name: 'max_duration') double? maxDuration,
    @Default(<RouteConnection>[]) List<RouteConnection> connections,
    @Default(<String>[]) List<String> messages,
    String? requestUrl,
    DateTime? dateTime,
  }) = _CffRoute;

  factory CffRoute.fromJson(Map<String, dynamic> json) => _$CffRouteFromJson(json);
}
