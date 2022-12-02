// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbCompletion _$$_SbbCompletionFromJson(Map<String, dynamic> json) =>
    _$_SbbCompletion(
      label: json['label'] as String,
      dist: (json['dist'] as num?)?.toDouble(),
      iconClass: json['iconclass'] as String?,
      html: json['html'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_SbbCompletionToJson(_$_SbbCompletion instance) {
  final val = <String, dynamic>{
    'label': instance.label,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dist', instance.dist);
  writeNotNull('iconclass', instance.iconClass);
  writeNotNull('html', instance.html);
  writeNotNull('id', instance.id);
  return val;
}

_$__PlaceTypeIconclass _$$__PlaceTypeIconclassFromJson(
        Map<String, dynamic> json) =>
    _$__PlaceTypeIconclass(
      $enumDecode(_$PlaceTypeEnumMap, json['v']),
    );

Map<String, dynamic> _$$__PlaceTypeIconclassToJson(
        _$__PlaceTypeIconclass instance) =>
    <String, dynamic>{
      'v': _$PlaceTypeEnumMap[instance.v]!,
    };

const _$PlaceTypeEnumMap = {
  PlaceType.address: 'address',
  PlaceType.business: 'business',
  PlaceType.station: 'station',
  PlaceType.unknown: 'unknown',
};
