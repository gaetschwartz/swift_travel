import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/utils/models/coordinates.dart';

import 'base.dart';
import 'stop.dart';

part 'exit.freezed.dart';
part 'exit.g.dart';

int delayFromJson(dynamic s) {
  if (s is String && s != 'X') {
    return int.tryParse(s) ?? _defaultDelay;
  } else {
    return _defaultDelay;
  }
}

const _defaultDelay = 0;

String delayToJson(int d) => d >= 0 ? '+$d' : d.toString();

@freezed
class SbbExit with _$SbbExit, BaseStop, SbbDisplayNameMixin implements Exit {
  @JsonSerializable(includeIfNull: false, checked: true)
  factory SbbExit({
    required String name,
    @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
    @Default(0)
        int arrDelay,
    DateTime? arrival,
    double? lat,
    double? lon,
    String? sbbName,
    String? stopid,
    String? track,
    @Default(0) int waittime,
    @Default(false) bool isaddress,
    @IntConverter() int? x,
    @IntConverter() int? y,
  }) = _Exit;
  SbbExit._();

  factory SbbExit.fromJson(Map<String, dynamic> json) => _$SbbExitFromJson(json);

  @override
  late final LatLon? position = LatLon.computeFrom(lat: lat, lon: lon, x: x, y: y, name: name);

  @override
  int get depDelay => 0;

  @override
  DateTime? get departure => null;

  @override
  String? get id => stopid;
}
