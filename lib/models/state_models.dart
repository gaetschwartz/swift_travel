import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/mocking/mocking.dart';

part 'state_models.freezed.dart';
part 'state_models.g.dart';

@freezed
class LocalRoute with _$LocalRoute {
  @JsonSerializable(includeIfNull: false)
  const factory LocalRoute(
    String from,
    String to, {
    String? displayName,
    DateTime? timestamp,
  }) = _LocalRoute;

  factory LocalRoute.now(
    String from,
    String to, {
    String? displayName,
  }) =>
      _LocalRoute(from, to, displayName: displayName, timestamp: MockableDateTime.now());

  factory LocalRoute.fromRouteConnection(
    RouteConnection connection, {
    DateTime? timestamp,
    String? displayName,
  }) =>
      _LocalRoute(
        connection.from,
        connection.to,
        timestamp: timestamp,
        displayName: displayName,
      );

  factory LocalRoute.fromJson(Map<String, dynamic> json) => _$LocalRouteFromJson(json);
}

@freezed
class FavoriteStop with _$FavoriteStop, BaseStop {
  @JsonSerializable(includeIfNull: false)
  const factory FavoriteStop({
    required String stop,
    required String name,
    String? id,
    @Default(NavigationApi.sbb) NavigationApi api,
  }) = _FavoriteStop;

  factory FavoriteStop.fromStop(String stop, {required NavigationApi api}) =>
      _FavoriteStop(stop: stop, name: stop, api: api);

  factory FavoriteStop.fromCompletion(Completion completion,
          {String? name, required NavigationApi api}) =>
      _FavoriteStop(stop: completion.label, name: name ?? completion.label, api: api);

  factory FavoriteStop.fromJson(Map<String, dynamic> json) => _$FavoriteStopFromJson(json);
}
