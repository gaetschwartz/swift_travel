import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/base.dart';
import 'package:swift_travel/utils/models/coordinates.dart';
import 'package:swift_travel/utils/strings/format.dart';

import 'exit.dart';
import 'stop.dart';

part 'leg.freezed.dart';
part 'leg.g.dart';

@freezed
class SbbLeg with _$SbbLeg, Leg, SbbDisplayNameMixin {
  @JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
  factory SbbLeg({
    required String name,
    @JsonKey(name: 'exit') SbbExit? sbbExit,
    @DelayConverter() @JsonKey(name: 'dep_delay') int? depDelay,
    TransportationMode? type,
    String? track,
    String? terminal,
    String? bgcolor,
    String? fgcolor,
    String? number,
    String? tripid,
    String? stopid,
    @JsonKey(name: 'runningtime') int? runningTime,
    String? line,
    @Default(<SbbStop>[]) @JsonKey(name: 'stops', defaultValue: <SbbStop>[]) List<SbbStop> sbbStops,
    String? sbbName,
    DateTime? departure,
    DateTime? arrival,
    @JsonKey(name: "normal_time") int? normalTime,
    @JsonKey(name: 'waittime', defaultValue: 0) @Default(0) int waitTime,
    @JsonKey(name: "isaddress") @Default(false) bool isAddress,
    double? lat,
    double? lon,
    @IntConverter() int? x,
    @IntConverter() int? y,
    @Default(<String, String>{}) Map<String, String> attributes,
  }) = _SbbLeg;
  SbbLeg._();

  factory SbbLeg.fromJson(Map<String, dynamic> json) => _$SbbLegFromJson(json);

  @override
  List<Stop> get stops => sbbStops;

  @override
  Exit? get exit => sbbExit;

  @override
  Leg copyWithLatLon({required double lat, required double lon}) => copyWith(lat: lat, lon: lon);

  @override
  late final LatLon? position = LatLon.computeFrom(lat: lat, lon: lon, x: x, y: y, name: name);

  @override
  String? get officialName => sbbName;

  @override
  Duration? get walkingTime => runningTime == null ? null : Duration(seconds: runningTime!);

  @override
  Color? get bgColor {
    // ignore: deprecated_member_use_from_same_package
    final c = parseColorInt(bgcolor);
    return c == null ? null : Color(c);
  }

  @override
  Color? get fgColor {
    // ignore: deprecated_member_use_from_same_package
    final c = parseColorInt(fgcolor);
    return c == null ? null : Color(c);
  }
}
