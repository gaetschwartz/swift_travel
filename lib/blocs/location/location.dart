import 'package:geolocator/geolocator.dart';
import 'package:swift_travel/blocs/location/models/models.dart';
import 'package:swift_travel/utils/env.dart';

class LocationRepository {
  static Future<Location> getLocation({
    LocationAccuracy desiredAccuracy = LocationAccuracy.bestForNavigation,
    bool forceAndroidLocationManager = false,
    Duration? timeLimit,
  }) async {
    if (Env.spoofLocation) {
      return Location(
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        timestamp: DateTime.now(),
        latitude: 46.2225454,
        longitude: 6.1385658,
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
        return Location.fromPosition(p);
      } else {
        throw PermissionDeniedException(permission.toString());
      }
    }
  }
}
