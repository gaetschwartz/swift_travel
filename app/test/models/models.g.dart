// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Person _$_$PersonFromJson(Map<String, dynamic> json) {
  return _$Person(
    json['name'] as String,
  );
}

Map<String, dynamic> _$_$PersonToJson(_$Person instance) => <String, dynamic>{
      'name': instance.name,
    };

_$Animal _$_$AnimalFromJson(Map<String, dynamic> json) {
  return _$Animal(
    json['name'] as String,
    json['legs'] as int,
  );
}

Map<String, dynamic> _$_$AnimalToJson(_$Animal instance) => <String, dynamic>{
      'name': instance.name,
      'legs': instance.legs,
    };

_$Number _$_$NumberFromJson(Map<String, dynamic> json) {
  return _$Number(
    json['number'] as int,
  );
}

Map<String, dynamic> _$_$NumberToJson(_$Number instance) => <String, dynamic>{
      'number': instance.number,
    };
