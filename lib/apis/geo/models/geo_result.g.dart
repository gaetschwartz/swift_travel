// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeoResult _$_$_GeoResultFromJson(Map<String, dynamic> json) {
  return _$_GeoResult(
    id: json['id'] as int,
    weight: json['weight'] as int,
    attrs: json['attrs'] == null ? null : GeoAttr.fromJson(json['attrs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_GeoResultToJson(_$_GeoResult instance) => <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'attrs': instance.attrs?.toJson(),
    };
