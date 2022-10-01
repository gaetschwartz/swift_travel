import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache.freezed.dart';
part 'cache.g.dart';

class LineConverter implements JsonConverter<Line, Map<dynamic, dynamic>> {
  const LineConverter();

  @override
  Line fromJson(Map<dynamic, dynamic> json) =>
      Line.fromJson(json.cast<String, dynamic>());

  @override
  Map<dynamic, dynamic> toJson(Line object) => object.toJson();
}

@freezed
class LineCacheEntry with _$LineCacheEntry {
  @LineConverter()
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory LineCacheEntry({
    required DateTime timestamp,
    required String stop,
    required List<Line> lines,

    /// Time to live for this entry in minutes.
    ///
    /// Defaults to `7 days`.
    @Default(Duration.minutesPerDay * 7) int ttl,
  }) = _LineCacheEntry;

  factory LineCacheEntry.fromJson(Map<String, dynamic> json) =>
      _$LineCacheEntryFromJson(json);
}

@freezed
class Line with _$Line {
  const factory Line({
    required String? line,
    required int? bgColor,
    required int? fgColor,
  }) = _Line;

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);
}
