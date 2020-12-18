// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sncf_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SncfPlace _$_$_SncfPlaceFromJson(Map<String, dynamic> json) {
  return _$_SncfPlace(
    embeddedType: json['embeddedType'] as String,
    quality: json['quality'] as int,
    administrativeRegion: json['administrativeRegion'] == null
        ? null
        : SncfAdministrativeRegion.fromJson(json['administrativeRegion'] as Map<String, dynamic>),
    name: json['name'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$_$_SncfPlaceToJson(_$_SncfPlace instance) => <String, dynamic>{
      'embeddedType': instance.embeddedType,
      'quality': instance.quality,
      'administrativeRegion': instance.administrativeRegion?.toJson(),
      'name': instance.name,
      'id': instance.id,
    };
