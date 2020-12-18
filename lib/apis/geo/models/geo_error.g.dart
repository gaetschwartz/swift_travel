// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeoError _$_$_GeoErrorFromJson(Map<String, dynamic> json) {
  return _$_GeoError(
    status: json['status'] as String,
    detail: json['detail'] as String,
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$_$_GeoErrorToJson(_$_GeoError instance) => <String, dynamic>{
      'status': instance.status,
      'detail': instance.detail,
      'code': instance.code,
    };
