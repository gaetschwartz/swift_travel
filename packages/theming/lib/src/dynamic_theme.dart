import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';

class DynamicTheme extends InheritedNotifier<DynamicThemeData> {
  const DynamicTheme({
    required DynamicThemeData theme,
    required Widget child,
    Key? key,
  }) : super(key: key, notifier: theme, child: child);

  static DynamicThemeData of(BuildContext context, {bool listen = true}) {
    final DynamicThemeData? dynamicTheme;
    if (listen) {
      dynamicTheme =
          context.dependOnInheritedWidgetOfExactType<DynamicTheme>()?.notifier;
    } else {
      dynamicTheme =
          context.findAncestorWidgetOfExactType<DynamicTheme>()?.notifier;
    }
    if (dynamicTheme == null) {
      throw FlutterError("Couldn't find any `DynamicTheme` parents.");
    }
    return dynamicTheme;
  }

  static Brightness resolveBrightness(
    BuildContext context,
    ThemeMode themeMode,
  ) {
    switch (themeMode) {
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.system:
        return MediaQuery.platformBrightnessOf(context);
    }
  }

  static ThemeData resolve(
    BuildContext context,
    ThemeMode themeMode,
    FullTheme fullTheme, {
    TextTheme? textTheme,
  }) {
    final brightness = resolveBrightness(context, themeMode);
    final ColorScheme colorScheme;
    switch (brightness) {
      case Brightness.dark:
        colorScheme = fullTheme.dark.colorScheme;
        break;
      case Brightness.light:
        colorScheme = fullTheme.light.colorScheme;
        break;
    }
    return ThemeData.from(colorScheme: colorScheme, textTheme: textTheme);
  }
}

/// Theme model that allows to easily change theme dynamically and save the settings to preferences.
///
class DynamicThemeData extends ChangeNotifier {
  static TextTheme _identity(TextTheme t) => t;
  static const _default = Font('Default', _identity);
  static const List<Font> defaultFonts = [_default];

  static const defaultConfig = ThemeConfiguration(
    fonts: defaultFonts,
    lightThemes: [
      ExtendedTheme(
        colorScheme: ColorScheme.light(),
        name: 'Default',
        id: "default",
      ),
    ],
    darkThemes: [
      ExtendedTheme(
        colorScheme: ColorScheme.dark(),
        name: 'Default',
        id: "default",
      ),
    ],
    persist: false,
  );

  DynamicThemeData(ThemeConfiguration configuration)
      : _config = configuration,
        _themeMode = configuration.defaultThemeMode,
        _fontIndex = 0,
        _lightTheme = configuration.defaultLight,
        _darkTheme = configuration.defaultDark,
        assert(
          configuration.lightThemes.isNotEmpty &&
              configuration.darkThemes.isNotEmpty,
          "Configuration's themes can't be empty",
        ),
        assert(
          configuration.persist != true,
          'Set a persistent configuration with `configure(config)`',
        );

  ThemeConfiguration _config;

  ExtendedTheme _lightTheme;
  ExtendedTheme _darkTheme;

  late ThemeMode _themeMode;
  late int _fontIndex;

  int _fontWeightDelta = 0;
  TargetPlatform _platform = defaultTargetPlatform;
  bool _isReadyToPersist = false;

  SharedPreferences? _prefs;

  Future<void> configure(
    ThemeConfiguration newConfig, {
    bool doLog = false,
  }) async {
    assert(
      newConfig.lightThemes.isNotEmpty &&
          newConfig.darkThemes.isNotEmpty &&
          newConfig.fonts.isNotEmpty,
      "Fonts and themes can't be empty",
    );
    _config = newConfig;
    _themeMode = newConfig.defaultThemeMode;
    _fontIndex = 0; // newConfig.computedDefaultFont;
    if (newConfig.persist) {
      await reloadFromPreferences(doLog: doLog);
    } else {
      notifyListeners();
    }
  }

  ThemeConfiguration get configuration => _config;

