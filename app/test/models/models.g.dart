// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Person _$$PersonFromJson(Map<String, dynamic> json) => _$Person(
      json['name'] as String,
    );

Map<String, dynamic> _$$PersonToJson(_$Person instance) => <String, dynamic>{
      'name': instance.name,
    };

_$Animal _$$AnimalFromJson(Map<String, dynamic> json) => _$Animal(
      json['name'] as String,
      json['legs'] as int,
    );

Map<String, dynamic> _$$AnimalToJson(_$Animal instance) => <String, dynamic>{
      'name': instance.name,
      'legs': instance.legs,
    };

_$Number _$$NumberFromJson(Map<String, dynamic> json) => _$Number(
      json['number'] as int,
    );

Map<String, dynamic> _$$NumberToJson(_$Number instance) => <String, dynamic>{
      'number': instance.number,
    };
