import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as l;
import 'package:swift_travel/utils/env.dart';

class LocationRepository {
  static Future<Position> getLocation({
    LocationAccuracy desiredAccuracy = LocationAccuracy.bestForNavigation,
    bool forceAndroidLocationManager = false,
    Duration timeLimit,
  }) async {
    if (Env.spoofLocation) {
      final location = l.Location();

      bool _serviceEnabled;
      l.PermissionStatus _permissionGranted;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return null;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == l.PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != l.PermissionStatus.granted) {
          return null;
        }
      }
      return Position(
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        timestamp: DateTime.now(),
        latitude: 46.2225454,
        longitude: 6.1385658,
      );
    } else if (kIsWeb) {
      final location = l.Location();

      bool _serviceEnabled;
      l.PermissionStatus _permissionGranted;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return null;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == l.PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != l.PermissionStatus.granted) {
          return null;
        }
      }

      final _locationData = await location.getLocation();
      log(_locationData.time.toString());
      return Position(
        latitude: _locationData.latitude,
        longitude: _locationData.longitude,
        altitude: _locationData.altitude,
        speed: _locationData.speed,
        accuracy: _locationData.accuracy,
        timestamp: DateTime.fromMillisecondsSinceEpoch(_locationData.time.round()),
        heading: _locationData.heading,
        speedAccuracy: _locationData.speedAccuracy,
      );
    } else {
      LocationPermission permission;

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        final p = await Geolocator.getCurrentPosition(
          desiredAccuracy: desiredAccuracy,
          forceAndroidLocationManager: forceAndroidLocationManager,
          timeLimit: timeLimit,
        );
        return p;
      } else {
        throw PermissionDeniedException(permission.toString());
      }
    }
  }
}
