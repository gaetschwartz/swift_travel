// ignore_for_file: do_not_use_environment

import 'package:flutter/foundation.dart';

class Env {
  const Env._();

  static const isReleaseMode = bool.fromEnvironment('RELEASE_MODE');
  static const overridePlatform = bool.fromEnvironment('OVERRIDE_PLATFORM');
  static const page = String.fromEnvironment('PAGE');
  static const doShowErrors = bool.fromEnvironment('DO_SHOW_ERRORS');
  static const spoofLocation = bool.fromEnvironment('SPOOF_LOCATION');
  static const doCacheLines = !kDebugMode || bool.fromEnvironment('CACHE_LINES_IN_DEBUG');
  static const enableLiveRoute = bool.fromEnvironment('ENABLE_LIVE_ROUTE');
  static const enableAnimations = true;

  static bool boolean(String s) => bool.fromEnvironment(s);
  static String string(String s) => String.fromEnvironment(s);

  static Map<String, Object> get env => {
        'RELEASE_MODE': isReleaseMode,
        'OVERRIDE_PLATFORM': overridePlatform,
        'PAGE': page,
        'DO_SHOW_ERRORS': doShowErrors,
        'SPOOF_LOCATION': spoofLocation,
        'CACHE_LINES_IN_DEBUG': doCacheLines,
        'ENABLE_LIVE_ROUTE': enableLiveRoute,
      };
  static String get summary => env.toString();

  static bool get isLiveRouteEnabled => kDebugMode || enableLiveRoute;

  static bool get isDebugMode => kDebugMode && !Env.isReleaseMode;
}
