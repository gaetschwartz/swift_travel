// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalRoute _$_$_LocalRouteFromJson(Map<String, dynamic> json) {
  return _$_LocalRoute(
    json['from'] as String,
    json['to'] as String,
    displayName: json['displayName'] as String?,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$_$_LocalRouteToJson(_$_LocalRoute instance) {
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
  return val;
}

_$_FavoriteStop _$_$_FavoriteStopFromJson(Map<String, dynamic> json) {
  return _$_FavoriteStop(
    stop: json['stop'] as String,
    name: json['name'] as String,
    id: json['id'] as String?,
    api: _$enumDecodeNullable(_$NavigationApiEnumMap, json['api']) ??
        NavigationApi.sbb,
  );
}

Map<String, dynamic> _$_$_FavoriteStopToJson(_$_FavoriteStop instance) {
  final val = <String, dynamic>{
    'stop': instance.stop,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['api'] = _$NavigationApiEnumMap[instance.api];
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$NavigationApiEnumMap = {
  NavigationApi.sbb: 'sbb',
  NavigationApi.sncf: 'sncf',
};
