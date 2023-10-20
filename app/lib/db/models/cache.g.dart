// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LineCacheEntryImpl _$$LineCacheEntryImplFromJson(Map<String, dynamic> json) =>
    _$LineCacheEntryImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      stop: json['stop'] as String,
      lines: (json['lines'] as List<dynamic>)
          .map((e) => const LineConverter().fromJson(e as Map))
          .toList(),
      ttl: json['ttl'] as int? ?? Duration.minutesPerDay * 7,
    );

Map<String, dynamic> _$$LineCacheEntryImplToJson(
        _$LineCacheEntryImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'stop': instance.stop,
      'lines': instance.lines.map(const LineConverter().toJson).toList(),
      'ttl': instance.ttl,
    };

_$LineImpl _$$LineImplFromJson(Map<String, dynamic> json) => _$LineImpl(
      line: json['line'] as String?,
      bgColor: json['bgColor'] as int?,
      fgColor: json['fgColor'] as int?,
    );

Map<String, dynamic> _$$LineImplToJson(_$LineImpl instance) =>
    <String, dynamic>{
      'line': instance.line,
      'bgColor': instance.bgColor,
      'fgColor': instance.fgColor,
    };
