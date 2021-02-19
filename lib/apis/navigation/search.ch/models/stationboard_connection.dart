import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/exit.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/subsequent_stop.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';

part 'stationboard_connection.freezed.dart';
part 'stationboard_connection.g.dart';

@freezed
abstract class SbbStationboardConnection with _$SbbStationboardConnection {
  @JsonSerializable(explicitToJson: true)
  const factory SbbStationboardConnection({
    required DateTime time,
    required Vehicle type,
    required String color,
    required SbbStop terminal,
    String? line,
    @JsonKey(name: 'operator') String? operator_,
    @Default('') String number,
    @JsonKey(name: '*G') String? g,
    @JsonKey(name: '*L') String? l,
    @JsonKey(name: 'subsequent_stops', defaultValue: <SubsequentStop>[])
    @Default(<SubsequentStop>[])
        List<SubsequentStop> subsequentStops,
    @JsonKey(name: 'dep_delay', fromJson: delayFromJson, toJson: delayToJson)
    @Default(0)
        int depDelay,
    @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
    @Default(0)
        int arrDelay,
  }) = _SbbStationboardConnection;

  factory SbbStationboardConnection.fromJson(Map<String, dynamic> json) =>
      _$SbbStationboardConnectionFromJson(json);
}
