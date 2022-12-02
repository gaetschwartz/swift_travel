import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/utils/strings/format.dart';

import 'exit.dart';
import 'stop.dart';
import 'subsequent_stop.dart';

part 'stationboard_connection.freezed.dart';
part 'stationboard_connection.g.dart';

@freezed
class SbbStationboardConnection
    with _$SbbStationboardConnection
    implements StationboardConnection {
  @JsonSerializable(explicitToJson: true, checked: true)
  factory SbbStationboardConnection({
    required DateTime time,
    required VehicleType type,
    required String color,
    @JsonKey(name: 'terminal') required SbbStop sbbTerminal,
    String? line,
    @JsonKey(name: 'operator') String? operator,
    @Default('') String number,
    @JsonKey(name: '*G') String? g,
    @JsonKey(name: '*L') String? l,
    @JsonKey(name: 'subsequent_stops', defaultValue: <SbbSubsequentStop>[])
    @Default(<SbbSubsequentStop>[])
        List<SbbSubsequentStop> sbbSubsequentStops,
    @DelayConverter() @JsonKey(name: 'dep_delay') int? depDelay,
    @DelayConverter() @JsonKey(name: 'arr_delay') int? arrDelay,
    String? track,
  }) = _SbbStationboardConnection;
  SbbStationboardConnection._();

  factory SbbStationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$SbbStationboardConnectionFromJson(json);

  @override
  List<DelayedStop> get subsequentStops => sbbSubsequentStops;

  @override
  Stop get terminal => sbbTerminal;

  @override
  late final Color? bgcolor = () {
    final i = color.indexOf('~');
    if (i == -1) return null;
    final bg = color.substring(0, i);
    final c = parseColorInt(bg);
    return c == null ? null : Color(c);
  }();

  @override
  late final Color? fgcolor = () {
    final first = color.indexOf('~');
    if (first == -1) return null;
    final last = color.lastIndexOf('~');
    final fg = color.substring(first + 1, last);
    final c = parseColorInt(fg);
    return c == null ? null : Color(c);
  }();
}
