import 'package:freezed_annotation/freezed_annotation.dart';

part 'exit.freezed.dart';
part 'exit.g.dart';

int delayFromJson(dynamic s) => (s is String ? int.tryParse(s) : null) ?? 0;
String delayToJson(int d) => d > 0 ? '+$d' : d.toString();

@freezed
abstract class Exit with _$Exit {
  @JsonSerializable(includeIfNull: false)
  factory Exit({
    DateTime arrival,
    String name,
    String stopid,
    @JsonKey(name: "waittime", defaultValue: 0) int waitTime,
    bool isaddress,
    String sbbName,
    double lat,
    double lon,
    @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson) int arrDelay,
  }) = _Exit;

  factory Exit.fromJson(Map<String, dynamic> json) => _$ExitFromJson(json);
}
