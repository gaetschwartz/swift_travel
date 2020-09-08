// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cff_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CffRoute _$_$_CffRouteFromJson(Map<String, dynamic> json) {
  return _$_CffRoute(
    count: json['count'] as int,
    minDuration: json['minDuration'] as int,
    maxDuration: json['maxDuration'] as int,
    connections: (json['connections'] as List)
        ?.map((e) => e == null
            ? null
            : RouteConnection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_CffRouteToJson(_$_CffRoute instance) =>
    <String, dynamic>{
      'count': instance.count,
      'minDuration': instance.minDuration,
      'maxDuration': instance.maxDuration,
      'connections': instance.connections?.map((e) => e?.toJson())?.toList(),
    };
