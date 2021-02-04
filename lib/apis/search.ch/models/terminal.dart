import 'package:freezed_annotation/freezed_annotation.dart';

part 'terminal.freezed.dart';
part 'terminal.g.dart';

@freezed
abstract class Terminal with _$Terminal {
  const factory Terminal({
    String id,
    String name,
    int x,
    int y,
  }) = _Terminal;

  factory Terminal.fromJson(Map<String, dynamic> json) => _$TerminalFromJson(json);
}
