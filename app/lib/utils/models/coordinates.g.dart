// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LatLon _$_$_LatLonFromJson(Map<String, dynamic> json) {
  return _$_LatLon(
    (json['lat'] as num).toDouble(),
    (json['lon'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_LatLonToJson(_$_LatLon instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$_LV03Coordinates _$_$_LV03CoordinatesFromJson(Map<String, dynamic> json) {
  return _$_LV03Coordinates(
    json['x'] as int,
    json['y'] as int,
  );
}

Map<String, dynamic> _$_$_LV03CoordinatesToJson(_$_LV03Coordinates instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
