import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';

part 'station_states.freezed.dart';

@freezed
abstract class StationStates with _$StationStates {
  const factory StationStates.completions(List<Completion> completions) = StationStatesCompletions;
  const factory StationStates.empty() = StationStatesEmpty;
  const factory StationStates.network() = StationStatesNetworkError;
}
