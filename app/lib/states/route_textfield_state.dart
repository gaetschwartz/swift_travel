import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_textfield_state.freezed.dart';

@freezed
class RouteTextfieldState with _$RouteTextfieldState {
  const factory RouteTextfieldState.empty() = EmptyRouteState;
  const factory RouteTextfieldState.text(
    String text, {
    @Default(true) bool doLoad,
  }) = TextRouteState;
  const factory RouteTextfieldState.useCurrentLocation() = UseCurrentLocation;

  const RouteTextfieldState._();

  bool get isEmpty => maybeWhen(empty: () => true, orElse: () => false);
}
