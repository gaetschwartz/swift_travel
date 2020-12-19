// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_attr.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeoAttr _$_$_GeoAttrFromJson(Map<String, dynamic> json) {
  return _$_GeoAttr(
    origin: json['origin'] as String,
    geomQuadindex: json['geomQuadindex'] as String,
    zoomlevel: json['zoomlevel'] as int,
    featureId: json['featureId'] as String,
    lon: (json['lon'] as num)?.toDouble(),
    detail: json['detail'] as String,
    rank: json['rank'] as int,
    geomStBox2d: json['geomStBox2d'] as String,
    lat: (json['lat'] as num)?.toDouble(),
    number: json['num'] as int,
    y: (json['y'] as num)?.toDouble(),
    x: (json['x'] as num)?.toDouble(),
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$_$_GeoAttrToJson(_$_GeoAttr instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'geomQuadindex': instance.geomQuadindex,
      'zoomlevel': instance.zoomlevel,
      'featureId': instance.featureId,
      'lon': instance.lon,
      'detail': instance.detail,
      'rank': instance.rank,
      'geomStBox2d': instance.geomStBox2d,
      'lat': instance.lat,
      'num': instance.number,
      'y': instance.y,
      'x': instance.x,
      'label': instance.label,
    };
