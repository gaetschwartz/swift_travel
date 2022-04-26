import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
    required double latitude,
    required double longitude,
    double? accuracy,
    double? altitude,
    double? heading,
    double? speed,
    double? speedAccuracy,
    DateTime? timestamp,
  }) = _GeoLocation;

  factory GeoLocation.fromPosition(Position p) => _GeoLocation(
        latitude: p.latitude,
        longitude: p.longitude,
        accuracy: p.accuracy,
        altitude: p.altitude,
        heading: p.heading,
        speed: p.speed,
        speedAccuracy: p.speedAccuracy,
        timestamp: p.timestamp,
      );

  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);
}
