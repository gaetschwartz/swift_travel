import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_free/api/cff/cff_completion.dart';

part 'favorites_states.freezed.dart';

@freezed
abstract class FavoritesStates with _$FavoritesStates {
  const factory FavoritesStates.data(List<CffCompletion> completions) = Data;
  const factory FavoritesStates.loading() = Loading;
  const factory FavoritesStates.error(Object error) = Error;
  const factory FavoritesStates.empty() = Empty;
}
