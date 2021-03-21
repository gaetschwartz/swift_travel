// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SncfContext _$_$_SncfContextFromJson(Map<String, dynamic> json) {
  return _$_SncfContext(
    dateTime: json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
    timezone: json['timezone'] as String?,
  );
}

Map<String, dynamic> _$_$_SncfContextToJson(_$_SncfContext instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'timezone': instance.timezone,
    };
