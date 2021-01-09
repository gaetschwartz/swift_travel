class Env {
  const Env._();
  static const overridePlatform = bool.fromEnvironment('OVERRIDE_PLATFORM');
  static const page = const String.fromEnvironment('PAGE');
  static const corruptedFavorites = bool.fromEnvironment('CORRUPT');
  static const doShowErrors = bool.fromEnvironment("DO_SHOW_ERRORS");
}
