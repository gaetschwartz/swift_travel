import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/data.sbb.ch/models/geo_models.dart';
import 'package:swift_travel/utils/arithmetic.dart';

part 'coordinates.freezed.dart';
part 'coordinates.g.dart';

@freezed
class LatLon with _$LatLon {
  const factory LatLon(
    double lat,
    double lon,
  ) = _LatLon;

  factory LatLon.fromGeoAttr(GeoAttr geoAttr) => _LatLon(geoAttr.lat!, geoAttr.lon!);
  factory LatLon.fromList(List<double> coords) {
    assert(coords.length >= 2, 'The coordinates list needs to contain at least 2 elements');
    return _LatLon(coords[0], coords[1]);
  }

  /// Converts LV03 coordinates from the swiss coordinates system to regular GPS coordinates (WGS84).
  /// See [LV03ToWGS84Converter]
  factory LatLon.fromLV03(LV03Coordinates coords) => lv03ToWGS84Converter.convert(coords);

  factory LatLon.fromJson(Map<String, dynamic> json) => _$LatLonFromJson(json);

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
        final x = int.tryParse(s.split(',').first);
        final y = int.tryParse(s.split(',').last);
        if (x != null && y != null) {
          return LatLon.fromLV03(LV03Coordinates(x, y));
        }
      }
    }

    return null;
  }
}

@freezed
class LV03Coordinates with _$LV03Coordinates {
  factory LV03Coordinates(int x, int y) = _LV03Coordinates;

  factory LV03Coordinates.fromJson(Map<String, dynamic> json) => _$LV03CoordinatesFromJson(json);
}
