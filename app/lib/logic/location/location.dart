import 'package:flutter/services.dart';
import 'package:gaets_logging/logging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/logic/location/models/models.dart';

const _spoofedLocation =
    GeoLocation(latitude: 46.2225454, longitude: 6.1385658);

class GeoLocationEngine {
  GeoLocationEngine._();
  static final instance = GeoLocationEngine._();

  final log = Logger.of('GeoLocationEngine');

  Future<GeoLocation> getLocation({
    LocationAccuracy accuracy = LocationAccuracy.high,
    Duration? timeout,
  }) async {
    if (Env.spoofLocation) {
      return _spoofedLocation;
    } else {
      try {
        var permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          log.i('Requesting permission because it was denied.');
          permission = await Geolocator.requestPermission();
        }

        if (permission.isAccepted) {
          final lastKnown = await Geolocator.getLastKnownPosition();

          if (lastKnown != null) {
            final now = DateTime.now();
            final timestamp = lastKnown.timestamp;
            if (timestamp != null) {
              final seconds = now.difference(timestamp).inSeconds;
              final condition = seconds < 60;
              log.log(
                  "Obtained last known position which was ${seconds}s ago which is ${condition ? 'valid' : 'too old'}.");

              if (condition) return GeoLocation.fromPosition(lastKnown);
            }
          }

          final p = await Geolocator.getCurrentPosition(
            desiredAccuracy: accuracy,
            timeLimit: timeout,
          );

          return GeoLocation.fromPosition(p);
        } else {
          log.e('Failed to obtain permisisons for location: $permission');
          throw PermissionDeniedException(permission.toString());
        }
      } on MissingPluginException {
        log.log(
            'Location is not supported on this device, returned a spoofed location');
        if (Env.isDebugMode) {
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

extension LocationPermissionX on LocationPermission {
  bool get isAccepted {
    switch (this) {
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
      case LocationPermission.unableToDetermine:
        return false;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
        return true;
    }
  }

  bool get isDenied => !isAccepted;
}

extension PositionX on Position {
  GeoLocation toGeoLocation() => GeoLocation.fromPosition(this);
}
