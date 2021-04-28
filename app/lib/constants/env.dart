// ignore_for_file: do_not_use_environment
import 'dart:io';

import 'package:flutter/foundation.dart';

class Env {
  const Env._();

  static const isReleaseMode = bool.fromEnvironment('RELEASE_MODE');
  static const overridePlatform = bool.fromEnvironment('OVERRIDE_PLATFORM');
  static const page = String.fromEnvironment('PAGE');
  static const doShowErrors = bool.fromEnvironment('DO_SHOW_ERRORS');
  static const spoofLocation = bool.fromEnvironment('SPOOF_LOCATION');
  static const cacheLinesInDebug = !kDebugMode && bool.fromEnvironment('CACHE_LINES_IN_DEBUG');
  static const enableLiveRoute = bool.fromEnvironment('ENABLE_LIVE_ROUTE');

  static late final String summary = env.toString();

  static late final Map<String, Object> env = Platform.environment;

  static bool get isLiveRouteEnabled => kDebugMode || enableLiveRoute;

  static bool get isDebugMode => kDebugMode && !Env.isReleaseMode;
}
