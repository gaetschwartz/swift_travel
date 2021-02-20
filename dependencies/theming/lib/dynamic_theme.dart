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
    Key? key,
    required DynamicThemeData theme,
    required Widget child,
  }) : super(key: key, notifier: theme, child: child);

  static DynamicThemeData of(BuildContext context) {
    final dynamicTheme = context.dependOnInheritedWidgetOfExactType<DynamicTheme>()?.notifier;
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

  static ShadowTheme shadowOf(BuildContext context) {
    final dynamicTheme = of(context);
    final brightness = resolveBrightness(context, dynamicTheme.themeMode);
    switch (brightness) {
      case Brightness.dark:
        return dynamicTheme.shadowDark;
      case Brightness.light:
        return dynamicTheme.shadowLight;
    }
  }
}

/// Theme model that allows to easily change theme dynamically and save the settings to preferences.
///
class DynamicThemeData extends ChangeNotifier {
  static const ThemeConfiguration defaultConfig = ThemeConfiguration(
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

  DynamicThemeData([ThemeConfiguration configuration = DynamicThemeData.defaultConfig])
      : _config = configuration,
        _themeName = configuration.defaultTheme,
        _themeMode = configuration.defaultThemeMode,
        _font = configuration.computedDefaultFont,
        assert(configuration.themes.isNotEmpty),
        assert(configuration.persist != true,
            'Set a persistent configuration with `configure(config)`');

  late String _themeName;
  late ThemeMode _themeMode;
  late Font _font;
  int _fontWeightDelta = 0;
  TargetPlatform _platform = defaultTargetPlatform;

  SharedPreferences? _prefs;
  bool _isReadyToPersist = false;

  Future<void> configure(ThemeConfiguration newConfig, {bool doLog = false}) async {
    assert(newConfig.themes.isNotEmpty && newConfig.fonts.isNotEmpty);
    _config = newConfig;
    _themeName = newConfig.defaultTheme;
    _themeMode = newConfig.defaultThemeMode;
    _font = newConfig.computedDefaultFont;
    _config = newConfig;
    if (newConfig.persist) await reloadFromPreferences(doLog: doLog);
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

    final thememodeInt = _prefs!.getInt('${_config.prefix}thememode');
    final themeMode =
        ThemeMode.values[thememodeInt ?? defaultThemeModeOverride?.index ?? _themeMode.index];

    final themeName = _prefs!.getString('${_config.prefix}name');

    final fontName = _prefs!.getString('${_config.prefix}font');
    final __font =
        _config.fonts.firstWhere((f) => f.name == fontName, orElse: () => defaultFonts.first);

    final fontWeightD = _prefs!.getInt('${_config.prefix}fontWeightDelta') ?? 0;

    final plat = _prefs!.getInt('${_config.prefix}platform');

    final platform = plat != null && plat >= 0 && plat < TargetPlatform.values.length
        ? TargetPlatform.values[plat]
        : _platform;

    assert(themeName == null || _config.themes.containsKey(themeName),
        '`$themeName` is not a valid theme name. Themes are ${_config.themes}.');
    _themeName = _config.themes.containsKey(themeName)
        ? themeName!
        : (defaultThemeNameOverride ?? _config.defaultTheme);
    _themeMode = themeMode;
    _font = __font;
    _fontWeightDelta = fontWeightD;
    _platform = platform;
    _invalidateCache();

    if (doLog) {
      log(
          'Loaded theme from preferences :\n'
          'Got : {themMode: ${thememodeInt == null ? null : ThemeMode.values[thememodeInt]}, themeName: $themeName}\n'
          'Resolved : {themeMode: $_themeMode, themeName: $_themeName}',
          name: 'dynamic_theme');
    }

    _isReadyToPersist = true;
    notifyListeners();
  }

  bool get readyToPersist => _isReadyToPersist;

  Font get font => _font;

  String get fontName => _font.name;
  set fontName(String fontName) {
    ArgumentError.checkNotNull(fontName, 'font');
    assert(_config.fonts.any((f) => f.name == fontName),
        '$fontName is not in the font list provided in config: ${_config.fonts}');

    _font = _config.fonts.firstWhere((f) => f.name == fontName,
        orElse: () => throw StateError('Could not find "$font" in ${_config.fonts}'));
    _invalidateCache();
    notifyListeners();
    if (_config.persist) {
      _checkPrefsState();
      _prefs!.setString('${_config.prefix}font', fontName);
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
    assert(_config.themes.containsKey(_themeName));
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
  CupertinoThemeData toCupertino() {
    return CupertinoThemeData(brightness: brightness, primaryColor: accentColor);
  }
}

typedef ApplyTo<T> = T Function(T);

extension ApplyToX<T> on ApplyTo<T> {
  /// Compose two functions: (a*b)(x) = a(b(x)).
  ApplyTo<T> operator *(ApplyTo<T> fn) => (T val) => this(fn(val));
}
