// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SncfContextImpl _$$SncfContextImplFromJson(Map<String, dynamic> json) =>
    _$SncfContextImpl(
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$$SncfContextImplToJson(_$SncfContextImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime?.toIso8601String(),
      'timezone': instance.timezone,
    };
