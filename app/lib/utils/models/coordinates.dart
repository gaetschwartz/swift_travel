import 'dart:convert';
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/logic/location/models/models.dart';

part 'coordinates.freezed.dart';
part 'coordinates.g.dart';

@freezed
class LatLon with _$LatLon {
  const factory LatLon(
    double lat,
    double lon,
  ) = _LatLon;
  const LatLon._();

  factory LatLon.fromList(List<double> coords) {
    assert(coords.length >= 2,
        'The coordinates list needs to contain at least 2 elements');
    return _LatLon(coords.first, coords[1]);
  }
  factory LatLon.fromGeoLocation(GeoLocation loc) =>
      _LatLon(loc.latitude, loc.longitude);

  /// Converts LV03 coordinates from the swiss coordinates system to regular GPS coordinates (WGS84).
  /// See [LV03ToWGS84Converter]
  factory LatLon.fromLV03(LV03Coordinates coords) =>
      const LV03ToWGS84Converter().convert(coords);

  factory LatLon.fromJson(Map<String, dynamic> json) => _$LatLonFromJson(json);

  /// Calculates the distance between the supplied coordinates in meters.
  ///
  /// The distance between the coordinates is calculated using the Haversine
  /// formula (see https://en.wikipedia.org/wiki/Haversine_formula).
  double distanceTo(LatLon o) => distanceBetween(this, o);

  /// Calculates the distance between the supplied coordinates in meters.
  ///
  /// The distance between the coordinates is calculated using the Haversine
  /// formula (see https://en.wikipedia.org/wiki/Haversine_formula).
  static double distanceBetween(LatLon start, LatLon end) {
    const earthRadius = 6378137.0;
    final dLat = (end.lat - start.lat).toRadians();
    final dLon = (end.lon - start.lon).toRadians();

    final a = pow(sin(dLat / 2), 2) +
        pow(sin(dLon / 2), 2) *
            cos(start.lat.toRadians()) *
            cos(end.lat.toRadians());
    final c = 2 * asin(sqrt(a));

    return earthRadius * c;
  }

  static LatLon? computeFrom({
    required double? lat,
    required double? lon,
    required int? x,
    required int? y,
    required String? name,
  }) {
    if (lat != null && lon != null) {
      return LatLon(lat, lon);
    }

    if (x != null && y != null) {
      return LatLon.fromLV03(LV03Coordinates(x, y));
    }

    if (name != null) {
      final coords = LV03Coordinates.tryParse(name);
      return coords?.toLatLon();
    }

    return null;
  }

  String toCoordinatesString() => '$lat,$lon';
}

@freezed
class LV03Coordinates with _$LV03Coordinates {
  const factory LV03Coordinates(int x, int y) = _LV03Coordinates;
  const LV03Coordinates._();

  static LV03Coordinates? tryParse(String string) {
    final indexOfAt = string.indexOf('@');
    final indexOfComma = string.lastIndexOf(',');

    if (indexOfAt != -1 && indexOfComma != -1) {
      final substringX = string.substring(indexOfComma + 1);
      final substringY = string.substring(indexOfAt + 1, indexOfComma);
      final x2 = int.tryParse(substringX);
      final y2 = int.tryParse(substringY);
      if (x2 != null && y2 != null) {
        return LV03Coordinates(x2, y2);
      }
    }
    return null;
  }

  LatLon toLatLon() => const LV03ToWGS84Converter().convert(this);
}

extension DoubleX on double {
  double toRadians() {
    const radiansFactor = pi / 180;
    return this * radiansFactor;
  }
}

/// Converts LV03 coordinates from the swiss coordinates system to regular GPS coordinates (WGS84).
/// This method is the approximate version which far more than enough for our usage.
///
/// See https://www.swisstopo.admin.ch/en/knowledge-facts/surveying-geodesy/reference-systems/switzerland.html
class LV03ToWGS84Converter extends Converter<LV03Coordinates, LatLon> {
  const LV03ToWGS84Converter();

  @override
  LatLon convert(LV03Coordinates input) {
    final x = (input.x - 2e5) / 1e6;
    final y = (input.y - 6e5) / 1e6;

    final x2 = pow(x, 2);
    final y2 = pow(y, 2);
    const f = 100 / 36;

    final lambdaP = (f * 2.6779094) +
        (f * 4.728982) * y +
        (f * 0.791484) * y * x +
        (f * 0.1306) * y * x2 -
        (f * 0.0436) * pow(y, 3);

    final phiP = (f * 16.9023892) +
        (f * 3.238272) * x -
        (f * 0.270978) * y2 -
        (f * 0.002528) * x2 -
        (f * 0.0447) * y2 * x -
        (f * 0.0140) * pow(x, 3);

    return LatLon(phiP, lambdaP);
  }
}

class WGS84ToLV03Converter extends Converter<LatLon, LV03Coordinates> {
  const WGS84ToLV03Converter();

// 1. Convert the ellipsoidal latitudes φ and longitudes λ into arcseconds ["]
// 2. Calculate the auxiliary values (differences of latitude and longitude relative to Bern in the unit
// [10000"]):
// φ' = (φ – 169028.66 ")/10000
// λ' = (λ – 26782.5 ")/10000
// 3. Calculate projection coordinates in LV95 (E, N, h) or in LV03 (y, x, h)
// E [m] = 2600072.37
//  + 211455.93 * λ'
//  - 10938.51 * λ' * φ'
//  - 0.36 * λ' * φ'
// 2
//  - 44.54 * λ'
// 3
// y [m] = E – 2000000.00
// N [m] = 1200147.07
//  + 308807.95 * φ'
//  + 3745.25 * λ'
// 2
//  + 76.63 * φ'
// 2
//  - 194.56 * λ'
// 2 * φ'
//  + 119.79 * φ'
// 3
// x [m] = N – 1000000.00
// hCH [m] =hWGS – 49.55
//  + 2.73 * λ'
//  + 6.94 * φ'
  @override
  LV03Coordinates convert(LatLon input) {
    // 1. Convert the ellipsoidal latitudes φ and longitudes λ into arcseconds ["]
    final phi = input.lat * 3600;
    final lambda = input.lon * 3600;

    // 2. Calculate the auxiliary values (differences of latitude and longitude relative to Bern in the unit
    // [10000"]):
    final phiP = (phi - 169028.66) / 10000;
    final lambdaP = (lambda - 26782.5) / 10000;

    // 3. Calculate projection coordinates in LV95 (E, N, h) or in LV03 (y, x, h)
    final e = 2600072.37 +
        211455.93 * lambdaP -
        10938.51 * lambdaP * phiP -
        0.36 * lambdaP * pow(phiP, 2) -
        44.54 * pow(lambdaP, 3);

    final n = 1200147.07 +
        308807.95 * phiP +
        3745.25 * pow(lambdaP, 2) +
        76.63 * pow(phiP, 2) -
        194.56 * pow(lambdaP, 2) * phiP +
        119.79 * pow(phiP, 3);

    return LV03Coordinates((e - 2000000).round(), (n - 1000000).round());
  }
}
