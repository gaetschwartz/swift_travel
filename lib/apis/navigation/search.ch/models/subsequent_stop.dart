import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/exit.dart';
import 'package:swift_travel/utils/arithmetic.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

part 'subsequent_stop.freezed.dart';
part 'subsequent_stop.g.dart';

@freezed
class SbbSubsequentStop with _$SbbSubsequentStop, DelayedStop {
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
  late final LatLon? position = _computePosition();

  LatLon? _computePosition() {
    if (lat != null && lon != null) {
      return LatLon(lat!, lon!);
    }
    if (x != null && y != null) {
      final o = lv03ToWGS84Converter.convert(LV03Coordinates(x!, y!));
      return o;
    }

    return null;
  }
}
