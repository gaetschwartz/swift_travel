import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/cff/models/stop.dart';
import 'package:swift_travel/apis/cff/models/types_enum.dart';

import 'exit.dart';

part 'leg.freezed.dart';
part 'leg.g.dart';

@freezed
abstract class Leg with _$Leg {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  factory Leg({
    Vehicle type,
    String track,
    String terminal,
    String fgcolor,
    String number,
    String bgcolor,
    String tripid,
    Exit exit,
    @JsonKey(name: 'runningtime') double runningTime,
    String stopid,
    String line,
    @Default([]) List<Stop> stops,
    String sbbName,
    String name,
    DateTime departure,
    DateTime arrival,
    int normalTime,
    @JsonKey(name: "waittime") int waitTime,
    bool isaddress,
    double lat,
    double lon,
    @Default({}) Map<String, String> attributes,
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson) int depDelay,
  }) = _Leg;

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);
}
