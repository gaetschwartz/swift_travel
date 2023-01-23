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
    if (object is SchStop) {
      return object.toJson();
    }
    assert(
        false, 'Stop is supposed to be either a `SchStop` to be serializable');
    return const SchStop(sbbName: '').toJson();
  }

  static Stop customStopFromJson(Map<String, dynamic>? json) =>
      json == null ? const MockStop() : SchStop.fromJson(json);
}

@freezed
class SchStationboard with _$SchStationboard, StationBoard {
  @JsonSerializable(explicitToJson: true, includeIfNull: false, checked: true)
  const factory SchStationboard({
    @Default(SchStop(sbbName: '')) @JsonKey(name: 'stop') SchStop? sbbStop,
    @JsonKey(name: 'connections', defaultValue: <SchStationboardConnection>[])
    @Default(<SchStationboardConnection>[])
        List<SchStationboardConnection> sbbConnections,
    @Default(<Object>[]) List<Object> messages,
  }) = _SchStationboard;
  const SchStationboard._();

  factory SchStationboard.fromJson(Map<String, dynamic> json) =>
      _$SchStationboardFromJson(json);

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
