import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_textfield_state.freezed.dart';

@freezed
abstract class RouteTextfieldState with _$RouteTextfieldState {
  const factory RouteTextfieldState.empty() = RouteTextfieldStateEmpty;
  const factory RouteTextfieldState.text(String text) = RouteTextfieldStateText;
  const factory RouteTextfieldState.currentLocation(
    String location, {
    @required double lat,
    @required double lon,
  }) = RouteTextfieldStateLocation;
}
