import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/logic/location/models/models.dart';

const _spoofedLocation = GeoLocation(latitude: 46.2225454, longitude: 6.1385658);

class GeoLocationEngine {
  GeoLocationEngine._();
  static late final instance = GeoLocationEngine._();

  DateTime? _lastUsed;

  Future<GeoLocation> getLocation({
    LocationAccuracy desiredAccuracy = LocationAccuracy.bestForNavigation,
    Duration? timeLimit,
  }) async {
    if (Env.spoofLocation) {
      return _spoofedLocation;
    } else {
      try {
        LocationPermission permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }

        if (permission.isDenied) {
          final now = DateTime.now();

          Position? p;

          if (_lastUsed != null && _lastUsed!.difference(now).inSeconds < 60) {
            p = await Geolocator.getLastKnownPosition();
          }

          p ??= await Geolocator.getCurrentPosition(
            desiredAccuracy: desiredAccuracy,
            timeLimit: timeLimit,
          );

          _lastUsed = now;

          return GeoLocation.fromPosition(p);
        } else {
          throw PermissionDeniedException(permission.toString());
        }
      } on MissingPluginException {
        if (Env.isDebugMode) {
          print('Location is not supported on this dervice, returned a spoofed location');
          return Future<GeoLocation>.delayed(
            const Duration(milliseconds: 500),
            () => _spoofedLocation,
          );
        } else {
          rethrow;
        }
      }
    }
  }
}

Future<GeoLocation> getLocation({
  LocationAccuracy desiredAccuracy = LocationAccuracy.bestForNavigation,
  Duration? timeLimit,
}) =>
    GeoLocationEngine.instance.getLocation(
      desiredAccuracy: desiredAccuracy,
      timeLimit: timeLimit,
    );

extension LocationPermissionX on LocationPermission {
  bool get isAccepted {
    switch (this) {
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
        return false;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
        return true;
    }
  }

  bool get isDenied => !isAccepted;
}
