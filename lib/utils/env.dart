import 'package:flutter/foundation.dart';

mixin Env {
  static const isReleaseMode = bool.fromEnvironment('RELEASE_MODE');
  static const overridePlatform = bool.fromEnvironment('OVERRIDE_PLATFORM');
  static const page = String.fromEnvironment('PAGE');
  static const doShowErrors = bool.fromEnvironment('DO_SHOW_ERRORS', defaultValue: true);
  static const spoofLocation = bool.fromEnvironment('SPOOF_LOCATION');
  static late final doCacheInDebug = const String.fromEnvironment('CACHE_DEBUG').split('|');

  static String get summary => map.toString();

  static Map<String, Object> get map {
    return {
      'RELEASE_MODE': isReleaseMode,
      'OVERRIDE_PLATFORM': overridePlatform,
      'PAGE': page,
      'DO_SHOW_ERRORS': doShowErrors,
      'SPOOF_LOCATION': spoofLocation,
      'CACHE_DEBUG': doCacheInDebug,
    };
  }
}

const isDebugMode = kDebugMode && !Env.isReleaseMode;
