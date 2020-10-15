import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_textfield_state.freezed.dart';

@freezed
abstract class RouteTextfieldState with _$RouteTextfieldState {
  const factory RouteTextfieldState.empty() = RouteTextfieldStateEmpty;
  const factory RouteTextfieldState.controller() = RouteTextfieldStateController;
  const factory RouteTextfieldState.currentLocation() = RouteTextfieldStateLocation;
}
