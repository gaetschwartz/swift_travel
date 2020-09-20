// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RouteConnection _$_$_RouteConnectionFromJson(Map<String, dynamic> json) {
  return _$_RouteConnection(
    from: json['from'] as String,
    arrival: json['arrival'] == null
        ? null
        : DateTime.parse(json['arrival'] as String),
    legs: (json['legs'] as List)
            ?.map((e) =>
                e == null ? null : Leg.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    duration: (json['duration'] as num)?.toDouble(),
    to: json['to'] as String,
    departure: json['departure'] == null
        ? null
        : DateTime.parse(json['departure'] as String),
  );
}

Map<String, dynamic> _$_$_RouteConnectionToJson(_$_RouteConnection instance) =>
    <String, dynamic>{
      'from': instance.from,
      'arrival': instance.arrival?.toIso8601String(),
      'legs': instance.legs?.map((e) => e?.toJson())?.toList(),
      'duration': instance.duration,
      'to': instance.to,
      'departure': instance.departure?.toIso8601String(),
    };
