class Env {
  const Env._();
  static const overridePlatform = bool.fromEnvironment('OVERRIDE_PLATFORM');
  static const page = String.fromEnvironment('PAGE');
  static const corruptedFavorites = bool.fromEnvironment('CORRUPT_FAVORITES');
  static const doShowErrors = bool.fromEnvironment('DO_SHOW_ERRORS');
  static const spoofLocation = bool.fromEnvironment('SPOOF_LOCATION');

  static String get env => {
        'OVERRIDE_PLATFORM': overridePlatform,
        'PAGE': page,
        'CORRUPT_FAVORITES': corruptedFavorites,
        'DO_SHOW_ERRORS': doShowErrors,
        'SPOOF_LOCATION': spoofLocation,
      }.toString();
}
