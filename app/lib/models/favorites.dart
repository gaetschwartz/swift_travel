import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';

part 'favorites.freezed.dart';
part 'favorites.g.dart';

class LocalRouteConverter implements JsonConverter<LocalRoute, Map<String, dynamic>> {
  const LocalRouteConverter();

  static const key = 'runtimeType';

  @override
  LocalRoute fromJson(Map<String, dynamic> json) {
    final type = json[key] as Object?;
    if (type == null) {
      try {
        return LocalRouteV1.fromJson(json);
      } catch (_) {
        throw FormatException('Failed to decode LocalRoute json', json, 0);
      }
    }
    try {
      return _$LocalRouteFromJson(json);
    } catch (_) {
      throw FormatException('Failed to decode LocalRoute json', json, 0);
    }
  }

  @override
  Map<String, dynamic> toJson(LocalRoute object) => object.toJson();
}

@Freezed(unionKey: LocalRouteConverter.key)
class LocalRoute with _$LocalRoute {
  const LocalRoute._();

  @JsonSerializable(includeIfNull: false)
  const factory LocalRoute.v1(
    String from,
    String to, {
    String? displayName,
    DateTime? timestamp,
  }) = LocalRouteV1;

  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory LocalRoute.v2(
    SbbStop from,
    SbbStop to, {
    String? displayName,
    DateTime? timestamp,
  }) = LocalRouteV2;

  factory LocalRoute.fromRouteConnection(
    RouteConnection connection, {
    String? displayName,
  }) =>
      LocalRoute.v2(
        SbbStop(
          connection.from,
          lat: connection.legs.firstOrNull?.position?.lat,
          lon: connection.legs.firstOrNull?.position?.lon,
        ),
        SbbStop(
          connection.to,
          lat: connection.legs.lastOrNull?.position?.lat,
          lon: connection.legs.lastOrNull?.position?.lon,
        ),
        timestamp: connection.departure,
        displayName: displayName,
      );

  factory LocalRoute.fromJson(Map<String, dynamic> json) =>
      const LocalRouteConverter().fromJson(json);

  String get fromAsString => map(v1: (v1) => v1.from, v2: (v2) => v2.from.name);
  String get toAsString => map(v1: (v1) => v1.to, v2: (v2) => v2.to.name);

  LocalRoute copyClean() => map(
        v1: (v1) => LocalRoute.v1(v1.from, v1.to),
        v2: (v2) => LocalRoute.v2(v2.from, v2.to),
      );
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

  const FavoriteStop._();

  factory FavoriteStop.fromStop(String stop, {required NavigationApi api}) =>
      _FavoriteStop(stop: stop, name: stop, api: api);

  factory FavoriteStop.fromCompletion(
    Completion completion, {
    required NavigationApi api,
    String? name,
  }) =>
      _FavoriteStop(stop: completion.label, name: name ?? completion.label, api: api);

  factory FavoriteStop.fromJson(Map<String, dynamic> json) => _$FavoriteStopFromJson(json);
}
