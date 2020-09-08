import 'package:freezed_annotation/freezed_annotation.dart';

part 'completion.freezed.dart';
part 'completion.g.dart';

@freezed
abstract class Completion with _$Completion {
  factory Completion(String label, {int dist, String iconclass, String html}) = _Completion;

  factory Completion.fromJson(Map<String, dynamic> json) => _$CompletionFromJson(json);
}
