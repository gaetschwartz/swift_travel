import 'package:freezed_annotation/freezed_annotation.dart';

part 'exit.freezed.dart';
part 'exit.g.dart';

int delayFromJson(dynamic s) => s is String
    ? int.tryParse(s)
    : s == null
        ? null
        : throw FormatException("$s is not of type String but ${s.runtimeType}");
String delayToJson(int d) => d > 0 ? "+$d" : d.toString();

@freezed
abstract class Exit with _$Exit {
  @JsonSerializable(includeIfNull: false)
  factory Exit({
    DateTime arrival,
    String name,
    String stopid,
    int waittime,
    bool isaddress,
    String sbbName,
    double lat,
    double lon,
    @JsonKey(name: "arr_delay", fromJson: delayFromJson, toJson: delayFromJson) int arrDelay,
  }) = _Exit;

  factory Exit.fromJson(Map<String, dynamic> json) => _$ExitFromJson(json);
}
