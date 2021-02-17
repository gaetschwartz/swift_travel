// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NavCompletion _$_$_NavCompletionFromJson(Map<String, dynamic> json) {
  return _$_NavCompletion(
    label: json['label'] as String,
    dist: (json['dist'] as num?)?.toDouble(),
    icon: json['iconclass'] as String?,
    html: json['html'] as String?,
    id: json['id'] as String?,
    favoriteName: json['favoriteName'] as String?,
    origin: _$enumDecodeNullable(_$DataOriginEnumMap, json['origin']) ??
        DataOrigin.data,
  );
}

Map<String, dynamic> _$_$_NavCompletionToJson(_$_NavCompletion instance) {
  final val = <String, dynamic>{
    'label': instance.label,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dist', instance.dist);
  writeNotNull('iconclass', instance.icon);
  writeNotNull('html', instance.html);
  writeNotNull('id', instance.id);
  writeNotNull('favoriteName', instance.favoriteName);
  val['origin'] = _$DataOriginEnumMap[instance.origin];
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

const _$DataOriginEnumMap = {
  DataOrigin.favorites: 'favorites',
  DataOrigin.history: 'history',
  DataOrigin.data: 'data',
  DataOrigin.currentLocation: 'currentLocation',
  DataOrigin.prediction: 'prediction',
};
