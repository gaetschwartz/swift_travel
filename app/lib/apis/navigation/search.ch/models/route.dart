import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route_connection.dart';

part 'route.freezed.dart';
part 'route.g.dart';

@freezed
class SbbRoute with _$SbbRoute, NavRoute {
  @JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
  const factory SbbRoute({
    @Default(0)
        int count,
    @JsonKey(name: 'min_duration')
        double? minDuration,
    @JsonKey(name: 'max_duration')
        double? maxDuration,
    @Default(<SbbRouteConnection>[])
    @JsonKey(
      name: 'connections',
      defaultValue: <SbbRouteConnection>[],
    )
        List<SbbRouteConnection> sbbConnections,
    @Default(<String>[])
        List<String> messages,
    String? requestUrl,
    DateTime? dateTime,
  }) = _SbbRoute;
  const SbbRoute._();

  factory SbbRoute.fromJson(Map<String, dynamic> json) => _$SbbRouteFromJson(json);

  @override
  List<RouteConnection> get connections => sbbConnections;
}
