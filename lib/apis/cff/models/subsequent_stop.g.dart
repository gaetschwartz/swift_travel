// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subsequent_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubsequentStop _$_$_SubsequentStopFromJson(Map<String, dynamic> json) {
  return _$_SubsequentStop(
    json['name'] as String,
    id: json['id'] as String,
    dep: json['dep'] == null ? null : DateTime.parse(json['dep'] as String),
    arr: json['arr'] == null ? null : DateTime.parse(json['arr'] as String),
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
    depDelay: json['dep_delay'] as int,
    arrDelay: json['arr_delay'] as int,
  );
}

Map<String, dynamic> _$_$_SubsequentStopToJson(_$_SubsequentStop instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'dep': instance.dep?.toIso8601String(),
      'arr': instance.arr?.toIso8601String(),
      'lat': instance.lat,
      'lon': instance.lon,
      'dep_delay': instance.depDelay,
      'arr_delay': instance.arrDelay,
    };
