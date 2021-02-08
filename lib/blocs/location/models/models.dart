import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart' as g;

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class Position with _$Position {
  const factory Position({
    @required double latitude,
    @required double longitude,
    double accuracy,
    double altitude,
    double heading,
    double speed,
    double speedAccuracy,
    DateTime timestamp,
  }) = _Position;

  factory Position.fromPosition(g.Position p) => _Position(
        latitude: p.latitude,
        longitude: p.longitude,
        accuracy: p.accuracy,
        altitude: p.altitude,
        heading: p.heading,
        speed: p.speed,
        speedAccuracy: p.speedAccuracy,
        timestamp: p.timestamp,
      );

  factory Position.fromJson(Map<String, dynamic> json) => _$PositionFromJson(json);
}
