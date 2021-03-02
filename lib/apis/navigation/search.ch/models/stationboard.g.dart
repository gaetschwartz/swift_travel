// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbStationboard _$_$_SbbStationboardFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_SbbStationboard', json, () {
    final val = _$_SbbStationboard(
      sbbStop: $checkedConvert(
          json,
          'stop',
          (v) =>
              v == null ? null : SbbStop.fromJson(v as Map<String, dynamic>)),
      sbbConnections: $checkedConvert(
              json,
              'connections',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SbbStationboardConnection.fromJson(
                      e as Map<String, dynamic>))
                  .toList()) ??
          [],
      messages: $checkedConvert(json, 'messages',
              (v) => (v as List<dynamic>?)?.map((e) => e as Object).toList()) ??
          [],
    );
    return val;
  }, fieldKeyMap: const {'sbbStop': 'stop', 'sbbConnections': 'connections'});
}

Map<String, dynamic> _$_$_SbbStationboardToJson(_$_SbbStationboard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stop', instance.sbbStop?.toJson());
  val['connections'] = instance.sbbConnections.map((e) => e.toJson()).toList();
  val['messages'] = instance.messages;
  return val;
}
