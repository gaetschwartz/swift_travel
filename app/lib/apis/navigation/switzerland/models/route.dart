import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';

import 'route_connection.dart';

part 'route.freezed.dart';
part 'route.g.dart';

@freezed
class SchRoute with _$SchRoute, NavRoute {
  @JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
  const factory SchRoute({
    @Default(0)
        int count,
    @JsonKey(name: 'min_duration')
        double? minDuration,
    @JsonKey(name: 'max_duration')
        double? maxDuration,
    @Default(<SchRouteConnection>[])
    @JsonKey(
      name: 'connections',
      defaultValue: <SchRouteConnection>[],
    )
        List<SchRouteConnection> sbbConnections,
    @Default(<String>[])
        List<String> messages,
    String? requestUrl,
    DateTime? dateTime,
  }) = _SchRoute;
  const SchRoute._();

  factory SchRoute.fromJson(Map<String, dynamic> json) =>
      _$SchRouteFromJson(json);

  @override
  List<RouteConnection> get connections => sbbConnections;
}
