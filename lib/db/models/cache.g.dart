// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LineCacheEntry _$_$_LineCacheEntryFromJson(Map<String, dynamic> json) {
  return _$_LineCacheEntry(
    timestamp: DateTime.parse(json['timestamp'] as String),
    stop: json['stop'] as String,
    lines: (json['lines'] as List<dynamic>)
        .map((e) => const LineConverter().fromJson(e as Map))
        .toList(),
    ttl: json['ttl'] as int? ?? 10080,
  );
}

Map<String, dynamic> _$_$_LineCacheEntryToJson(_$_LineCacheEntry instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'stop': instance.stop,
      'lines': instance.lines.map(const LineConverter().toJson).toList(),
      'ttl': instance.ttl,
    };

_$_Line _$_$_LineFromJson(Map<String, dynamic> json) {
  return _$_Line(
    json['line'] as String?,
    json['colors'] as String,
  );
}

Map<String, dynamic> _$_$_LineToJson(_$_Line instance) => <String, dynamic>{
      'line': instance.line,
      'colors': instance.colors,
    };
