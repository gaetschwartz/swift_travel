import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/logic/location/models/models.dart';
import 'package:swift_travel/mocking/mocking.dart';

late final _spoofedLocation = GeoLocation(
  accuracy: 0,
  altitude: 0,
  heading: 0,
  speed: 0,
  speedAccuracy: 0,
  timestamp: FakeableDateTime.now(),
  latitude: 46.2225454,
  longitude: 6.1385658,
);

Future<GeoLocation> getLocation({
  LocationAccuracy desiredAccuracy = LocationAccuracy.bestForNavigation,
  bool forceAndroidLocationManager = false,
  Duration? timeLimit,
}) async {
  if (Env.spoofLocation) {
    return _spoofedLocation;
  } else {
    try {
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
        return GeoLocation.fromPosition(p);
      } else {
        throw PermissionDeniedException(permission.toString());
      }
    } on MissingPluginException {
      if (kDebugMode) {
        log('Location is not fully supported on this dervice, returned a spoofed location');
        await Future.delayed(const Duration(seconds: 1), () {});
      }

      return _spoofedLocation;
    }
  }
}
