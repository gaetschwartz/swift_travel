import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/prediction/models/models.dart';

part 'station_states.freezed.dart';

@freezed
class StationStates with _$StationStates {
  const factory StationStates.completions(List<Completion> completions) =
      CompletionsStationStates;
  const factory StationStates.empty() = EmptyStationStates;
  const factory StationStates.network() = NetworkErrorStationStates;
}
