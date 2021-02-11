import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/search.ch/models/stationboard_connection.dart';
import 'package:swift_travel/apis/search.ch/models/stop.dart';

part 'cff_stationboard.freezed.dart';
part 'cff_stationboard.g.dart';

@freezed
abstract class CffStationboard with _$CffStationboard {
  const factory CffStationboard({
    required Stop stop,
    required String stopName,
    @Default([]) List<StationboardConnection> connections,
    String? request,
    @Default([]) List<String> messages,
  }) = _CffStationboard;

  factory CffStationboard.fromJson(Map<String, dynamic> json) => _$CffStationboardFromJson(json);
}
