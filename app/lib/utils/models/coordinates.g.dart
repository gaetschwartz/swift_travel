// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LatLon _$$_LatLonFromJson(Map<String, dynamic> json) => _$_LatLon(
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$$_LatLonToJson(_$_LatLon instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$_LV03Coordinates _$$_LV03CoordinatesFromJson(Map<String, dynamic> json) =>
    _$_LV03Coordinates(
      json['x'] as int,
      json['y'] as int,
    );

Map<String, dynamic> _$$_LV03CoordinatesToJson(_$_LV03Coordinates instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
