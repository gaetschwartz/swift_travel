// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbStationboard _$_$_SbbStationboardFromJson(Map<String, dynamic> json) {
  return _$_SbbStationboard(
    sbbStop: SbbStop.fromJson(json['stop'] as Map<String, dynamic>),
    sbbConnections: (json['connections'] as List<dynamic>)
        .map((e) =>
            SbbStationboardConnection.fromJson(e as Map<String, dynamic>))
        .toList(),
    messages: (json['messages'] as List<dynamic>?)
            ?.map((e) => e as Object)
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_SbbStationboardToJson(_$_SbbStationboard instance) =>
    <String, dynamic>{
      'stop': instance.sbbStop,
      'connections': instance.sbbConnections,
      'messages': instance.messages,
    };
