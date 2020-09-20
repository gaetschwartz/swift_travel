import 'package:freezed_annotation/freezed_annotation.dart';

part 'cff_completion.freezed.dart';
part 'cff_completion.g.dart';

@freezed
abstract class CffCompletion with _$CffCompletion {
  factory CffCompletion({
    String label,
    double dist,
    String iconclass,
    String html,
    String id,
    @Default(false) bool isFavorite,
  }) = _CffCompletion;

  factory CffCompletion.fromJson(Map<String, dynamic> json) => _$CffCompletionFromJson(json);
}
