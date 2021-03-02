// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CffRoute _$_$_CffRouteFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_CffRoute', json, () {
    final val = _$_CffRoute(
      count: $checkedConvert(json, 'count', (v) => v as int?) ?? 0,
      minDuration:
          $checkedConvert(json, 'min_duration', (v) => (v as num?)?.toDouble()),
      maxDuration:
          $checkedConvert(json, 'max_duration', (v) => (v as num?)?.toDouble()),
      sbbConnections: $checkedConvert(
          json,
          'connections',
          (v) => (v as List<dynamic>)
              .map(
                  (e) => SbbRouteConnection.fromJson(e as Map<String, dynamic>))
              .toList()),
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

Map<String, dynamic> _$_$_CffRouteToJson(_$_CffRoute instance) {
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
