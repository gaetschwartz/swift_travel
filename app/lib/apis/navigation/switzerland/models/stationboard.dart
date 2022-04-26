import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/mock_stop.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';

import 'stationboard_connection.dart';
import 'stop.dart';

part 'stationboard.freezed.dart';
part 'stationboard.g.dart';

class CustomStopConverter
    implements JsonConverter<Stop, Map<String, dynamic>?> {
  const CustomStopConverter();

  @override
  Stop fromJson(Map<String, dynamic>? json) => customStopFromJson(json);

  @override
  Map<String, dynamic>? toJson(Stop object) => customToJson(object);

  static Map<String, dynamic>? customToJson(Stop object) {
    if (object is SbbStop) {
      return object.toJson();
    }
    assert(
        false, 'Stop is supposed to be either a `SbbStop` to be serializable');
    return const SbbStop(name: '').toJson();
  }

  static Stop customStopFromJson(Map<String, dynamic>? json) =>
      json == null ? const MockStop() : SbbStop.fromJson(json);
}

@freezed
class SbbStationboard with _$SbbStationboard, StationBoard {
  @JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
  const factory SbbStationboard({
    @Default(SbbStop(name: '')) @JsonKey(name: 'stop') SbbStop? sbbStop,
    @JsonKey(name: 'connections', defaultValue: <SbbStationboardConnection>[])
    @Default(<SbbStationboardConnection>[])
        List<SbbStationboardConnection> sbbConnections,
    @Default(<Object>[]) List<Object> messages,
  }) = _SbbStationboard;
  const SbbStationboard._();

  factory SbbStationboard.fromJson(Map<String, dynamic> json) =>
      _$SbbStationboardFromJson(json);

  @override
  List<StationboardConnection> get connections => sbbConnections;

  @override
  Stop get stop => sbbStop!;

  @override
  String get stopName => sbbStop!.name;

  @override
  bool get hasError => errors.isNotEmpty;

  @override
  List<Object> get errors => messages;
}
