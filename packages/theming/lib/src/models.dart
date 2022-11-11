import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'dynamic_theme.dart';

part 'models.freezed.dart';

@freezed
class Font with _$Font {
  const factory Font(
    String name,
    TextTheme Function(TextTheme textTheme) textTheme,
  ) = _Font;

  static TextTheme _i(TextTheme textTheme) => textTheme;

  static const platform = Font('Platform', _i);
}

@freezed
class ExtendedTheme with _$ExtendedTheme {
  const factory ExtendedTheme({
    required ColorScheme colorScheme,
    required String name,
    required String id,
    @Default(_identity) ApplyTo<ThemeData> apply,
    @Default('Description') String description,
    @Default(ShadowTheme()) ShadowTheme shadow,
    @Default(false) bool hide,
  }) = _ExtendedTheme;

  const ExtendedTheme._();

  Brightness get brightness => colorScheme.brightness;
}

@freezed
class FullTheme with _$FullTheme {
  const factory FullTheme(
      {required ExtendedTheme light, required ExtendedTheme dark}) = _FullTheme;
}

ThemeData _identity(ThemeData t) => t;

@freezed
class ShadowTheme with _$ShadowTheme {
  const factory ShadowTheme({BoxShadow? buttonShadow}) = _ShadowTheme;
  const ShadowTheme._();

  List<BoxShadow> shadows(
    Iterable<BoxShadow?> Function(ShadowTheme s) shadows,
  ) =>
      shadows(this).whereNotNull().toList();

  static ShadowTheme of(BuildContext context, {bool listen = true}) {
    final data = DynamicTheme.of(context, listen: listen);
    final brightness = DynamicTheme.resolveBrightness(context, data.themeMode);
    switch (brightness) {
      case Brightness.dark:
        return data.shadowDark;
      case Brightness.light:
        return data.shadowLight;
    }
  }
}

@freezed
class ThemeConfiguration with _$ThemeConfiguration {
  const factory ThemeConfiguration({
    required List<ExtendedTheme> lightThemes,
    required List<ExtendedTheme> darkThemes,
    required List<Font> fonts,
    @Default('dyn_theme_') String prefix,
    @Default(ThemeMode.system) ThemeMode defaultThemeMode,
    @Default(false) bool persist,
    String? defaultLightThemeId,
    String? defaultDarkThemeId,
    Font? defaultFont,
    @Default(_identity)
        ThemeData Function(ThemeData themeData) applyToAllThemes,
  }) = _ThemeConfiguration;

  const ThemeConfiguration._();

  int get computedDefaultFont {
    final i = fonts.indexWhere((f) => defaultFont == f);
    return i == -1 ? 0 : i;
  }

  ExtendedTheme get defaultLight => getTheme(defaultLightThemeId, lightThemes);

  ExtendedTheme get defaultDark => getTheme(defaultDarkThemeId, darkThemes);

  ExtendedTheme getTheme(String? id, List<ExtendedTheme> themes) {
    if (id != null) {
      return themes.firstWhereOrNull((t) => t.id == id) ?? themes.first;
    }

    return themes.first;
  }

  ExtendedTheme getLightTheme(String? id) => getTheme(id, lightThemes);
  ExtendedTheme getDarkTheme(String? id) => getTheme(id, darkThemes);

  List<ExtendedTheme> theme(Brightness b) {
    switch (b) {
      case Brightness.dark:
        return darkThemes;
      case Brightness.light:
        return lightThemes;
    }
  }
}

enum ShadowType { button }
