// ignore_for_file: do_not_use_environment
import 'package:flutter/foundation.dart';

mixin Env {
  static const isReleaseMode = bool.fromEnvironment('RELEASE_MODE');
  static const overridePlatform = bool.fromEnvironment('OVERRIDE_PLATFORM');
  static const page = String.fromEnvironment('PAGE');
  static const doShowErrors = bool.fromEnvironment('DO_SHOW_ERRORS');
  static const spoofLocation = bool.fromEnvironment('SPOOF_LOCATION');
  static late final doCacheInDebug = const String.fromEnvironment('CACHE_DEBUG').split('|');
  static const enableLiveRoute = bool.fromEnvironment('ENABLE_LIVE_ROUTE');

  static late final String summary = map.toString();

  static late final Map<String, Object> map = {
    'RELEASE_MODE': isReleaseMode,
    'OVERRIDE_PLATFORM': overridePlatform,
    'PAGE': page,
    'DO_SHOW_ERRORS': doShowErrors,
    'SPOOF_LOCATION': spoofLocation,
    'CACHE_DEBUG': doCacheInDebug,
  };

  static bool get isLiveRouteEnabled => kDebugMode || enableLiveRoute;
}
const isDebugMode = kDebugMode && !Env.isReleaseMode;
