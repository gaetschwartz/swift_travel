import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/sncf/models/sncf_place.dart';

part 'sncf_completion.freezed.dart';
part 'sncf_completion.g.dart';

@freezed
abstract class SncfCompletion with _$SncfCompletion {
  @JsonSerializable(explicitToJson: true)
  factory SncfCompletion({
    @Default(<SncfPlace>[]) List<SncfPlace> places,
  }) = _SncfCompletion;

  factory SncfCompletion.fromJson(Map<String, dynamic> json) => _$SncfCompletionFromJson(json);
}
