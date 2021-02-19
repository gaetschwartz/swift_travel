// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subsequent_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbSubsequentStop _$_$_SbbSubsequentStopFromJson(Map<String, dynamic> json) {
  return _$_SbbSubsequentStop(
    name: json['name'] as String,
    id: json['id'] as String?,
    dep: json['dep'] == null ? null : DateTime.parse(json['dep'] as String),
    arr: json['arr'] == null ? null : DateTime.parse(json['arr'] as String),
    lat: (json['lat'] as num?)?.toDouble(),
    lon: (json['lon'] as num?)?.toDouble(),
    depDelay: delayFromJson(json['dep_delay']),
    arrDelay: delayFromJson(json['arr_delay']),
  );
}

Map<String, dynamic> _$_$_SbbSubsequentStopToJson(
        _$_SbbSubsequentStop instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'dep': instance.dep?.toIso8601String(),
      'arr': instance.arr?.toIso8601String(),
      'lat': instance.lat,
      'lon': instance.lon,
      'dep_delay': delayToJson(instance.depDelay),
      'arr_delay': delayToJson(instance.arrDelay),
    };
