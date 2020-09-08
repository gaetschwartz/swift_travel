import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_free/api/cff/located_stop.dart';
import 'package:travel_free/api/cff/stationboard_connection.dart';

part 'cff_stationboard.freezed.dart';
part 'cff_stationboard.g.dart';

@freezed
abstract class CffStationboard with _$CffStationboard {
  factory CffStationboard({
    LocatedStop stop,
    @Default([]) List<StationboardConnection> connections,
    String request,
    int eof,
  }) = _CffStationboard;

  factory CffStationboard.fromJson(Map<String, dynamic> json) => _$CffStationboardFromJson(json);
}
