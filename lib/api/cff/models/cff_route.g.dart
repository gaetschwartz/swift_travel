// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cff_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CffRoute _$_$_CffRouteFromJson(Map<String, dynamic> json) {
  return _$_CffRoute(
    count: json['count'] as int,
    minDuration: (json['min_duration'] as num)?.toDouble(),
    maxDuration: (json['max_duration'] as num)?.toDouble(),
    connections: (json['connections'] as List)
            ?.map((e) => e == null
                ? null
                : RouteConnection.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_CffRouteToJson(_$_CffRoute instance) =>
    <String, dynamic>{
      'count': instance.count,
      'min_duration': instance.minDuration,
      'max_duration': instance.maxDuration,
      'connections': instance.connections?.map((e) => e?.toJson())?.toList(),
    };
