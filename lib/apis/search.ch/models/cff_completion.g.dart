// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cff_completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CffCompletion _$_$_CffCompletionFromJson(Map<String, dynamic> json) {
  return _$_CffCompletion(
    label: json['label'] as String,
    dist: (json['dist'] as num)?.toDouble(),
    icon: json['iconclass'] as String,
    html: json['html'] as String,
    id: json['id'] as String,
    favoriteName: json['favoriteName'] as String,
    origin: _$enumDecodeNullable(_$DataOriginEnumMap, json['origin']) ??
        DataOrigin.data,
  );
}

Map<String, dynamic> _$_$_CffCompletionToJson(_$_CffCompletion instance) =>
    <String, dynamic>{
      'label': instance.label,
      'dist': instance.dist,
      'iconclass': instance.icon,
      'html': instance.html,
      'id': instance.id,
      'favoriteName': instance.favoriteName,
      'origin': _$DataOriginEnumMap[instance.origin],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DataOriginEnumMap = {
  DataOrigin.favorites: 'favorites',
  DataOrigin.history: 'history',
  DataOrigin.data: 'data',
  DataOrigin.currentLocation: 'currentLocation',
};
