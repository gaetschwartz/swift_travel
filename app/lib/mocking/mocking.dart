import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mocking.g.dart';

@JsonLiteral('route.json', asConst: true)
Map<String, Object?> get mockRoute =>
    kDebugMode ? _$mockRouteJsonLiteral : throw UnsupportedError('Only mock on debug');

@JsonLiteral('stationboard.json', asConst: true)
Map<String, Object?> get mockStationboard =>
    kDebugMode ? _$mockStationboardJsonLiteral : throw UnsupportedError('Only mock on debug');

class FakeableDateTime {
  FakeableDateTime._();

  static DateTime? fakeDate;

  /// Returns the value of `fakeDate` if specified, else the current `DateTime` (`DateTime.now()`).
  static DateTime now() => fakeDate ?? DateTime.now();
}
