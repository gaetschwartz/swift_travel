import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theming/src/models/font.dart';
import 'package:theming/src/models/full_theme.dart';

part 'theme_configuration.freezed.dart';

@freezed
class ThemeConfiguration with _$ThemeConfiguration {
  const factory ThemeConfiguration({
    required Map<String, FullTheme> themes,
    @Default('dyn_theme_') String prefix,
    @Default(ThemeMode.system) ThemeMode defaultThemeMode,
    @Default('default') String defaultTheme,
    @Default(true) bool persist,
    required List<Font> fonts,
    Font? defaultFont,
    @Default(Typography.englishLike2018) TextTheme defaultTextTheme,
    @Default(_i) ThemeData Function(ThemeData themeData) applyToAllThemes,
  }) = _ThemeConfiguration;

  const ThemeConfiguration._();

  int get computedDefaultFont {
    final i = fonts.indexWhere((f) => defaultFont == f);
    return i == -1 ? 0 : i;
  }
}

ThemeData _i(ThemeData t) => t;
