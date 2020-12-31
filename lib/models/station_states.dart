import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/cff/cff_completion.dart';

part 'station_states.freezed.dart';

@freezed
abstract class StationStates with _$StationStates {
  const factory StationStates.completions(List<CffCompletion> completions) =
      StationStatesCompletions;
  const factory StationStates.empty() = StationStatesEmpty;
  const factory StationStates.network() = StationStatesNetworkError;
}
