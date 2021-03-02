import 'package:freezed_annotation/freezed_annotation.dart';

part 'context.freezed.dart';
part 'context.g.dart';

@freezed
class SncfContext with _$SncfContext {
  const factory SncfContext({
    DateTime? dateTime,
    String? timezone,
  }) = _SncfContext;

  factory SncfContext.fromJson(Map<String, dynamic> json) => _$SncfContextFromJson(json);
}
