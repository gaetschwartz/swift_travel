import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/cff/models/exit.dart';

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
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson) int depDelay,
    @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson) int arrDelay,
  }) = _SubsequentStop;

  factory SubsequentStop.fromJson(Map<String, dynamic> json) => _$SubsequentStopFromJson(json);
}
