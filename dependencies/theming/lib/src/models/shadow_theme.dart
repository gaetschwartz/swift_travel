import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theming/dynamic_theme.dart';

part 'shadow_theme.freezed.dart';

@freezed
class ShadowTheme with _$ShadowTheme {
  const factory ShadowTheme({BoxShadow? buttonShadow}) = _ShadowTheme;

  static ShadowTheme of(BuildContext context) => DynamicTheme.shadowOf(context);
}
