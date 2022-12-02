import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';

/// The response to [NavigationCompletionDelegateApi.complete]
abstract class NavigationCompletion {
  /// Name of the completion
  String get label;

  /// Id of the completion
  String? get id;

  /// Type of the completion
  LocationType get type;

  /// Returns the icon for this completion.
  // ignore: avoid-unused-parameters
  Widget Function(BuildContext context)? get iconBuilder;

  /// Coordinates of the location, if available.
  GeoCoordinates? get coordinates;

  /// Distance to the query if available
  double? get dist;
}

/// The origin of the completion.
enum DataOrigin {
  /// Comes from the data being in favorites.
  favorites,

  /// Comes from search the history.
  history,

  /// Comes from the data being in online/up-to-date.
  api,

  /// Comes from the current location.
  currentLocation,

  /// Comes from the data being predicted using an ML model.
  prediction,

  /// The data is a sample empty data to indicaate it's loading.
  loading,

  /// Data is a contact
  contacts
}

mixin GeoCoordinates {
  double get latitude;
  double get longitude;

// haversine formula
  static double distance(GeoCoordinates c1, GeoCoordinates c2) {
    const earthRadius = 6378137.0;
    final startLatitude = c1.latitude;
    final startLongitude = c1.longitude;
    final endLatitude = c2.latitude;
    final endLongitude = c2.longitude;
    final dLat = _toRadians(endLatitude - startLatitude);
    final dLon = _toRadians(endLongitude - startLongitude);

    final a = pow(sin(dLat / 2), 2) +
        pow(sin(dLon / 2), 2) *
            cos(_toRadians(startLatitude)) *
            cos(_toRadians(endLatitude));
    final c = 2 * asin(sqrt(a));

    return earthRadius * c;
  }

  static const earthRadius = 6378137.0;
  static const piDiv180 = pi / 180.0;

  static double _toRadians(double deg) => deg * piDiv180;
}
