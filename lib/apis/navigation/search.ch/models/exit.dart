import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';

part 'exit.freezed.dart';
part 'exit.g.dart';

int delayFromJson(dynamic s) {
  if (s is String && s != 'X') {
    return int.tryParse(s) ?? _defaultDelay;
  } else {
    return _defaultDelay;
  }
}

const _defaultDelay = 0;

String delayToJson(int d) => d >= 0 ? '+$d' : d.toString();

@freezed
class SbbExit with _$SbbExit, Exit {
  @JsonSerializable(includeIfNull: false)
  const factory SbbExit({
    @JsonKey(name: 'arr_delay', fromJson: delayFromJson, toJson: delayToJson)
    @Default(0)
        int arrDelay,
    DateTime? arrival,
    double? lat,
    double? lon,
    required String name,
    String? sbbName,
    String? stopid,
    String? track,
    @Default(0) int waittime,
    @Default(false) bool isaddress,
  }) = _Exit;
  const SbbExit._();

  factory SbbExit.fromJson(Map<String, dynamic> json) => _$SbbExitFromJson(json);
}