  /// Loads theme settings from `SharedPreferences`. If not run, the class won't presist the themes.
  Future<void> reloadFromPreferences({
    ThemeMode? defaultThemeModeOverride,
    bool doLog = false,
  }) async {
    if (!_config.persist) {
      throw StateError(
          "Persist is set to false so you shouldn't call this method !");
    }
    _prefs = await SharedPreferences.getInstance();

    final thememodeInt = _prefs!.getInt('${_config.prefix}thememode');
    final themeMode = ThemeMode.values[
        thememodeInt ?? defaultThemeModeOverride?.index ?? _themeMode.index];

    final lightThemeId = _prefs!.getString('${_config.prefix}$_lightIdKey') ??
        _config.defaultLightThemeId;
    final darkThemeId = _prefs!.getString('${_config.prefix}$_darkIdKey') ??
        _config.defaultDarkThemeId;

    final fontIndex = _prefs!.getInt('${_config.prefix}fontIndex') ??
        _config.computedDefaultFont;

    final fontWeightDelta =
        _prefs!.getInt('${_config.prefix}fontWeightDelta') ?? 0;

    final platformInt = _prefs!.getInt('${_config.prefix}platform');

    final platform = platformInt != null &&
            platformInt >= 0 &&
            platformInt < TargetPlatform.values.length
        ? TargetPlatform.values[platformInt]
        : _platform;

    _lightTheme = _config.getLightTheme(lightThemeId);
    _darkTheme = _config.getDarkTheme(darkThemeId);

    _themeMode = themeMode;
    _fontIndex = _config.fonts.clamp(fontIndex);
    _fontWeightDelta = fontWeightDelta;
    _platform = platform;
    _invalidateCache();

    if (doLog) {
      print(
        '[dyn_theme] Loaded theme from preferences :\n'
        'Got : {themMode: ${thememodeInt == null ? null : ThemeMode.values[thememodeInt]}, themeName: $lightThemeId}\n'
        'Resolved : {themeMode: $_themeMode, lightThemeId: $lightThemeId, darkThemeId: $darkThemeId}',
      );
    }

    _isReadyToPersist = true;
    notifyListeners();
  }

  bool get readyToPersist => _isReadyToPersist;

  Font get font => _config.fonts.safeGet(_fontIndex);

  set font(Font font) {
    final i = _config.fonts.indexWhere((f) => f.name == font.name);
    fontIndex = i;
  }

  int get fontIndex => _fontIndex;

  set fontIndex(int i) {
    assert(i >= 0 && i < _config.fonts.length,
        '$fontIndex must be is not in range 0 (inclusive) to ${_config.fonts.length} (exclusive)');

    _fontIndex = i;
    _invalidateCache();
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      _prefs!.setInt('${_config.prefix}fontIndex', i);
    }
  }

  int get fontWeightDelta => _fontWeightDelta;

  set fontWeightDelta(int fontWeightDelta) {
    ArgumentError.checkNotNull(fontWeightDelta, 'fontWeightDelta');
    _fontWeightDelta = fontWeightDelta;
    _invalidateCache();
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      _prefs!.setInt('${_config.prefix}fontWeightDelta', fontWeightDelta);
    }
  }

  void _checkPrefsState() {
    if (!_isReadyToPersist || _prefs == null) {
      throw StateError(
          'You need to use configure() first to initiate preferences');
    }
  }

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    ArgumentError.checkNotNull(themeMode, 'themeMode');
    _themeMode = themeMode;
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      _prefs!.setInt('${_config.prefix}thememode', themeMode.index);
    }
  }

  static const _lightIdKey = "light_theme";
  static const _darkIdKey = "dark_theme";

  void setLightTheme(String id) => _setId(
        id,
        _config.lightThemes,
        _lightIdKey,
        (t) => _lightTheme = t,
      );
  void setDarkTheme(String id) => _setId(
        id,
        _config.darkThemes,
        _darkIdKey,
        (t) => _darkTheme = t,
      );

  void _setId(
    String id,
    List<ExtendedTheme> themes,
    String key,
    void Function(ExtendedTheme) setId,
  ) {
    final theme = themes.firstWhereOrNull((element) => element.id == id);
    if (theme == null) {
      throw ArgumentError(
        'No theme named `$id` exist. All available themes are: ${themes.map((e) => e.id).toList()}',
      );
    }
    setId(theme);
    _invalidateCache();
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      _prefs!.setString('${_config.prefix}$key', id);
    }
  }

  TargetPlatform get platform => _platform;

  set platform(TargetPlatform platform) {
    _platform = platform;
    _invalidateCache();
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      _prefs!.setInt('${_config.prefix}platform', platform.index);
    }
  }

  ThemeData? _cachedLightTheme;
  ThemeData? _cachedDarkTheme;

  void _invalidateCache() {
    _cachedDarkTheme = null;
    _cachedLightTheme = null;
  }

  FullTheme get theme {
    return FullTheme(light: _lightTheme, dark: _darkTheme);
  }

  ThemeData get light =>
      _cachedLightTheme ?? (_cachedLightTheme = _computeLightTheme());

  ThemeData get dark =>
      _cachedDarkTheme ?? (_cachedDarkTheme = _computeDarkTheme());

  ThemeData _computeLightTheme() {
    final data = _themeDataFrom(
      colorScheme: _lightTheme.colorScheme,
      textTheme: font
          .textTheme(_config.defaultTextTheme)
          .applyFontWeightDelta(fontWeightDelta),
      platform: _platform,
    );

    return _config.applyToAllThemes(_lightTheme.apply(data));
  }

  ThemeData _computeDarkTheme() {
    final data = _themeDataFrom(
      colorScheme: _darkTheme.colorScheme,
      textTheme: font
          .textTheme(_config.defaultTextTheme)
          .applyFontWeightDelta(fontWeightDelta),
      platform: _platform,
    );

    return _config.applyToAllThemes(_darkTheme.apply(data));
  }

  ShadowTheme get shadowLight => _lightTheme.shadow;
  ShadowTheme get shadowDark => _darkTheme.shadow;

  ThemeData ofBrightness(BuildContext context) {
    final brightness = DynamicTheme.resolveBrightness(context, themeMode);
    switch (brightness) {
      case Brightness.dark:
        return dark;
      case Brightness.light:
        return light;
    }
  }
}

