import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:theming/dialogs/confirmation_alert.dart';

final locationProvider = Provider<LocationRepository>((ref) {
  return LocationRepository();
});

class LocationRepository {
  Future<Position> getLocation({
    BuildContext context,
    LocationAccuracy desiredAccuracy = LocationAccuracy.bestForNavigation,
    bool forceAndroidLocationManager = false,
    Duration timeLimit,
  }) async {
    LocationPermission permission;
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        try {
          final p = await Geolocator.getCurrentPosition(
            desiredAccuracy: desiredAccuracy,
            forceAndroidLocationManager: forceAndroidLocationManager,
            timeLimit: timeLimit,
          );
          return p;
        } on Exception catch (e, s) {
          reportDartError(e, s);
          return null;
        }
      } else {
        if (context != null) {
          log(permission.toString());
          final b = await confirm(
            context,
            title: const Text('You need permissions !'),
            content: const Text('Location permissions are needed to get your position !'),
            confirm: const Text('Open Settings'),
            defaultAction: DefaultAction.confirm,
            isCancelDestructive: true,
          );
          if (!b) return null;
          log('Opening settings ...');
          final opened = await Geolocator.openAppSettings();
          if (opened) log('Successfully opened settings');
        }
        throw Exception("Failed to locate, didn't have the required permissions : $permission");
      }
    } on MissingPluginException {
      return null;
    }
  }
}
