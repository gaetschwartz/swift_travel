// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/models/favorite_stop.dart';

part 'cff_completion.freezed.dart';
part 'cff_completion.g.dart';

@freezed
abstract class CffCompletion implements _$CffCompletion {
  factory CffCompletion({
    String label,
    double dist,
    @JsonKey(name: 'iconclass') String icon,
    String html,
    String id,
    String favoriteName,
    @Default(false) bool isCurrentLocation,
  }) = _CffCompletion;
  const CffCompletion._();

  factory CffCompletion.fromJson(Map<String, dynamic> json) => _$CffCompletionFromJson(json);

  FavoriteStop toFavoriteStop({String name}) => FavoriteStop(label, name: name ?? label);
}
