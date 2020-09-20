import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swiss_travel/api/cff/models/located_stop.dart';
import 'package:swiss_travel/api/cff/models/stationboard_connection.dart';

part 'cff_stationboard.freezed.dart';
part 'cff_stationboard.g.dart';

@freezed
abstract class CffStationboard with _$CffStationboard {
  factory CffStationboard({
    LocatedStop stop,
    @Default([]) List<StationboardConnection> connections,
    String request,
    int eof,
    @Default([]) List<String> messages,
  }) = _CffStationboard;

  factory CffStationboard.fromJson(Map<String, dynamic> json) =>
      _$CffStationboardFromJson(json);
}
