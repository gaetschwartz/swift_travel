// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'runtimeType': instance.$type,
    };

_$AnimalImpl _$$AnimalImplFromJson(Map<String, dynamic> json) => _$AnimalImpl(
      json['name'] as String,
      json['legs'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AnimalImplToJson(_$AnimalImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'legs': instance.legs,
      'runtimeType': instance.$type,
    };

_$NumberImpl _$$NumberImplFromJson(Map<String, dynamic> json) => _$NumberImpl(
      json['number'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NumberImplToJson(_$NumberImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'runtimeType': instance.$type,
    };
