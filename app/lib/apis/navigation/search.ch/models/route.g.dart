// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SbbRoute _$_$_SbbRouteFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_SbbRoute', json, () {
    final val = _$_SbbRoute(
      count: $checkedConvert(json, 'count', (v) => v as int?) ?? 0,
      minDuration:
          $checkedConvert(json, 'min_duration', (v) => (v as num?)?.toDouble()),
      maxDuration:
          $checkedConvert(json, 'max_duration', (v) => (v as num?)?.toDouble()),
      sbbConnections: $checkedConvert(
              json,
              'connections',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      SbbRouteConnection.fromJson(e as Map<String, dynamic>))
                  .toList()) ??
          [],
      messages: $checkedConvert(json, 'messages',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()) ??
          [],
      requestUrl: $checkedConvert(json, 'requestUrl', (v) => v as String?),
      dateTime: $checkedConvert(json, 'dateTime',
          (v) => v == null ? null : DateTime.parse(v as String)),
    );
    return val;
  }, fieldKeyMap: const {
    'minDuration': 'min_duration',
    'maxDuration': 'max_duration',
    'sbbConnections': 'connections'
  });
}

Map<String, dynamic> _$_$_SbbRouteToJson(_$_SbbRoute instance) {
  final val = <String, dynamic>{
    'count': instance.count,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('min_duration', instance.minDuration);
  writeNotNull('max_duration', instance.maxDuration);
  val['connections'] = instance.sbbConnections.map((e) => e.toJson()).toList();
  val['messages'] = instance.messages;
  writeNotNull('requestUrl', instance.requestUrl);
  writeNotNull('dateTime', instance.dateTime?.toIso8601String());
  return val;
}
