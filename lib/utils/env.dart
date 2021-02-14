import 'dart:io';

import 'package:flutter/foundation.dart';

mixin Env {
  static const isReleaseMode = bool.fromEnvironment('RELEASE_MODE');
  static const overridePlatform = bool.fromEnvironment('OVERRIDE_PLATFORM');
  static const page = String.fromEnvironment('PAGE');
  static const doShowErrors = bool.fromEnvironment('DO_SHOW_ERRORS', defaultValue: true);
  static const spoofLocation = bool.fromEnvironment('SPOOF_LOCATION');

  static String get summary => Platform.environment.toString();

  static Map<String, Object> get map {
    return {
      'RELEASE_MODE': isReleaseMode,
      'OVERRIDE_PLATFORM': overridePlatform,
      'PAGE': page,
      'DO_SHOW_ERRORS': doShowErrors,
      'SPOOF_LOCATION': spoofLocation,
    };
  }
}

const isDebugMode = kDebugMode && !Env.isReleaseMode;
