// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalRoute _$_$_LocalRouteFromJson(Map<String, dynamic> json) {
  return _$_LocalRoute(
    json['from'] as String,
    json['to'] as String,
    displayName: json['displayName'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    fromI: json['fromI'] as int,
    toI: json['toI'] as int,
  );
}

Map<String, dynamic> _$_$_LocalRouteToJson(_$_LocalRoute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('from', instance.from);
  writeNotNull('to', instance.to);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull('fromI', instance.fromI);
  writeNotNull('toI', instance.toI);
  return val;
}
