// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subsequent_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbSubsequentStop _$_$_SbbSubsequentStopFromJson(Map<String, dynamic> json) {
  return _$_SbbSubsequentStop(
    name: json['name'] as String,
    depDelay: delayFromJson(json['dep_delay']),
    arrDelay: delayFromJson(json['arr_delay']),
    id: json['id'] as String?,
    departure:
        json['dep'] == null ? null : DateTime.parse(json['dep'] as String),
    arrival: json['arr'] == null ? null : DateTime.parse(json['arr'] as String),
    lat: (json['lat'] as num?)?.toDouble(),
    lon: (json['lon'] as num?)?.toDouble(),
    x: json['x'] as int?,
    y: json['y'] as int?,
  );
}

Map<String, dynamic> _$_$_SbbSubsequentStopToJson(
        _$_SbbSubsequentStop instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dep_delay': delayToJson(instance.depDelay),
      'arr_delay': delayToJson(instance.arrDelay),
      'id': instance.id,
      'dep': instance.departure?.toIso8601String(),
      'arr': instance.arrival?.toIso8601String(),
      'lat': instance.lat,
      'lon': instance.lon,
      'x': instance.x,
      'y': instance.y,
    };
