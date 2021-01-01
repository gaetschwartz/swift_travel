import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_textfield_state.freezed.dart';

@freezed
abstract class RouteTextfieldState with _$RouteTextfieldState {
  const factory RouteTextfieldState.empty() = EmptyRouteState;
  const factory RouteTextfieldState.text(String text) = TextRouteState;
  const factory RouteTextfieldState.useCurrentLocation() = UseCurrentLocation;
}
