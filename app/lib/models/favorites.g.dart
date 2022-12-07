// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalRouteV1 _$$LocalRouteV1FromJson(Map<String, dynamic> json) =>
    _$LocalRouteV1(
      json['from'] as String,
      json['to'] as String,
      displayName: json['displayName'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LocalRouteV1ToJson(_$LocalRouteV1 instance) {
  final val = <String, dynamic>{
    'from': instance.from,
    'to': instance.to,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('displayName', instance.displayName);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  val['runtimeType'] = instance.$type;
  return val;
}

_$LocalRouteV2 _$$LocalRouteV2FromJson(Map<String, dynamic> json) =>
    _$LocalRouteV2(
      SbbStop.fromJson(json['from'] as Map<String, dynamic>),
      SbbStop.fromJson(json['to'] as Map<String, dynamic>),
      displayName: json['displayName'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LocalRouteV2ToJson(_$LocalRouteV2 instance) {
  final val = <String, dynamic>{
    'from': instance.from.toJson(),
    'to': instance.to.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('displayName', instance.displayName);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  val['runtimeType'] = instance.$type;
  return val;
}

_$_FavoriteStop _$$_FavoriteStopFromJson(Map<String, dynamic> json) =>
    _$_FavoriteStop(
      stop: json['stop'] as String,
      name: json['name'] as String,
      api: json['api'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_FavoriteStopToJson(_$_FavoriteStop instance) {
  final val = <String, dynamic>{
    'stop': instance.stop,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('api', instance.api);
  writeNotNull('id', instance.id);
  return val;
}

_$_FavoriteUnionStop _$$_FavoriteUnionStopFromJson(Map<String, dynamic> json) =>
    _$_FavoriteUnionStop(
      FavoriteStop.fromJson(json['stop'] as Map<String, dynamic>),
      json['id'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_FavoriteUnionStopToJson(
        _$_FavoriteUnionStop instance) =>
    <String, dynamic>{
      'stop': instance.stop,
      'id': instance.id,
      'runtimeType': instance.$type,
    };

_$_FavoriteUnionRoute _$$_FavoriteUnionRouteFromJson(
        Map<String, dynamic> json) =>
    _$_FavoriteUnionRoute(
      LocalRoute.fromJson(json['route'] as Map<String, dynamic>),
      json['id'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_FavoriteUnionRouteToJson(
        _$_FavoriteUnionRoute instance) =>
    <String, dynamic>{
      'route': instance.route,
      'id': instance.id,
      'runtimeType': instance.$type,
    };

_$QuickActionsFavoriteItemFavorite _$$QuickActionsFavoriteItemFavoriteFromJson(
        Map<String, dynamic> json) =>
    _$QuickActionsFavoriteItemFavorite(
      Favorite.fromJson(json['favorite'] as Map<String, dynamic>),
      present: json['present'] as bool? ?? true,
      index: json['index'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QuickActionsFavoriteItemFavoriteToJson(
        _$QuickActionsFavoriteItemFavorite instance) =>
    <String, dynamic>{
      'favorite': instance.favorite,
      'present': instance.present,
      'index': instance.index,
      'runtimeType': instance.$type,
    };

_$QuickActionsFavoriteItemDivider _$$QuickActionsFavoriteItemDividerFromJson(
        Map<String, dynamic> json) =>
    _$QuickActionsFavoriteItemDivider(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QuickActionsFavoriteItemDividerToJson(
        _$QuickActionsFavoriteItemDivider instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
