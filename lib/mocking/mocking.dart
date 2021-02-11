import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mocking.g.dart';

@JsonLiteral('route.json', asConst: true)
const mockRoute = kDebugMode ? _$mockRouteJsonLiteral : null;

@JsonLiteral('stationboard.json', asConst: true)
const mockStationboard = kDebugMode ? _$mockStationboardJsonLiteral : null;

extension CustomizableDateTime on DateTime {
  static DateTime? _customTime;
  static DateTime get current {
    return _customTime ?? DateTime.now();
  }

  static set customTime(DateTime customTime) {
    _customTime = customTime;
  }
}
