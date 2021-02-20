import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/src/models/shadow_theme.dart';

part 'full_theme.freezed.dart';

@freezed
abstract class FullTheme with _$FullTheme {
  const factory FullTheme({
    required ColorScheme light,
    required ColorScheme dark,
    required String name,
    @Default(_identity) ApplyTo<ThemeData> applyToLight,
    @Default(_identity) ApplyTo<ThemeData> applyToDark,
    @Default('Description') String description,
    @Default(ShadowTheme()) ShadowTheme lightShadow,
    @Default(ShadowTheme()) ShadowTheme darkShadow,
  }) = _FullTheme;
}

ThemeData _identity(ThemeData t) => t;
