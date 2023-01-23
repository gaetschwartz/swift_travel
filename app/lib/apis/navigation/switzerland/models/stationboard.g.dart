// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stationboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SchStationboard _$$_SchStationboardFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SchStationboard',
      json,
      ($checkedConvert) {
        final val = _$_SchStationboard(
          sbbStop: $checkedConvert(
              'stop',
              (v) => v == null
                  ? const SchStop(sbbName: '')
                  : SchStop.fromJson(v as Map<String, dynamic>)),
          sbbConnections: $checkedConvert(
              'connections',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => SchStationboardConnection.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  []),
          messages: $checkedConvert(
              'messages',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as Object).toList() ??
                  const <Object>[]),
        );
        return val;
      },
      fieldKeyMap: const {'sbbStop': 'stop', 'sbbConnections': 'connections'},
    );

Map<String, dynamic> _$$_SchStationboardToJson(_$_SchStationboard instance) {
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
