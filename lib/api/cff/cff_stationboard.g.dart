// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cff_stationboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CffStationboard _$_$_CffStationboardFromJson(Map<String, dynamic> json) {
  return _$_CffStationboard(
    stop: json['stop'] == null
        ? null
        : LocatedStop.fromJson(json['stop'] as Map<String, dynamic>),
    connections: (json['connections'] as List)
            ?.map((e) => e == null
                ? null
                : StationboardConnection.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    request: json['request'] as String,
    eof: json['eof'] as int,
    messages:
        (json['messages'] as List)?.map((e) => e as String)?.toList() ?? [],
  );
}

Map<String, dynamic> _$_$_CffStationboardToJson(_$_CffStationboard instance) =>
    <String, dynamic>{
      'stop': instance.stop,
      'connections': instance.connections,
      'request': instance.request,
      'eof': instance.eof,
      'messages': instance.messages,
    };
