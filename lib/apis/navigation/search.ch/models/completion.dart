// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/models/favorite_stop.dart';

part 'completion.freezed.dart';
part 'completion.g.dart';

@freezed
abstract class SbbCompletion with _$SbbCompletion {
  @JsonSerializable(includeIfNull: false)
  const factory SbbCompletion({
    required String label,
    double? dist,
    @JsonKey(name: 'iconclass') String? iconClass,
    String? html,
    String? id,
    String? favoriteName,
    @Default(DataOrigin.data) DataOrigin origin,
  }) = _SbbCompletion;

  factory SbbCompletion.fromFavorite(FavoriteStop stop) => _SbbCompletion(
        label: stop.stop,
        favoriteName: stop.name,
        origin: DataOrigin.favorites,
      );

  factory SbbCompletion.fromJson(Map<String, dynamic> json) => _$SbbCompletionFromJson(json);
}
