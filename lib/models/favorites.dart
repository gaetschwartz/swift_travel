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

  @override
  LocalRoute fromJson(Map<String, dynamic> json) {
    final int version = json['version'] ?? 1;
    switch (version) {
      case 1:
        return LocalRouteV1.fromJson(json);
      case 2:
        return LocalRouteV2.fromJson(json);
      default:
        throw UnsupportedError('Unsupported version for LocalRoute: `$version`');
    }
  }

  @override
  Map<String, dynamic> toJson(LocalRoute object) {
    return object.toJson();
  }
}

@freezed
class LocalRoute with _$LocalRoute {
  const LocalRoute._();

  @JsonSerializable(includeIfNull: false)
  const factory LocalRoute.v1(
    String from,
    String to, {
    String? displayName,
    DateTime? timestamp,
    @Default(1) int version,
  }) = LocalRouteV1;

  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory LocalRoute.v2(
    SbbStop from,
    SbbStop to, {
    String? displayName,
    DateTime? timestamp,
    @Default(2) int version,
  }) = LocalRouteV2;

  factory LocalRoute.fromRouteConnection(
    RouteConnection connection, {
    DateTime? timestamp,
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
          lat: connection.legs.lastOrNull?.exit?.position?.lat,
          lon: connection.legs.lastOrNull?.exit?.position?.lon,
        ),
        timestamp: timestamp,
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

  factory FavoriteStop.fromCompletion(Completion completion,
          {String? name, required NavigationApi api}) =>
      _FavoriteStop(stop: completion.label, name: name ?? completion.label, api: api);

  factory FavoriteStop.fromJson(Map<String, dynamic> json) => _$FavoriteStopFromJson(json);
}
