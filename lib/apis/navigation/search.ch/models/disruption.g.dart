// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disruption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Disruption _$_$_DisruptionFromJson(Map<String, dynamic> json) {
  return _$_Disruption(
    id: json['id'] as String?,
    header: json['header'] as String?,
    lead: json['lead'] as String?,
    text: json['text'] as String?,
    timeRange: json['timerange'] as String?,
    exact: json['exact'] as bool?,
    priority: json['priority'] as int?,
  );
}

Map<String, dynamic> _$_$_DisruptionToJson(_$_Disruption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'header': instance.header,
      'lead': instance.lead,
      'text': instance.text,
      'timerange': instance.timeRange,
      'exact': instance.exact,
      'priority': instance.priority,
    };
