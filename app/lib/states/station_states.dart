import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';

part 'station_states.freezed.dart';

@freezed
class StationStates with _$StationStates {
  const factory StationStates.completions(
      List<NavigationCompletion> completions) = CompletionsStationStates;
  const factory StationStates.empty() = EmptyStationStates;
  const factory StationStates.network() = NetworkErrorStationStates;
}
