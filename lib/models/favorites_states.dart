import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/cff/favorite_stop.dart';

part 'favorites_states.freezed.dart';

@freezed
abstract class FavoritesStates with _$FavoritesStates {
  const factory FavoritesStates.data(List<FavoriteStop> favorites) = FavoritesStatesData;
  const factory FavoritesStates.loading() = FavoritesStatesLoading;
  const factory FavoritesStates.exception(Exception exception) = FavoritesStatesError;
}
