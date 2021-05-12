library dynamic_theme;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theming/src/models/font.dart';
import 'package:theming/src/models/full_theme.dart';
import 'package:theming/src/models/shadow_theme.dart';
import 'package:theming/src/models/theme_configuration.dart';

export 'src/models/font.dart';
export 'src/models/full_theme.dart';
export 'src/models/shadow_theme.dart';
export 'src/models/theme_configuration.dart';

class DynamicTheme extends InheritedNotifier<DynamicThemeData> {
  const DynamicTheme({
    required DynamicThemeData theme,
    required Widget child,
    Key? key,
  }) : super(key: key, notifier: theme, child: child);

  static DynamicThemeData of(BuildContext context, {bool listen = true}) {
    DynamicThemeData? dynamicTheme;
    if (listen) {
      dynamicTheme = context.dependOnInheritedWidgetOfExactType<DynamicTheme>()?.notifier;
    } else {
      dynamicTheme = context.findAncestorWidgetOfExactType<DynamicTheme>()?.notifier;
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
    late final ColorScheme colorScheme;
    switch (brightness) {
      case Brightness.dark:
        colorScheme = fullTheme.dark;
        break;
      case Brightness.light:
        colorScheme = fullTheme.light;
        break;
    }
    return ThemeData.from(colorScheme: colorScheme, textTheme: textTheme);
  }
}

/// Theme model that allows to easily change theme dynamically and save the settings to preferences.
///
class DynamicThemeData extends ChangeNotifier {
  DynamicThemeData([ThemeConfiguration configuration = DynamicThemeData.defaultConfig])
      : _config = configuration,
        _themeName = configuration.defaultTheme,
        _themeMode = configuration.defaultThemeMode,
        _fontIndex = 0, // configuration.computedDefaultFont,
        assert(configuration.themes.isNotEmpty, "Configuration's themes can't be empty"),
        assert(configuration.persist != true,
            'Set a persistent configuration with `configure(config)`');

  static TextTheme _identity(TextTheme t) => t;
  static const _default = Font('Default', _identity);
  static const List<Font> defaultFonts = [_default];

  static const ThemeConfiguration defaultConfig = ThemeConfiguration(
    fonts: defaultFonts,
    themes: {
      'default': FullTheme(
        light: ColorScheme.light(),
        dark: ColorScheme.dark(),
        name: 'Default',
      )
    },
    defaultTheme: 'default',
    persist: false,
  );

  ThemeConfiguration _config;

  late String _themeName;
  late ThemeMode _themeMode;
  late int _fontIndex;
  int _fontWeightDelta = 0;
  TargetPlatform _platform = defaultTargetPlatform;

  SharedPreferences? _prefs;
  bool _isReadyToPersist = false;

  Future<void> configure(ThemeConfiguration newConfig, {bool doLog = false}) async {
    assert(newConfig.themes.isNotEmpty && newConfig.fonts.isNotEmpty,
        "Fonts and themes can't be empty");
    _config = newConfig;
    _themeName = newConfig.defaultTheme;
    _themeMode = newConfig.defaultThemeMode;
    _fontIndex = 0; // newConfig.computedDefaultFont;
    _config = newConfig;
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
    String? defaultThemeNameOverride,
    bool doLog = false,
  }) async {
    if (!_config.persist) {
      throw StateError("Persist is set to false so you shouldn't call this method !");
    }
    _prefs = await SharedPreferences.getInstance();

    final __thememodeInt = _prefs!.getInt('${_config.prefix}thememode');
    final __themeMode =
        ThemeMode.values[__thememodeInt ?? defaultThemeModeOverride?.index ?? _themeMode.index];

    final __themeName = _prefs!.getString('${_config.prefix}name');

    final __fontIndex = _prefs!.getInt('${_config.prefix}fontIndex') ?? _config.computedDefaultFont;

    final __fontWeightD = _prefs!.getInt('${_config.prefix}fontWeightDelta') ?? 0;

    final __plat = _prefs!.getInt('${_config.prefix}platform');

    final __platform = __plat != null && __plat >= 0 && __plat < TargetPlatform.values.length
        ? TargetPlatform.values[__plat]
        : _platform;

    assert(__themeName == null || _config.themes.containsKey(__themeName),
        '`$__themeName` is not a valid theme name. Themes are ${_config.themes}.');
    _themeName = _config.themes.containsKey(__themeName)
        ? __themeName!
        : (defaultThemeNameOverride ?? _config.defaultTheme);
    _themeMode = __themeMode;
    _fontIndex = _config.fonts.clamp(__fontIndex);
    _fontWeightDelta = __fontWeightD;
    _platform = __platform;
    _invalidateCache();

    if (doLog) {
      log(
          'Loaded theme from preferences :\n'
          'Got : {themMode: ${__thememodeInt == null ? null : ThemeMode.values[__thememodeInt]}, themeName: $__themeName}\n'
          'Resolved : {themeMode: $_themeMode, themeName: $_themeName}',
          name: 'dynamic_theme');
    }

    _isReadyToPersist = true;
    notifyListeners();
  }

