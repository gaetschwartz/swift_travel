// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalRouteV1Impl _$$LocalRouteV1ImplFromJson(Map<String, dynamic> json) =>
    _$LocalRouteV1Impl(
      json['from'] as String,
      json['to'] as String,
      displayName: json['displayName'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LocalRouteV1ImplToJson(_$LocalRouteV1Impl instance) {
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

_$LocalRouteV2Impl _$$LocalRouteV2ImplFromJson(Map<String, dynamic> json) =>
    _$LocalRouteV2Impl(
      SchStop.fromJson(json['from'] as Map<String, dynamic>),
      SchStop.fromJson(json['to'] as Map<String, dynamic>),
      displayName: json['displayName'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LocalRouteV2ImplToJson(_$LocalRouteV2Impl instance) {
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

_$FavoriteStopImpl _$$FavoriteStopImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteStopImpl(
      stop: json['stop'] as String,
      name: json['name'] as String,
      api: json['api'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$FavoriteStopImplToJson(_$FavoriteStopImpl instance) {
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

_$FavoriteUnionStopImpl _$$FavoriteUnionStopImplFromJson(
        Map<String, dynamic> json) =>
    _$FavoriteUnionStopImpl(
      FavoriteStop.fromJson(json['stop'] as Map<String, dynamic>),
      id: json['id'] as int,
      quickActionsIndex: json['quickActionsIndex'] as int?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FavoriteUnionStopImplToJson(
        _$FavoriteUnionStopImpl instance) =>
    <String, dynamic>{
      'stop': instance.stop.toJson(),
      'id': instance.id,
      'quickActionsIndex': instance.quickActionsIndex,
      'runtimeType': instance.$type,
    };

_$FavoriteUnionRouteImpl _$$FavoriteUnionRouteImplFromJson(
        Map<String, dynamic> json) =>
    _$FavoriteUnionRouteImpl(
      LocalRoute.fromJson(json['route'] as Map<String, dynamic>),
      id: json['id'] as int,
      quickActionsIndex: json['quickActionsIndex'] as int?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FavoriteUnionRouteImplToJson(
        _$FavoriteUnionRouteImpl instance) =>
    <String, dynamic>{
      'route': instance.route.toJson(),
      'id': instance.id,
      'quickActionsIndex': instance.quickActionsIndex,
      'runtimeType': instance.$type,
    };

_$FavoriteUnionStationTabsCurrentLocationImpl
    _$$FavoriteUnionStationTabsCurrentLocationImplFromJson(
            Map<String, dynamic> json) =>
        _$FavoriteUnionStationTabsCurrentLocationImpl(
          id: json['id'] as int,
          quickActionsIndex: json['quickActionsIndex'] as int?,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$FavoriteUnionStationTabsCurrentLocationImplToJson(
        _$FavoriteUnionStationTabsCurrentLocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quickActionsIndex': instance.quickActionsIndex,
      'runtimeType': instance.$type,
    };

_$QuickActionsFavoriteItemImpl _$$QuickActionsFavoriteItemImplFromJson(
        Map<String, dynamic> json) =>
    _$QuickActionsFavoriteItemImpl(
      QuickActionsItem.fromJson(json['item'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QuickActionsFavoriteItemImplToJson(
        _$QuickActionsFavoriteItemImpl instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'runtimeType': instance.$type,
    };

_$QuickActionsFavoriteDividerImpl _$$QuickActionsFavoriteDividerImplFromJson(
        Map<String, dynamic> json) =>
    _$QuickActionsFavoriteDividerImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QuickActionsFavoriteDividerImplToJson(
        _$QuickActionsFavoriteDividerImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
