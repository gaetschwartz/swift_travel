import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/search.ch/models/stationboard_connection.dart';
import 'package:swift_travel/apis/search.ch/models/stop.dart';

part 'stationboard.freezed.dart';
part 'stationboard.g.dart';

@freezed
abstract class CffStationboard with _$CffStationboard {
  const factory CffStationboard({
    required Stop stop,
    required String stopName,
    @Default([]) List<StationboardConnection> connections,
    @Default([]) List<String> messages,
  }) = CffStationboardData;

  const factory CffStationboard.error(List<String> messages) = CffStationboardError;

  factory CffStationboard.fromJson(Map<String, dynamic> json) => _$CffStationboardFromJson(json);

  factory CffStationboard.parse(Map<String, dynamic> json) {
    if (json.containsKey('messages')) {
      return CffStationboardError.fromJson(json);
    } else {
      return CffStationboardData.fromJson(json);
    }
  }
}
