import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:utils/dialogs/confirmation_alert.dart';

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
    final LocationPermission permission = await checkPermission();
    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      try {
        final p = await getCurrentPosition(
          desiredAccuracy: desiredAccuracy,
          forceAndroidLocationManager: forceAndroidLocationManager,
          timeLimit: timeLimit,
        );
        return p;
      } on Exception catch (e, s) {
        await FirebaseCrashlytics.instance.recordError(e, s);
        return null;
      }
    } else if (context != null) {
      log(permission.toString());
      final b = await confirm(
        context,
        title: const Text("You need permissions !"),
        content: const Text("Location permissions are needed to get your position !"),
        cancel: const Text("Ok"),
        confirm: const Text("Open Settings"),
        defaultAction: DefaultAction.confirm,
        isCancelDestructive: true,
      );
      if (!b) return null;
      log("Opening settings ...");
      final opened = await openAppSettings();
      if (opened) log("Successfully opened settings");
    }
    return null;
  }
}
