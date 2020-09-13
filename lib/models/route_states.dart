import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swiss_travel/api/cff/cff_route.dart';

part 'route_states.freezed.dart';

@freezed
abstract class RouteStates with _$RouteStates {
  const factory RouteStates.routes(CffRoute routes) = Data;
  const factory RouteStates.network() = Network;
  const factory RouteStates.error(Object error) = Error;
  const factory RouteStates.empty() = Empty;
}
