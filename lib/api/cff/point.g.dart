// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Point _$_$_PointFromJson(Map<String, dynamic> json) {
  return _$_Point(
    text: json['text'] as String,
    url: json['url'] as String,
    id: json['id'] as String,
    x: json['x'] as int,
    y: json['y'] as int,
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_PointToJson(_$_Point instance) => <String, dynamic>{
      'text': instance.text,
      'url': instance.url,
      'id': instance.id,
      'x': instance.x,
      'y': instance.y,
      'lat': instance.lat,
      'lon': instance.lon,
    };
