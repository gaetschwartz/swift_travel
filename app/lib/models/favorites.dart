import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/base.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stop.dart';
import 'package:swift_travel/db/db.dart';

part 'favorites.freezed.dart';
part 'favorites.g.dart';

class LocalRouteConverter
    implements JsonConverter<LocalRoute, Map<String, dynamic>> {
  const LocalRouteConverter();

  static const key = 'runtimeType';

  @override
  LocalRoute fromJson(Map<String, dynamic> json) {
    final type = json[key] as Object?;
    if (type == null) {
      return LocalRouteV1.fromJson(json);
    }
    return _$LocalRouteFromJson(json);
  }

  @override
  Map<String, dynamic> toJson(LocalRoute object) => object.toJson();
}

@Freezed(unionKey: LocalRouteConverter.key)
class LocalRoute with _$LocalRoute {
  const LocalRoute._();

  @JsonSerializable(includeIfNull: false)
  @Deprecated('Use v2')
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

  factory LocalRoute.simple(
    String from,
    String to, {
    String? displayName,
    DateTime? timestamp,
  }) =>
      LocalRoute.v2(
        SbbStop(name: from),
        SbbStop(name: to),
        displayName: displayName,
        timestamp: timestamp,
      );

  factory LocalRoute.fromRouteConnection(
    RouteConnection connection, {
    String? displayName,
  }) =>
      LocalRoute.v2(
        SbbStop(
          name: connection.from,
          lat: connection.legs.firstOrNull?.position?.lat,
          lon: connection.legs.firstOrNull?.position?.lon,
        ),
        SbbStop(
          name: connection.to,
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
        v1: (v1) => LocalRoute.v2(SbbStop(name: v1.from), SbbStop(name: v1.to)),
        v2: (v2) => LocalRoute.v2(v2.from, v2.to),
      );

  LocalRoute get flipped => map(
        v1: (v1) => v1.copyWith(from: v1.to, to: v1.from),
        v2: (v2) => v2.copyWith(from: v2.to, to: v2.from),
      );

  String toPrettyString([String separator = ' → ']) =>
      '$fromAsString$separator$toAsString';
}

@freezed
class FavoriteStop with _$FavoriteStop, BaseStop, SbbDisplayNameMixin {
  @JsonSerializable(includeIfNull: false)
  const factory FavoriteStop({
    required String stop,
    required String name,
    String? api,
    String? id,
  }) = _FavoriteStop;

  const FavoriteStop._();

  factory FavoriteStop.fromStop(String stop, {required NavigationApiId api}) =>
      _FavoriteStop(stop: stop, name: stop, api: api.value);

  factory FavoriteStop.fromCompletion(
    NavigationCompletion completion, {
    required NavigationApiId api,
    String? name,
  }) =>
      _FavoriteStop(
          stop: completion.label,
          name: name ?? completion.label,
          api: api.value);

  factory FavoriteStop.fromJson(Map<String, dynamic> json) =>
      _$FavoriteStopFromJson(json);
}

@freezed
class Favorite with _$Favorite {
  const factory Favorite.stop(FavoriteStop stop, int id) = _FavoriteUnionStop;
  const factory Favorite.route(LocalRoute route, int id) = _FavoriteUnionRoute;

  factory Favorite.fromStopWithId(DataWithId<FavoriteStop> stop) =>
      Favorite.stop(stop.data, stop.id);

  factory Favorite.fromRouteWithId(DataWithId<LocalRoute> route) =>
      Favorite.route(route.data, route.id);

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}

@freezed
class QuickActionsFavoriteItem with _$QuickActionsFavoriteItem {
  const factory QuickActionsFavoriteItem.favorite(
    Favorite favorite, {
    @Default(true) bool present,
    required int index,
  }) = QuickActionsFavoriteItemFavorite;
  const factory QuickActionsFavoriteItem.divider() =
      QuickActionsFavoriteItemDivider;

  factory QuickActionsFavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$QuickActionsFavoriteItemFromJson(json);
}
