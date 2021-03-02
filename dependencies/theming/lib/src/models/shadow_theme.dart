import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theming/dynamic_theme.dart';

export 'package:collection/collection.dart';

part 'shadow_theme.freezed.dart';

@freezed
class ShadowTheme with _$ShadowTheme {
  const factory ShadowTheme({BoxShadow? buttonShadow}) = _ShadowTheme;
  const ShadowTheme._();

  List<BoxShadow> list(Iterable<BoxShadow?> Function(ShadowTheme s) shadows) =>
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

enum ShadowType {
  button,
}
