import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route_connection.dart';

part 'route.freezed.dart';
part 'route.g.dart';

@freezed
class CffRoute with _$CffRoute, NavRoute {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory CffRoute({
    @Default(0) int count,
    @JsonKey(name: 'min_duration') double? minDuration,
    @JsonKey(name: 'max_duration') double? maxDuration,
    @JsonKey(name: 'connections')
    @Default(<SbbRouteConnection>[])
        List<SbbRouteConnection> sbbConnections,
    @Default(<String>[]) List<String> messages,
    String? requestUrl,
    DateTime? dateTime,
  }) = _CffRoute;
  const CffRoute._();

  factory CffRoute.fromJson(Map<String, dynamic> json) => _$CffRouteFromJson(json);

  @override
  List<RouteConnection> get connections => sbbConnections;
}
