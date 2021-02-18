// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CffStationboardData _$_$CffStationboardDataFromJson(
    Map<String, dynamic> json) {
  return _$CffStationboardData(
    stop: Stop.fromJson(json['stop'] as Map<String, dynamic>),
    stopName: json['stopName'] as String,
    connections: (json['connections'] as List<dynamic>?)
            ?.map((e) =>
                StationboardConnection.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    messages: (json['messages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$CffStationboardDataToJson(
        _$CffStationboardData instance) =>
    <String, dynamic>{
      'stop': instance.stop,
      'stopName': instance.stopName,
      'connections': instance.connections,
      'messages': instance.messages,
    };

_$CffStationboardError _$_$CffStationboardErrorFromJson(
    Map<String, dynamic> json) {
  return _$CffStationboardError(
    (json['messages'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_$CffStationboardErrorToJson(
        _$CffStationboardError instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };
