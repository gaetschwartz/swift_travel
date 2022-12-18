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
        SbbStop(sbbName: from),
        SbbStop(sbbName: to),
        displayName: displayName,
        timestamp: timestamp,
      );

  factory LocalRoute.fromRouteConnection(
    RouteConnection connection, {
    String? displayName,
  }) =>
      LocalRoute.v2(
        SbbStop(
          sbbName: connection.from,
          lat: connection.legs.firstOrNull?.position?.lat,
          lon: connection.legs.firstOrNull?.position?.lon,
        ),
        SbbStop(
          sbbName: connection.to,
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
        v1: (v1) =>
            LocalRoute.v2(SbbStop(sbbName: v1.from), SbbStop(sbbName: v1.to)),
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
        api: api.value,
      );

  factory FavoriteStop.fromJson(Map<String, dynamic> json) =>
      _$FavoriteStopFromJson(json);
}

@freezed
class QuickActionsItem with _$QuickActionsItem {
  const factory QuickActionsItem.stop(
    FavoriteStop stop, {
    required int id,
    int? quickActionsIndex,
  }) = FavoriteUnionStop;

  const factory QuickActionsItem.route(
    LocalRoute route, {
    required int id,
    int? quickActionsIndex,
  }) = FavoriteUnionRoute;

  const factory QuickActionsItem.stationTabsCurrentLocation({
    required int id,
    int? quickActionsIndex,
  }) = FavoriteUnionStationTabsCurrentLocation;

  static const stationTabsCurrentLocationId = 0;

  factory QuickActionsItem.fromStopWithId(DataWithId<FavoriteStop> stop,
          {int? quickActionsIndex}) =>
      QuickActionsItem.stop(
        stop.data,
        id: stop.id,
        quickActionsIndex: quickActionsIndex,
      );

  factory QuickActionsItem.fromRouteWithId(DataWithId<LocalRoute> route,
          {int? quickActionsIndex}) =>
      QuickActionsItem.route(
        route.data,
        id: route.id,
        quickActionsIndex: quickActionsIndex,
      );

  factory QuickActionsItem.fromJson(Map<String, dynamic> json) =>
      _$QuickActionsItemFromJson(json);

  const QuickActionsItem._();

  bool get isStop => this is FavoriteUnionStop;
  bool get isRoute => this is FavoriteUnionRoute;
}

@freezed
class QuickActionsReorderableItem with _$QuickActionsReorderableItem {
  const factory QuickActionsReorderableItem.item(QuickActionsItem item) =
      QuickActionsFavoriteItem;
  const factory QuickActionsReorderableItem.divider() =
      QuickActionsFavoriteDivider;

  factory QuickActionsReorderableItem.fromJson(Map<String, dynamic> json) =>
      _$QuickActionsReorderableItemFromJson(json);
}
