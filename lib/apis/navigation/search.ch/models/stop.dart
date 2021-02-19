import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';

part 'stop.freezed.dart';
part 'stop.g.dart';

DateTime? _fromJson(String? s) => s == null ? null : DateTime.parse(s);
String? _toJson(DateTime? d) => d?.toIso8601String();

@freezed
class SbbStop with _$SbbStop, Stop {
  @JsonSerializable(includeIfNull: false)
  const factory SbbStop(
    String name, {
    String? id,
    String? stopid,
    @JsonKey(fromJson: _fromJson, toJson: _toJson) DateTime? departure,
    double? lat,
    double? lon,
  }) = _SbbStop;

  factory SbbStop.fromJson(Map<String, dynamic> json) => _$SbbStopFromJson(json);
}