  bool get readyToPersist => _isReadyToPersist;

  Font get font => _config.fonts.safeGet(_fontIndex);

  int get fontIndex => _fontIndex;

  set fontIndex(int i) {
    ArgumentError.checkNotNull(i, 'fontIndex');
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
      throw StateError('You need to use configure() first to initiate preferences');
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

  String get name => _themeName;

  set name(String themeName) {
    ArgumentError.checkNotNull(themeName, 'themeName');

    if (!_config.themes.containsKey(themeName)) {
      throw ArgumentError(
          'No theme named `$themeName` exist. All available themes are: ${_config.themes.keys.toList()}');
    }
    _themeName = themeName;
    _invalidateCache();
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      _prefs!.setString('${_config.prefix}name', themeName);
    }
  }

  TargetPlatform get platform => _platform;

  set platform(TargetPlatform platform) {
    ArgumentError.checkNotNull(platform, 'platform');

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
    assert(
        _config.themes.containsKey(_themeName),
        "The previously set theme name doesn't seem to a valid one. "
        '$_themeName is not in ${_config.themes.keys}');
    return _config.themes[_themeName]!;
  }

  TextTheme _applyFontWeightDelta(TextTheme theme) => theme.copyWith(
        headline1: theme.headline1?.apply(fontWeightDelta: _fontWeightDelta),
        headline2: theme.headline2?.apply(fontWeightDelta: _fontWeightDelta),
        headline3: theme.headline3?.apply(fontWeightDelta: _fontWeightDelta),
        headline4: theme.headline4?.apply(fontWeightDelta: _fontWeightDelta),
        headline5: theme.headline5?.apply(fontWeightDelta: _fontWeightDelta),
        headline6: theme.headline6?.apply(fontWeightDelta: _fontWeightDelta),
        subtitle1: theme.subtitle1?.apply(fontWeightDelta: _fontWeightDelta),
        subtitle2: theme.subtitle2?.apply(fontWeightDelta: _fontWeightDelta),
        bodyText1: theme.bodyText1?.apply(fontWeightDelta: _fontWeightDelta),
        bodyText2: theme.bodyText2?.apply(fontWeightDelta: _fontWeightDelta),
        caption: theme.caption?.apply(fontWeightDelta: _fontWeightDelta),
        button: theme.button?.apply(fontWeightDelta: _fontWeightDelta),
        overline: theme.overline?.apply(fontWeightDelta: _fontWeightDelta),
      );

  ThemeData get light => _cachedLightTheme ?? (_cachedLightTheme = _computeLightTheme());

  ThemeData get dark => _cachedDarkTheme ?? (_cachedDarkTheme = _computeDarkTheme());

  ThemeData _computeLightTheme() {
    final data = ThemeData.from(
      colorScheme: theme.light,
      textTheme: _applyFontWeightDelta(font.textTheme(_config.defaultTextTheme)),
    ).copyWith(platform: _platform);

    return (_config.applyToAllThemes * theme.applyToLight)(data);
  }

  ThemeData _computeDarkTheme() {
    final data = ThemeData.from(
      colorScheme: theme.dark,
      textTheme: _applyFontWeightDelta(font.textTheme(_config.defaultTextTheme)),
    ).copyWith(platform: _platform);

    return (_config.applyToAllThemes * theme.applyToDark)(data);
  }

  ShadowTheme get shadowLight => theme.lightShadow;
  ShadowTheme get shadowDark => theme.darkShadow;

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
  CupertinoThemeData toCupertino() =>
      CupertinoThemeData(brightness: brightness, primaryColor: colorScheme.secondary);
}

typedef ApplyTo<T> = T Function(T);

extension ApplyToX<T> on ApplyTo<T> {
  /// Compose two functions: (a*b)(x) = a(b(x)).
  ApplyTo<T> operator *(ApplyTo<T> fn) => (val) => this(fn(val));
}

extension ListX<T> on List<T> {
  T safeGet(int i) => this[clamp(i)];

  int clamp(int i) => i.clamp(0, length - 1);
}
