// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subsequent_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SchSubsequentStopImpl _$$SchSubsequentStopImplFromJson(
        Map<String, dynamic> json) =>
    _$SchSubsequentStopImpl(
      name: json['name'] as String,
      depDelay: const DelayConverter().fromJson(json['dep_delay'] as String?),
      arrDelay: const DelayConverter().fromJson(json['arr_delay'] as String?),
      id: json['id'] as String?,
      departure:
          json['dep'] == null ? null : DateTime.parse(json['dep'] as String),
      arrival:
          json['arr'] == null ? null : DateTime.parse(json['arr'] as String),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      x: json['x'] as int?,
      y: json['y'] as int?,
    );

Map<String, dynamic> _$$SchSubsequentStopImplToJson(
        _$SchSubsequentStopImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dep_delay': const DelayConverter().toJson(instance.depDelay),
      'arr_delay': const DelayConverter().toJson(instance.arrDelay),
      'id': instance.id,
      'dep': instance.departure?.toIso8601String(),
      'arr': instance.arrival?.toIso8601String(),
      'lat': instance.lat,
      'lon': instance.lon,
      'x': instance.x,
      'y': instance.y,
    };
