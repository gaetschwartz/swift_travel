import 'package:freezed_annotation/freezed_annotation.dart';

import 'favorite_stop.dart';

part 'local_route.freezed.dart';
part 'local_route.g.dart';

@freezed
abstract class LocalRoute with _$LocalRoute implements Favorite {
  factory LocalRoute(
    String from,
    String to, {
    String displayName,
  }) = _LocalRoute;

  factory LocalRoute.fromJson(Map<String, dynamic> json) => _$LocalRouteFromJson(json);
}