import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/exit.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

part 'subsequent_stop.freezed.dart';
part 'subsequent_stop.g.dart';

@freezed
class SbbSubsequentStop with _$SbbSubsequentStop, DelayedStop, BaseStop {
  factory SbbSubsequentStop({
    required String name,
    String? id,
    @JsonKey(name: 'dep') DateTime? departure,
    @JsonKey(name: 'arr') DateTime? arrival,
    double? lat,
    double? lon,
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson) required int depDelay,
    @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson) required int arrDelay,
    int? x,
    int? y,
  }) = _SbbSubsequentStop;
  SbbSubsequentStop._();

  factory SbbSubsequentStop.fromJson(Map<String, dynamic> json) =>
      _$SbbSubsequentStopFromJson(json);

  @override
  late final LatLon? position = LatLon.computeFrom(lat: lat, lon: lon, x: x, y: y, name: name);
}
