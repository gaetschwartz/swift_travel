import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/exit.dart';

part 'subsequent_stop.freezed.dart';
part 'subsequent_stop.g.dart';

@freezed
class SbbSubsequentStop with _$SbbSubsequentStop, SubsequentStop {
  const factory SbbSubsequentStop({
    required String name,
    String? id,
    DateTime? dep,
    DateTime? arr,
    double? lat,
    double? lon,
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson) required int depDelay,
    @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson) required int arrDelay,
  }) = _SbbSubsequentStop;

  factory SbbSubsequentStop.fromJson(Map<String, dynamic> json) =>
      _$SbbSubsequentStopFromJson(json);
}
