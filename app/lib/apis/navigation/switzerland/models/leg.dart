import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/base.dart';
import 'package:swift_travel/utils/models/coordinates.dart';
import 'package:swift_travel/utils/strings/format.dart';

import 'exit.dart';
import 'stop.dart';

part 'leg.freezed.dart';
part 'leg.g.dart';

@freezed
class SchLeg with _$SchLeg, Leg, SchDisplayNameMixin {
  @JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
  factory SchLeg({
    required String name,
    @JsonKey(name: 'exit') SchExit? sbbExit,
    @DelayConverter() @JsonKey(name: 'dep_delay') int? depDelay,
    VehicleType? type,
    String? track,
    String? terminal,
    String? bgcolor,
    String? fgcolor,
    String? number,
    String? tripid,
    String? stopid,
    @JsonKey(name: 'runningtime') double? runningTime,
    String? line,
    @Default(<SchStop>[])
    @JsonKey(name: 'stops', defaultValue: <SchStop>[])
        List<SchStop> sbbStops,
    String? sbbName,
    DateTime? departure,
    DateTime? arrival,
    @JsonKey(name: 'normal_time') double? normalTime,
    @JsonKey(name: 'waittime', defaultValue: 0) @Default(0) double waitTime,
    @JsonKey(name: 'isaddress') @Default(false) bool isAddress,
    double? lat,
    double? lon,
    @IntConverter() int? x,
    @IntConverter() int? y,
    @Default(<String, String>{}) Map<String, String> attributes,
  }) = _SchLeg;
  SchLeg._();

  factory SchLeg.fromJson(Map<String, dynamic> json) => _$SchLegFromJson(json);

  @override
  List<Stop> get stops => sbbStops;

  @override
  Exit? get exit => sbbExit;

  @override
  Leg copyWithLatLon({required double lat, required double lon}) =>
      copyWith(lat: lat, lon: lon);

  @override
  late final LatLon? position =
      LatLon.computeFrom(lat: lat, lon: lon, x: x, y: y, name: name);

  @override
  String? get officialName => sbbName;

  @override
  Duration? get walkingTime =>
      runningTime == null ? null : Duration(seconds: runningTime!.round());

  @override
  Color? get bgColor {
    // ignore: deprecated_member_use_from_same_package
    final c = tryParseColorInt(bgcolor);
    return c == null ? null : Color(c);
  }

  @override
  Color? get fgColor {
    // ignore: deprecated_member_use_from_same_package
    final c = tryParseColorInt(fgcolor);
    return c == null ? null : Color(c);
  }
}
