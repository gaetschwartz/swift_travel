import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_free/api/cff/cff_completion.dart';

part 'station_states.freezed.dart';

@freezed
abstract class StationStates with _$StationStates {
  const factory StationStates.loading() = Loading;
  const factory StationStates.completions(List<CffCompletion> completions) = StationCompletions;
  const factory StationStates.empty() = Empty;
}
