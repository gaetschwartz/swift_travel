import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
    double? accuracy,
    double? altitude,
    double? heading,
    double? speed,
    double? speedAccuracy,
    DateTime? timestamp,
  }) = _Location;

  factory Location.fromPosition(Position p) => _Location(
        latitude: p.latitude,
        longitude: p.longitude,
        accuracy: p.accuracy,
        altitude: p.altitude,
        heading: p.heading,
        speed: p.speed,
        speedAccuracy: p.speedAccuracy,
        timestamp: p.timestamp,
      );

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
