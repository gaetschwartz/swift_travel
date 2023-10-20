// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disruption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisruptionImpl _$$DisruptionImplFromJson(Map<String, dynamic> json) =>
    _$DisruptionImpl(
      id: json['id'] as String?,
      header: json['header'] as String?,
      lead: json['lead'] as String?,
      text: json['text'] as String?,
      timeRange: json['timerange'] as String?,
      exact: json['exact'] as bool?,
      priority: json['priority'] as int?,
    );

Map<String, dynamic> _$$DisruptionImplToJson(_$DisruptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'header': instance.header,
      'lead': instance.lead,
      'text': instance.text,
      'timerange': instance.timeRange,
      'exact': instance.exact,
      'priority': instance.priority,
    };
