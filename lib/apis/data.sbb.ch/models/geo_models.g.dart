// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeoResponse _$_$_GeoResponseFromJson(Map<String, dynamic> json) {
  return _$_GeoResponse(
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : GeoResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_GeoResponseToJson(_$_GeoResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

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

_$_GeoResult _$_$_GeoResultFromJson(Map<String, dynamic> json) {
  return _$_GeoResult(
    id: json['id'] as int,
    weight: json['weight'] as int,
    attrs: json['attrs'] == null
        ? null
        : GeoAttr.fromJson(json['attrs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_GeoResultToJson(_$_GeoResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'attrs': instance.attrs?.toJson(),
    };

_$_GeoError _$_$_GeoErrorFromJson(Map<String, dynamic> json) {
  return _$_GeoError(
    status: json['status'] as String,
    detail: json['detail'] as String,
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$_$_GeoErrorToJson(_$_GeoError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'detail': instance.detail,
      'code': instance.code,
    };
