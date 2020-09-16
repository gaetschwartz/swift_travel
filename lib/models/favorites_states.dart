import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swiss_travel/api/cff/cff_completion.dart';

part 'favorites_states.freezed.dart';

@freezed
abstract class FavoritesStates with _$FavoritesStates {
  const factory FavoritesStates.data(List<CffCompletion> completions) = FavoritesStatesData;
  const factory FavoritesStates.loading() = FavoritesStatesLoading;
  const factory FavoritesStates.exception(Exception exception) = FavoritesStatesError;
}
