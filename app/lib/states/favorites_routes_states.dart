import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/models/favorites.dart';

part 'favorites_routes_states.freezed.dart';

@freezed
class FavoritesRoutesStates with _$FavoritesRoutesStates {
  const factory FavoritesRoutesStates.data(List<LocalRoute> routes) =
      FavoritesRoutesStatesData;
  const factory FavoritesRoutesStates.loading() = FavoritesRoutesStatesLoading;
  const factory FavoritesRoutesStates.exception(Exception exception) =
      FavoritesRoutesStatesError;
}
