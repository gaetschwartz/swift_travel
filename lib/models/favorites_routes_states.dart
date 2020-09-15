import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swiss_travel/api/cff/local_route.dart';

part 'favorites_routes_states.freezed.dart';

@freezed
abstract class FavoritesRoutesStates with _$FavoritesRoutesStates {
  const factory FavoritesRoutesStates.data(List<LocalRoute> routes) = Data;
  const factory FavoritesRoutesStates.loading() = Loading;
  const factory FavoritesRoutesStates.error(Object error) = Error;
}
