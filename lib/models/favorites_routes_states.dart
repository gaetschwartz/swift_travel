import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/cff/models/local_route.dart';

part 'favorites_routes_states.freezed.dart';

@freezed
abstract class FavoritesRoutesStates with _$FavoritesRoutesStates {
  const factory FavoritesRoutesStates.data(List<LocalRoute> routes) = FavoritesRoutesStatesData;
  const factory FavoritesRoutesStates.loading() = FavoritesRoutesStatesLoading;
  const factory FavoritesRoutesStates.exception(Exception exception) = FavoritesRoutesStatesError;
}
