// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SchRouteImpl _$$SchRouteImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SchRouteImpl',
      json,
      ($checkedConvert) {
        final val = _$SchRouteImpl(
          count: $checkedConvert('count', (v) => v as int? ?? 0),
          minDuration:
              $checkedConvert('min_duration', (v) => (v as num?)?.toDouble()),
          maxDuration:
              $checkedConvert('max_duration', (v) => (v as num?)?.toDouble()),
          sbbConnections: $checkedConvert(
              'connections',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => SchRouteConnection.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  []),
          messages: $checkedConvert(
              'messages',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const <String>[]),
          requestUrl: $checkedConvert('requestUrl', (v) => v as String?),
          dateTime: $checkedConvert('dateTime',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'minDuration': 'min_duration',
        'maxDuration': 'max_duration',
        'sbbConnections': 'connections'
      },
    );

Map<String, dynamic> _$$SchRouteImplToJson(_$SchRouteImpl instance) {
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
