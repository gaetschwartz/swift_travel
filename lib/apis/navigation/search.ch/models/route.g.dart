// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CffRoute _$_$_CffRouteFromJson(Map<String, dynamic> json) {
  return _$_CffRoute(
    count: json['count'] as int? ?? 0,
    minDuration: (json['min_duration'] as num?)?.toDouble(),
    maxDuration: (json['max_duration'] as num?)?.toDouble(),
    connections: (json['connections'] as List<dynamic>?)
            ?.map((e) => RouteConnection.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    messages: (json['messages'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    requestUrl: json['requestUrl'] as String?,
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
  );
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
  val['connections'] = instance.connections.map((e) => e.toJson()).toList();
  val['messages'] = instance.messages;
  writeNotNull('requestUrl', instance.requestUrl);
  writeNotNull('dateTime', instance.dateTime?.toIso8601String());
  return val;
}
