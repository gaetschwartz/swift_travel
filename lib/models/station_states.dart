import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';

part 'station_states.freezed.dart';

@freezed
abstract class StationStates with _$StationStates {
  const factory StationStates.loading() = StationStatesLoading;
  const factory StationStates.completions(List<CffCompletion> completions) =
      StationStatesCompletions;
  const factory StationStates.empty() = StationStatesEmpty;
  const factory StationStates.exception(Exception exception) =
      StationStatesException;
  const factory StationStates.network() = StationStatesNetworkError;
}
