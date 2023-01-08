import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'empty_box.dart';
import 'models.dart';

class DynamicTheme extends InheritedNotifier<DynamicThemeNotifier> {
  const DynamicTheme({
    required DynamicThemeNotifier theme,
    required super.child,
    super.key,
  }) : super(notifier: theme);

  static DynamicThemeNotifier of(BuildContext context, {bool listen = true}) {
    final DynamicThemeNotifier? dynamicTheme;
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
class DynamicThemeNotifier extends ChangeNotifier {
  static TextTheme _identity(TextTheme t) => t;
  static const _default = Font('Default', _identity);
  static const List<Font> defaultFonts = [_default];

  static const defaultConfig = ThemeConfiguration(
    fonts: defaultFonts,
    lightThemes: [
      ExtendedTheme(
        colorScheme: ColorScheme.light(),
        name: 'Default',
        id: 'default',
      ),
    ],
    darkThemes: [
      ExtendedTheme(
        colorScheme: ColorScheme.dark(),
        name: 'Default',
        id: 'default',
      ),
    ],
    persist: false,
  );

  DynamicThemeNotifier(ThemeConfiguration configuration)
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

  factory DynamicThemeNotifier.withDefaultConfig() =>
      DynamicThemeNotifier(defaultConfig);

  ThemeConfiguration _config;

  ExtendedTheme _lightTheme;
  ExtendedTheme _darkTheme;

  ExtendedTheme get lightTheme => _lightTheme;
  ExtendedTheme get darkTheme => _darkTheme;

  late ThemeMode _themeMode;
  late int _fontIndex;

  int _fontWeightDelta = 0;
  TargetPlatform _platform = defaultTargetPlatform;
  bool _isReadyToPersist = false;

  Box<Object?> _box = EmptyBox();

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
      await loadFromLocal(doLog: doLog);
    } else {
      notifyListeners();
    }
  }

  ThemeConfiguration get configuration => _config;

  /// Loads theme settings from `SharedPreferences`. If not run, the class won't presist the themes.
  Future<void> loadFromLocal({
    ThemeMode? defaultThemeModeOverride,
    bool doLog = false,
  }) async {
    assert(_config.persist,
        "Persist is set to false so you shouldn't call this method !");

    if (_box is EmptyBox) {
      if (kDebugMode) print('Opening box');
      _box = await openBox();
    }

    final thememodeInt = _box.getTyped<int>('thememode');
    final themeMode = ThemeMode.values[
        thememodeInt ?? defaultThemeModeOverride?.index ?? _themeMode.index];

    final lightThemeId =
        _box.getTyped<String>(_lightIdKey) ?? _config.defaultLightThemeId;
    final darkThemeId =
        _box.getTyped<String>(_darkIdKey) ?? _config.defaultDarkThemeId;

    final fontIndex =
        _box.getTyped<int>('fontIndex') ?? _config.computedDefaultFont;

    final fontWeightDelta = _box.getTyped<int>('fontWeightDelta') ?? 0;

    final platformInt = _box.getTyped<int>('platform');

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

    if (kDebugMode) {
      if (doLog) {
        print(
          '[dyn_theme] Loaded theme from preferences :\n'
          'Got : {themMode: ${thememodeInt == null ? null : ThemeMode.values[thememodeInt]}, themeName: $lightThemeId}\n'
          'Resolved : {themeMode: $_themeMode, lightThemeId: $lightThemeId, darkThemeId: $darkThemeId}',
        );
      }
    }

    _isReadyToPersist = true;
    notifyListeners();
  }

  @visibleForTesting
  static Future<Box<Object?>> openBox() => Hive.openBox('dynamic_theme');

  bool get readyToPersist => _isReadyToPersist;

  Font get font => _config.fonts.safeGet(_fontIndex);

  Future<void> setFont(Font font) async {
    final i = _config.fonts.indexWhere((f) => f.name == font.name);
    await setFontIndex(i);
  }

  int get fontIndex => _fontIndex;

