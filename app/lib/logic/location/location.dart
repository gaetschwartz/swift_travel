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
    }
    try {
      return await _getLocation(accuracy: accuracy, timeout: timeout);
    } on MissingPluginException {
      if (Env.isDebugMode) {
        log.log(
            'Location is not supported on this device, returned a spoofed location instead.');
        return Future<GeoLocation>.delayed(
          const Duration(milliseconds: 500),
          () => _spoofedLocation,
        );
      } else {
        rethrow;
      }
    }
  }

  Future<GeoLocation> _getLocation({
    required LocationAccuracy accuracy,
    required Duration? timeout,
  }) async {
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      log.i('Requesting permission because it was denied.');
      permission = await Geolocator.requestPermission();
    }

    if (!permission.isAccepted) {
      log.e('Failed to obtain permisisons for location: $permission');
      throw PermissionDeniedException('Permission denied: $permission');
    }

    final lastKnown = await Geolocator.getLastKnownPosition();

    if (lastKnown != null) {
      final timestamp = lastKnown.timestamp;
      final now = DateTime.now();
      final seconds = now.difference(timestamp).inSeconds;
      final condition = seconds < 60;
      log.log(
        "Obtained last known position which was ${seconds}s ago which is ${condition ? 'valid' : 'too old'}.",
      );

      if (condition) {
        return GeoLocation.fromPosition(lastKnown);
      }
    }

    final p = await Geolocator.getCurrentPosition(
      desiredAccuracy: accuracy,
      timeLimit: timeout,
    );

    return GeoLocation.fromPosition(p);
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
