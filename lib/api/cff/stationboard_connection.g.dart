// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationboard_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StationboardConnection _$_$_StationboardConnectionFromJson(Map<String, dynamic> json) {
  return _$_StationboardConnection(
    json['time'] == null ? null : DateTime.parse(json['time'] as String),
    json['type'] as String,
    json['line'] as String,
    json['color'] as String,
    json['number'] as String,
    json['terminal'] == null ? null : Terminal.fromJson(json['terminal'] as Map<String, dynamic>),
    json['operator'] as String,
    g: json['*G'] as String,
    l: json['*L'] as String,
  );
}

Map<String, dynamic> _$_$_StationboardConnectionToJson(_$_StationboardConnection instance) =>
    <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'type': instance.type,
      'line': instance.line,
      'color': instance.color,
      'number': instance.number,
      'terminal': instance.terminal?.toJson(),
      'operator': instance.operator,
      '*G': instance.g,
      '*L': instance.l,
    };
