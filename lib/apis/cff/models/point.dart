import 'package:freezed_annotation/freezed_annotation.dart';

part 'point.freezed.dart';
part 'point.g.dart';

@freezed
abstract class Point with _$Point {
  factory Point({
    String text,
    String url,
    String id,
    int x,
    int y,
    double lat,
    double lon,
  }) = _Point;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}
