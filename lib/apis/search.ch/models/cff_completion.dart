// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/models/favorite_stop.dart';

part 'cff_completion.freezed.dart';
part 'cff_completion.g.dart';

@freezed
abstract class CffCompletion with _$CffCompletion {
  @JsonSerializable(includeIfNull: false)
  const factory CffCompletion({
    required String label,
    double? dist,
    @JsonKey(name: 'iconclass') String? icon,
    String? html,
    String? id,
    String? favoriteName,
    @Default(DataOrigin.data) DataOrigin origin,
  }) = _CffCompletion;

  factory CffCompletion.fromFavorite(FavoriteStop stop) => _CffCompletion(
        label: stop.stop,
        favoriteName: stop.name,
        origin: DataOrigin.favorites,
      );

  factory CffCompletion.fromJson(Map<String, dynamic> json) => _$CffCompletionFromJson(json);
}

enum DataOrigin {
  favorites,
  history,
  data,
  currentLocation,
}
