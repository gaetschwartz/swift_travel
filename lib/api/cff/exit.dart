import 'package:freezed_annotation/freezed_annotation.dart';

part 'exit.freezed.dart';
part 'exit.g.dart';

@freezed
abstract class Exit with _$Exit {
  factory Exit({
    DateTime arrival,
    String name,
    String stopid,
    int waittime,
    bool isaddress,
    String sbbName,
  }) = _Exit;

  factory Exit.fromJson(Map<String, dynamic> json) => _$ExitFromJson(json);
}
