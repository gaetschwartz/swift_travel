import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

import 'base.dart';
import 'exit.dart';

part 'subsequent_stop.freezed.dart';
part 'subsequent_stop.g.dart';

@freezed
class SbbSubsequentStop
    with _$SbbSubsequentStop, BaseStop, SbbDisplayNameMixin
    implements DelayedStop {
  factory SbbSubsequentStop({
    required String name,
    @DelayConverter() @JsonKey(name: 'dep_delay') int? depDelay,
    @DelayConverter() @JsonKey(name: 'arr_delay') int? arrDelay,
    String? id,
    @JsonKey(name: 'dep') DateTime? departure,
    @JsonKey(name: 'arr') DateTime? arrival,
    double? lat,
    double? lon,
    int? x,
    int? y,
  }) = _SbbSubsequentStop;
  SbbSubsequentStop._();

  factory SbbSubsequentStop.fromJson(Map<String, dynamic> json) =>
      _$SbbSubsequentStopFromJson(json);

  @override
  late final LatLon? position =
      LatLon.computeFrom(lat: lat, lon: lon, x: x, y: y, name: name);
}
