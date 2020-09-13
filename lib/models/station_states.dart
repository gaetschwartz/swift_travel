import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swiss_travel/api/cff/cff_completion.dart';

part 'station_states.freezed.dart';

@freezed
abstract class StationStates with _$StationStates {
  const factory StationStates.loading() = Loading;
  const factory StationStates.completions(List<CffCompletion> completions) = StationCompletions;
  const factory StationStates.empty() = Empty;
  const factory StationStates.error(Object error) = Error;
  const factory StationStates.network() = NetworkError;
}
