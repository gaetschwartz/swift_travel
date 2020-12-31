import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/cff/cff_route.dart';

part 'route_states.freezed.dart';

@freezed
abstract class RouteStates with _$RouteStates {
  const factory RouteStates.routes(CffRoute routes) = RouteStatesData;
  const factory RouteStates.network() = RouteStatesNetwork;
  const factory RouteStates.exception(Object exception) = RouteStatesException;
  const factory RouteStates.empty() = RouteStatesEmpty;
  const factory RouteStates.loading() = RouteStatesLoading;
}
