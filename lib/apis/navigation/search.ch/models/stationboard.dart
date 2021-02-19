import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stationboard_connection.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';

part 'stationboard.freezed.dart';
part 'stationboard.g.dart';

class MySbbStationboardConverter implements JsonConverter<SbbStationboard, Map<String, dynamic>> {
  const MySbbStationboardConverter();

  @override
  SbbStationboard fromJson(Map<String, dynamic> json) {
    if (json['runtimeType'] != null) {
      // ignore: deprecated_member_use_from_same_package
      return SbbStationboard.fromJson(json);
    }

    if (json.containsKey('messages')) {
      return SbbStationboardError.fromJson(json);
    } else {
      return SbbStationboardData.fromJson(json);
    }
  }

  @override
  Map<String, dynamic> toJson(SbbStationboard data) => data.toJson();
}

const _converter = MySbbStationboardConverter();

@freezed
class SbbStationboard with _$SbbStationboard {
  const factory SbbStationboard({
    required SbbStop stop,
    required String stopName,
    @Default(<SbbStationboardConnection>[]) List<SbbStationboardConnection> connections,
    @Default(<String>[]) List<String> messages,
  }) = SbbStationboardData;

  const factory SbbStationboard.error(List<String> messages) = SbbStationboardError;

  @Deprecated('Use SbbStationboard.parse')
  factory SbbStationboard.fromJson(Map<String, dynamic> json) => _$SbbStationboardFromJson(json);
  factory SbbStationboard.parse(Map<String, dynamic> json) => _converter.fromJson(json);
}
