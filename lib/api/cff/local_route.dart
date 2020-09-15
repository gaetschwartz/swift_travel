import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_route.freezed.dart';
part 'local_route.g.dart';

@freezed
abstract class LocalRoute with _$LocalRoute {
  factory LocalRoute(
    String from,
    String to,
  ) = _LocalRoute;

  factory LocalRoute.fromJson(Map<String, dynamic> json) => _$LocalRouteFromJson(json);
}
