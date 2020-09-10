// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stop _$_$_StopFromJson(Map<String, dynamic> json) {
  return _$_Stop(
    json['name'] as String,
    stopid: json['stopid'] as String,
    departure: _fromJson(json['departure'] as String),
  );
}

Map<String, dynamic> _$_$_StopToJson(_$_Stop instance) => <String, dynamic>{
      'name': instance.name,
      'stopid': instance.stopid,
      'departure': _toJson(instance.departure),
    };
