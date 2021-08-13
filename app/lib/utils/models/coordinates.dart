import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/logic/location/models/models.dart';
import 'package:swift_travel/utils/arithmetic.dart';

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
    assert(coords.length >= 2, 'The coordinates list needs to contain at least 2 elements');
    return _LatLon(coords[0], coords[1]);
  }
  factory LatLon.fromGeoLocation(GeoLocation loc) => _LatLon(loc.latitude, loc.longitude);

  /// Converts LV03 coordinates from the swiss coordinates system to regular GPS coordinates (WGS84).
  /// See [LV03ToWGS84Converter]
  factory LatLon.fromLV03(LV03Coordinates coords) => lv03ToWGS84Converter.convert(coords);

  factory LatLon.fromJson(Map<String, dynamic> json) => _$LatLonFromJson(json);

  double distanceTo(LatLon o) => distanceBetween(this, o);
  double scaledDistanceTo(LatLon o) {
    // Average of max and min cirumferences of earth divided by two for max distance
    const maxDist = (40075017 + 40007860) / 4;
    return distanceTo(o) / maxDist;
  }

  /// Calculates the distance between the supplied coordinates in meters.
  ///
  /// The distance between the coordinates is calculated using the Haversine
  /// formula (see https://en.wikipedia.org/wiki/Haversine_formula).
  static double distanceBetween(LatLon start, LatLon end) {
    const earthRadius = 6378137.0;
    final dLat = (end.lat - start.lat).toRadians();
    final dLon = (end.lon - start.lon).toRadians();

    final a = pow(sin(dLat / 2), 2) +
        pow(sin(dLon / 2), 2) * cos(start.lat.toRadians()) * cos(end.lat.toRadians());
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
      final i = name.indexOf('@');

      if (i != -1) {
        final s = name.substring(i + 1);
        final x2 = int.tryParse(s.split(',').last);
        final y2 = int.tryParse(s.split(',').first);
        if (y2 != null && x2 != null) {
          return LatLon.fromLV03(LV03Coordinates(x2, y2));
        }
      }
    }

    return null;
  }

  String toCoordinatesString() => '$lat,$lon';
}

@freezed
class LV03Coordinates with _$LV03Coordinates {
  factory LV03Coordinates(int x, int y) = _LV03Coordinates;

  factory LV03Coordinates.fromJson(Map<String, dynamic> json) => _$LV03CoordinatesFromJson(json);
}

extension DoubleX on double {
  double toRadians() {
    const radiansFactor = pi / 180;
    return this * radiansFactor;
  }
}
