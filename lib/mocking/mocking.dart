import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mocking.g.dart';

@JsonLiteral('route.json', asConst: true)
const mockRoute = kDebugMode ? _$mockRouteJsonLiteral : null;

@JsonLiteral('stationboard.json', asConst: true)
const mockStationboard = kDebugMode ? _$mockStationboardJsonLiteral : null;

extension MockableDateTime on DateTime {
  static DateTime? _mocked;

  /// Returns the value of `mocked` if specified, else the current `DateTime.now()`.
  static DateTime now() => _mocked ?? DateTime.now();

  static set mocked(DateTime? mocked) => _mocked = mocked;
  static DateTime? get mocked => _mocked;
}
