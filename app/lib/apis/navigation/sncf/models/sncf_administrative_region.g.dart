// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sncf_administrative_region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SncfAdministrativeRegion _$$_SncfAdministrativeRegionFromJson(
        Map<String, dynamic> json) =>
    _$_SncfAdministrativeRegion(
      insee: json['insee'] as String?,
      name: json['name'] as String?,
      level: json['level'] as int?,
      coord: json['coord'] == null
          ? null
          : Coord.fromJson(json['coord'] as Map<String, dynamic>),
      label: json['label'] as String?,
      id: json['id'] as String?,
      zipCode: json['zipCode'] as String?,
    );

Map<String, dynamic> _$$_SncfAdministrativeRegionToJson(
        _$_SncfAdministrativeRegion instance) =>
    <String, dynamic>{
      'insee': instance.insee,
      'name': instance.name,
      'level': instance.level,
      'coord': instance.coord?.toJson(),
      'label': instance.label,
      'id': instance.id,
      'zipCode': instance.zipCode,
    };
