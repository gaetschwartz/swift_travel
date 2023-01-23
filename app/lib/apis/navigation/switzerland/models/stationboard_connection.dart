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
class SchStationboardConnection
    with _$SchStationboardConnection
    implements StationboardConnection {
  @JsonSerializable(explicitToJson: true, checked: true)
  factory SchStationboardConnection({
    required DateTime time,
    required VehicleType type,
    required String color,
    @JsonKey(name: 'terminal') required SchStop sbbTerminal,
    String? line,
    @JsonKey(name: 'operator') String? operator,
    @Default('') String number,
    @JsonKey(name: '*G') String? g,
    @JsonKey(name: '*L') String? l,
    @JsonKey(name: 'subsequent_stops', defaultValue: <SchSubsequentStop>[])
    @Default(<SchSubsequentStop>[])
        List<SchSubsequentStop> sbbSubsequentStops,
    @DelayConverter() @JsonKey(name: 'dep_delay') int? depDelay,
    @DelayConverter() @JsonKey(name: 'arr_delay') int? arrDelay,
    String? track,
  }) = _SchStationboardConnection;
  SchStationboardConnection._();

  factory SchStationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$SchStationboardConnectionFromJson(json);

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
