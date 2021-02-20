import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theming/src/models/font.dart';
import 'package:theming/src/models/full_theme.dart';

part 'theme_configuration.freezed.dart';

@freezed
abstract class ThemeConfiguration implements _$ThemeConfiguration {
  const factory ThemeConfiguration({
    required Map<String, FullTheme> themes,
    @Default('dyn_theme_') String prefix,
    @Default(ThemeMode.system) ThemeMode defaultThemeMode,
    @Default('default') String defaultTheme,
    @Default(true) bool persist,
    @Default(defaultFonts) List<Font> fonts,
    Font? defaultFont,
    @Default(Typography.englishLike2018) TextTheme defaultTextTheme,
    @Default(_i) ThemeData Function(ThemeData themeData) applyToAllThemes,
  }) = _ThemeConfiguration;

  const ThemeConfiguration._();

  Font get computedDefaultFont =>
      defaultFont != null && fonts.contains(defaultFont) ? defaultFont! : defaultFonts.first;
}

ThemeData _i(ThemeData t) => t;

const _default = Font('Default', _identity);

const List<Font> defaultFonts = [_default];

TextTheme _identity(TextTheme t) => t;
