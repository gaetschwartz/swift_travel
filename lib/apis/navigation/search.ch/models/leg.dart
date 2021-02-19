import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';

import 'exit.dart';

part 'leg.freezed.dart';
part 'leg.g.dart';

@freezed
class SbbLeg with _$SbbLeg, Leg {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory SbbLeg({
    required String name,
    @JsonKey(name: 'exit') SbbExit? sbbExit,
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson) required int depDelay,
    Vehicle? type,
    String? track,
    String? terminal,
    String? fgcolor,
    String? number,
    String? bgcolor,
    String? tripid,
    String? stopid,
    @JsonKey(name: 'runningtime') double? runningTime,
    String? line,
    @Default(<SbbStop>[]) List<SbbStop> sbbStops,
    String? sbbName,
    DateTime? departure,
    DateTime? arrival,
    int? normalTime,
    @JsonKey(name: 'waittime') @Default(0) int waitTime,
    @Default(false) bool isaddress,
    double? lat,
    double? lon,
    @Default(<String, String>{}) Map<String, String> attributes,
  }) = _SbbLeg;
  const SbbLeg._();

  factory SbbLeg.fromJson(Map<String, dynamic> json) => _$SbbLegFromJson(json);

  @override
  List<Stop> get stops => sbbStops;

  @override
  Exit? get exit => sbbExit;

  @override
  Leg copyWithLatLon({required double lat, required double lon}) => copyWith(lat: lat, lon: lon);
}
