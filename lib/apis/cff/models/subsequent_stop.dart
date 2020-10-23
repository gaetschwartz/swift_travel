import 'package:freezed_annotation/freezed_annotation.dart';

part 'subsequent_stop.freezed.dart';
part 'subsequent_stop.g.dart';

@freezed
abstract class SubsequentStop with _$SubsequentStop {
  factory SubsequentStop(
    String name, {
    String id,
    DateTime dep,
    DateTime arr,
    double lat,
    double lon,
  }) = _SubsequentStop;

  factory SubsequentStop.fromJson(Map<String, dynamic> json) => _$SubsequentStopFromJson(json);
}
