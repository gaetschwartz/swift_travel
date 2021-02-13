import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache.freezed.dart';
part 'cache.g.dart';

class LineConverter implements JsonConverter<Line, Map> {
  const LineConverter();

  @override
  Line fromJson(Map json) {
    return Line.fromJson(json.cast<String, dynamic>());
  }

  @override
  Map toJson(Line object) {
    return object.toJson();
  }
}

@freezed
abstract class LineCacheEntry with _$LineCacheEntry {
  @LineConverter()
  @JsonSerializable(explicitToJson: true)
  const factory LineCacheEntry({
    required DateTime timestamp,
    required String stop,
    required List<Line> lines,
    @Default(Duration.minutesPerDay * 7) int ttl,
  }) = _LineCacheEntry;

  factory LineCacheEntry.fromJson(Map<String, dynamic> json) => _$LineCacheEntryFromJson(json);
}

@freezed
abstract class Line with _$Line {
  const factory Line(String? line, String colors) = _Line;

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);
}
