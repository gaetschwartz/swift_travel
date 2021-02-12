// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/models/favorite_stop.dart';

part 'completion.freezed.dart';
part 'completion.g.dart';

@freezed
abstract class NavCompletion with _$NavCompletion {
  @JsonSerializable(includeIfNull: false)
  const factory NavCompletion({
    required String label,
    double? dist,
    @JsonKey(name: 'iconclass') String? icon,
    String? html,
    String? id,
    String? favoriteName,
    @Default(DataOrigin.data) DataOrigin origin,
  }) = _NavCompletion;

  factory NavCompletion.fromFavorite(FavoriteStop stop) => _NavCompletion(
        label: stop.stop,
        favoriteName: stop.name,
        origin: DataOrigin.favorites,
      );

  factory NavCompletion.fromJson(Map<String, dynamic> json) => _$NavCompletionFromJson(json);
}

enum DataOrigin {
  favorites,
  history,
  data,
  currentLocation,
}
