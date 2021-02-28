import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swift_travel/apis/data.sbb.ch/models/geo_models.dart';

part 'coordinates.freezed.dart';
part 'coordinates.g.dart';

@freezed
class LatLon with _$LatLon {
  const factory LatLon(
    double lat,
    double lon,
  ) = _LatLon;

  factory LatLon.fromGeoAttr(GeoAttr geoAttr) => _LatLon(geoAttr.lat!, geoAttr.lon!);
  factory LatLon.fromCoordinates(List<double> coords) => _LatLon(coords[0], coords[1]);

  factory LatLon.fromJson(Map<String, dynamic> json) => _$LatLonFromJson(json);
}

@freezed
class LV03Coordinates with _$LV03Coordinates {
  factory LV03Coordinates(int x, int y) = _LV03Coordinates;

  factory LV03Coordinates.fromJson(Map<String, dynamic> json) => _$LV03CoordinatesFromJson(json);
}
