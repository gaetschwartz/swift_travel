import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';

part 'route_states.freezed.dart';

@freezed
abstract class RouteStates with _$RouteStates {
  const factory RouteStates.routes(CffRoute routes) = RSData;
  const factory RouteStates.networkException() = RSNetworkException;
  const factory RouteStates.locationPermissionNotGranted() = RSLocationPermissionNotGranted;
  const factory RouteStates.missingPluginException() = RSMissingPluginException;
  const factory RouteStates.exception(Object exception) = RSException;
  const factory RouteStates.empty() = RSEmpty;
  const factory RouteStates.loading() = RSLoading;
}