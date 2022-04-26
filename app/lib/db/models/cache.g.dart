// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LineCacheEntry _$$_LineCacheEntryFromJson(Map<String, dynamic> json) =>
    _$_LineCacheEntry(
      timestamp: DateTime.parse(json['timestamp'] as String),
      stop: json['stop'] as String,
      lines: (json['lines'] as List<dynamic>)
          .map((e) => const LineConverter().fromJson(e as Map))
          .toList(),
      ttl: json['ttl'] as int? ?? Duration.minutesPerDay * 7,
    );

Map<String, dynamic> _$$_LineCacheEntryToJson(_$_LineCacheEntry instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'stop': instance.stop,
      'lines': instance.lines.map(const LineConverter().toJson).toList(),
      'ttl': instance.ttl,
    };

_$_Line _$$_LineFromJson(Map<String, dynamic> json) => _$_Line(
      line: json['line'] as String?,
      bgColor: json['bgColor'] as int?,
      fgColor: json['fgColor'] as int?,
    );

Map<String, dynamic> _$$_LineToJson(_$_Line instance) => <String, dynamic>{
      'line': instance.line,
      'bgColor': instance.bgColor,
      'fgColor': instance.fgColor,
    };
