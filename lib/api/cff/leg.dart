import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_free/api/cff/stop.dart';

import 'exit.dart';

part 'leg.freezed.dart';
part 'leg.g.dart';

@freezed
abstract class Leg with _$Leg {
  @JsonSerializable(explicitToJson: true)
  factory Leg({
    String type,
    String track,
    String terminal,
    String fgcolor,
    String number,
    String bgcolor,
    String tripid,
    Exit exit,
    int runningtime,
    String stopid,
    String line,
    @Default([]) List<Stop> stops,
    String sbbName,
    String name,
    DateTime departure,
    DateTime arrival,
    int normalTime,
    int waittime,
    bool isaddress,
  }) = _Leg;

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);
}
