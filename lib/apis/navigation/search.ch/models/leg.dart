import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';

import 'exit.dart';

part 'leg.freezed.dart';
part 'leg.g.dart';

@freezed
abstract class Leg with _$Leg {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Leg({
    required String name,
    Exit? exit,
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
    @Default(<Stop>[]) List<Stop> stops,
    String? sbbName,
    DateTime? departure,
    DateTime? arrival,
    int? normalTime,
    @JsonKey(name: 'waittime') @Default(0) int waitTime,
    @Default(false) bool isaddress,
    double? lat,
    double? lon,
    @Default(<String, String>{}) Map<String, String> attributes,
  }) = _Leg;

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);
}
