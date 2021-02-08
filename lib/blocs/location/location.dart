import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart' as g;
import 'package:swift_travel/blocs/location/models/models.dart';
import 'package:swift_travel/utils/env.dart';

class LocationRepository {
  static Future<Position> getLocation({
    g.LocationAccuracy desiredAccuracy = g.LocationAccuracy.bestForNavigation,
    bool forceAndroidLocationManager = false,
    Duration timeLimit,
  }) async {
    if (Env.spoofLocation) {
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
      throw UnsupportedError('We location is unsupported');
    } else {
      g.LocationPermission permission;

      permission = await g.Geolocator.checkPermission();
      if (permission == g.LocationPermission.denied) {
        permission = await g.Geolocator.requestPermission();
      }
      if (permission == g.LocationPermission.whileInUse ||
          permission == g.LocationPermission.always) {
        final p = await g.Geolocator.getCurrentPosition(
          desiredAccuracy: desiredAccuracy,
          forceAndroidLocationManager: forceAndroidLocationManager,
          timeLimit: timeLimit,
        );
        return Position.fromPosition(p);
      } else {
        throw g.PermissionDeniedException(permission.toString());
      }
    }
  }
}
