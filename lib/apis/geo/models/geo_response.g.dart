// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_response.dart';

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
