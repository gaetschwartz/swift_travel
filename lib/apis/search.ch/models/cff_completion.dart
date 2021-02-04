// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/models/favorite_stop.dart';

part 'cff_completion.freezed.dart';
part 'cff_completion.g.dart';

@freezed
abstract class CffCompletion with _$CffCompletion {
  const factory CffCompletion({
    String label,
    double dist,
    @JsonKey(name: 'iconclass') String icon,
    String html,
    String id,
    String favoriteName,
    @Default(false) bool isCurrentLocation,
  }) = _CffCompletion;

  factory CffCompletion.fromFavorite(FavoriteStop stop) =>
      _CffCompletion(label: stop.stop, favoriteName: stop.name, icon: 'favorite');

  factory CffCompletion.fromJson(Map<String, dynamic> json) => _$CffCompletionFromJson(json);
}
