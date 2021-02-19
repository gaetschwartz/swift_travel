// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoriteStop _$_$_FavoriteStopFromJson(Map<String, dynamic> json) {
  return _$_FavoriteStop(
    stop: json['stop'] as String,
    name: json['name'] as String,
    api: _$enumDecodeNullable(_$NavigationApiEnumMap, json['api']) ??
        NavigationApi.sbb,
  );
}

Map<String, dynamic> _$_$_FavoriteStopToJson(_$_FavoriteStop instance) =>
    <String, dynamic>{
      'stop': instance.stop,
      'name': instance.name,
      'api': _$NavigationApiEnumMap[instance.api],
    };

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