extension ThemeDataX on ThemeData {
  CupertinoThemeData toCupertino() => CupertinoThemeData(
      brightness: brightness, primaryColor: colorScheme.secondary);
}

extension TextThemeX on TextTheme {
  TextTheme applyFontWeightDelta(int fontWeightDelta) => copyWith(
        displayLarge: displayLarge?.apply(fontWeightDelta: fontWeightDelta),
        displayMedium: displayMedium?.apply(fontWeightDelta: fontWeightDelta),
        displaySmall: displaySmall?.apply(fontWeightDelta: fontWeightDelta),
        headlineMedium: headlineMedium?.apply(fontWeightDelta: fontWeightDelta),
        headlineSmall: headlineSmall?.apply(fontWeightDelta: fontWeightDelta),
        titleLarge: titleLarge?.apply(fontWeightDelta: fontWeightDelta),
        titleMedium: titleMedium?.apply(fontWeightDelta: fontWeightDelta),
        titleSmall: titleSmall?.apply(fontWeightDelta: fontWeightDelta),
        bodyLarge: bodyLarge?.apply(fontWeightDelta: fontWeightDelta),
        bodyMedium: bodyMedium?.apply(fontWeightDelta: fontWeightDelta),
        bodySmall: bodySmall?.apply(fontWeightDelta: fontWeightDelta),
        labelLarge: labelLarge?.apply(fontWeightDelta: fontWeightDelta),
        labelSmall: labelSmall?.apply(fontWeightDelta: fontWeightDelta),
      );
}

typedef ApplyTo<T> = T Function(T);

extension ApplyToX<T> on ApplyTo<T> {
  /// Compose two functions: (a*b)(x) = a(b(x)).
  ApplyTo<T> operator &(ApplyTo<T> fn) => (val) => this(fn(val));
}

extension ListX<T> on List<T> {
  T safeGet(int i) => this[clamp(i)];

  int clamp(int i) => i.clamp(0, length - 1);
}

ThemeData _themeDataFrom({
  required ColorScheme colorScheme,
  TextTheme? textTheme,
  TargetPlatform? platform,
}) {
  final bool isDark = colorScheme.brightness == Brightness.dark;

  // For surfaces that use primary color in light themes and surface color in dark
  final Color primarySurfaceColor =
      isDark ? colorScheme.surface : colorScheme.primary;
  final Color onPrimarySurfaceColor =
      isDark ? colorScheme.onSurface : colorScheme.onPrimary;

  return ThemeData(
    platform: platform,
    brightness: colorScheme.brightness,
    primaryColor: primarySurfaceColor,
    canvasColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    cardColor: colorScheme.surface,
    dividerColor: colorScheme.onSurface.withOpacity(0.12),
    dialogBackgroundColor: colorScheme.background,
    textTheme: textTheme,
    indicatorColor: onPrimarySurfaceColor,
    applyElevationOverlayColor: isDark,
    colorScheme: colorScheme,
    bottomAppBarTheme: BottomAppBarTheme(color: colorScheme.surface),
  );
}