  Future<void> setFontIndex(int i) async {
    assert(i >= 0 && i < _config.fonts.length,
        '$fontIndex must be is not in range 0 (inclusive) to ${_config.fonts.length} (exclusive)');

    _fontIndex = i;
    _invalidateCache();
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      await _box.put('fontIndex', i);
    }
  }

  int get fontWeightDelta => _fontWeightDelta;

  Future<void> setTontWeightDelta(int fontWeightDelta) async {
    ArgumentError.checkNotNull(fontWeightDelta, 'fontWeightDelta');
    _fontWeightDelta = fontWeightDelta;
    _invalidateCache();
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      await _box.put('fontWeightDelta', fontWeightDelta);
    }
  }

  ThemeMode get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode themeMode) async {
    ArgumentError.checkNotNull(themeMode, 'themeMode');
    _themeMode = themeMode;
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      await _box.put('thememode', themeMode.index);
    }
  }

  static const _lightIdKey = 'light_theme';
  static const _darkIdKey = 'dark_theme';

  Future<void> setLightTheme(String id) => _setId(
        id,
        _config.lightThemes,
        _lightIdKey,
        (t) => _lightTheme = t,
      );
  Future<void> setDarkTheme(String id) => _setId(
        id,
        _config.darkThemes,
        _darkIdKey,
        (t) => _darkTheme = t,
      );

  Future<void> _setId(
    String id,
    List<ExtendedTheme> themes,
    String key,
    void Function(ExtendedTheme) setId,
  ) async {
    final theme = themes.firstWhereOrNull((e) => e.id == id);
    if (theme == null) {
      throw ArgumentError.value(id, 'id', 'Theme with id $id not found');
    }
    setId(theme);
    _invalidateCache();
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      await _box.put(key, id);
    }
  }

  TargetPlatform get platform => _platform;

  Future<void> setPlatform(TargetPlatform platform) async {
    _platform = platform;
    _invalidateCache();
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      await _box.put('platform', platform.index);
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
          .textTheme(Typography.material2021(platform: platform).black)
          .applyFontWeightDelta(fontWeightDelta),
      platform: _platform,
    );

    return _config.applyToAllThemes(_lightTheme.apply(data));
  }

  ThemeData _computeDarkTheme() {
    final data = _themeDataFrom(
      colorScheme: _darkTheme.colorScheme,
      textTheme: font
          .textTheme(Typography.material2021(platform: platform).white)
          .applyFontWeightDelta(fontWeightDelta),
      platform: _platform,
    );

    return _config.applyToAllThemes(_darkTheme.apply(data));
  }

  ThemeData _themeDataFrom({
    required ColorScheme colorScheme,
    required TextTheme? textTheme,
    TargetPlatform? platform,
  }) {
    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
      useMaterial3: true,
    ).copyWith(
      platform: platform,
    );
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

  void _checkPrefsState() {
    assert(_isReadyToPersist, 'You must call loadFromPreferences() before');
  }

  Future<void> save() {
    _checkPrefsState();
    return _box.flush();
  }
}

extension TextThemeX on TextTheme {
  TextTheme applyFontWeightDelta(int fontWeightDelta) => copyWith(
        displayLarge: displayLarge?.apply(fontWeightDelta: fontWeightDelta),
        displayMedium: displayMedium?.apply(fontWeightDelta: fontWeightDelta),
        displaySmall: displaySmall?.apply(fontWeightDelta: fontWeightDelta),
        headlineLarge: headlineLarge?.apply(fontWeightDelta: fontWeightDelta),
        headlineMedium: headlineMedium?.apply(fontWeightDelta: fontWeightDelta),
        headlineSmall: headlineSmall?.apply(fontWeightDelta: fontWeightDelta),
        titleLarge: titleLarge?.apply(fontWeightDelta: fontWeightDelta),
        titleMedium: titleMedium?.apply(fontWeightDelta: fontWeightDelta),
        titleSmall: titleSmall?.apply(fontWeightDelta: fontWeightDelta),
        bodyLarge: bodyLarge?.apply(fontWeightDelta: fontWeightDelta),
        bodyMedium: bodyMedium?.apply(fontWeightDelta: fontWeightDelta),
        bodySmall: bodySmall?.apply(fontWeightDelta: fontWeightDelta),
        labelLarge: labelLarge?.apply(fontWeightDelta: fontWeightDelta),
        labelMedium: labelMedium?.apply(fontWeightDelta: fontWeightDelta),
        labelSmall: labelSmall?.apply(fontWeightDelta: fontWeightDelta),
      );
}

typedef ApplyTo<T> = T Function(T);

extension ApplyToX<T> on ApplyTo<T> {
  /// Compose two functions: (a*b)(x) = a(b(x)).
  ApplyTo<T> operator &(ApplyTo<T> fn) => (val) => this(fn(val));
}

extension ListX<T> on List<T> {
  T safeGet(int i) => this[i.clamp(0, length - 1)];

  int clamp(int i) => i.clamp(0, length - 1);
}

extension BoxX on Box<Object?> {
  T? getTyped<T>(String key) => get(key) as T?;
}
