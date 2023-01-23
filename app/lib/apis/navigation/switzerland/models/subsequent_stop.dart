import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

import 'base.dart';
import 'exit.dart';

part 'subsequent_stop.freezed.dart';
part 'subsequent_stop.g.dart';

@freezed
class SchSubsequentStop
    with _$SchSubsequentStop, BaseStop, SchDisplayNameMixin
    implements DelayedStop {
  factory SchSubsequentStop({
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
  }) = _SchSubsequentStop;
  SchSubsequentStop._();

  factory SchSubsequentStop.fromJson(Map<String, dynamic> json) =>
      _$SchSubsequentStopFromJson(json);

  @override
  late final LatLon? position =
      LatLon.computeFrom(lat: lat, lon: lon, x: x, y: y, name: name);
}
