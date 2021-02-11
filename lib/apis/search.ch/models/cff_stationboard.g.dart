// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cff_stationboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CffStationboard _$_$_CffStationboardFromJson(Map<String, dynamic> json) {
  return _$_CffStationboard(
    stop: Stop.fromJson(json['stop'] as Map<String, dynamic>),
    stopName: json['stopName'] as String,
    connections: (json['connections'] as List<dynamic>?)
            ?.map((e) =>
                StationboardConnection.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    request: json['request'] as String?,
    messages: (json['messages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_CffStationboardToJson(_$_CffStationboard instance) =>
    <String, dynamic>{
      'stop': instance.stop,
      'stopName': instance.stopName,
      'connections': instance.connections,
      'request': instance.request,
      'messages': instance.messages,
    };
