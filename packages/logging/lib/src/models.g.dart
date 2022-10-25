// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LogMessage _$$_LogMessageFromJson(Map<String, dynamic> json) =>
    _$_LogMessage(
      message: json['message'] as String,
      level: json['level'] == null
          ? LogLevel.info
          : LogLevel.fromJson(json['level'] as Map<String, dynamic>),
      timestamp: DateTime.parse(json['timestamp'] as String),
      scope: json['scope'] == null
          ? Scope.empty
          : Scope.fromJson(json['scope'] as Map<String, dynamic>),
      error: json['error'] as String?,
      stackTrace: const StackTraceJsonConverter()
          .fromJson(json['stackTrace'] as String?),
    );

Map<String, dynamic> _$$_LogMessageToJson(_$_LogMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'level': instance.level,
      'timestamp': instance.timestamp.toIso8601String(),
      'scope': instance.scope,
      'error': instance.error,
      'stackTrace': const StackTraceJsonConverter().toJson(instance.stackTrace),
    };

_$_LogLevel _$$_LogLevelFromJson(Map<String, dynamic> json) => _$_LogLevel(
      json['level'] as int,
      $enumDecode(_$SentimentEnumMap, json['sentiment']),
      json['name'] as String,
    );

Map<String, dynamic> _$$_LogLevelToJson(_$_LogLevel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'sentiment': _$SentimentEnumMap[instance.sentiment]!,
      'name': instance.name,
    };

const _$SentimentEnumMap = {
  Sentiment.positive: 'positive',
  Sentiment.neutral: 'neutral',
  Sentiment.negative: 'negative',
};

_$_Scope _$$_ScopeFromJson(Map<String, dynamic> json) => _$_Scope(
      (json['value'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ScopeToJson(_$_Scope instance) => <String, dynamic>{
      'value': instance.value,
    };
