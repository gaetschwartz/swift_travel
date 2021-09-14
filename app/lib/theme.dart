import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theming/dynamic_theme.dart';

List<BoxShadow> shadowListOf(BuildContext context) =>
    ShadowTheme.of(context).shadows((s) => [s.buttonShadow]);

final MaterialColor purpleAbin = const Color(0xffcbaacb).toMaterialColor();
final MaterialColor blueAbin = const Color(0xffabdee6).toMaterialColor();
final MaterialColor redAccent = Colors.redAccent.toMaterialColor();
final MaterialColor white = Colors.white.toMaterialColor();

const lightShadow = ShadowTheme(
  buttonShadow:
      BoxShadow(blurRadius: 8, color: Color(0x200700b1), offset: Offset(0, 4)),
);

const darkShadow = ShadowTheme(
  buttonShadow:
      BoxShadow(blurRadius: 4, color: Color(0x4C000000), offset: Offset(0, 4)),
);

TextTheme _platform(TextTheme t) => t;

const List<Font> fonts = [
  Font("Platform", _platform),
  Font('Montserrat', GoogleFonts.montserratTextTheme),
  Font('Lexend', GoogleFonts.lexendDecaTextTheme),
  Font('Muli', GoogleFonts.mulishTextTheme),
  Font('Open Sans', GoogleFonts.openSansTextTheme),
  Font('QuickSand', GoogleFonts.quicksandTextTheme),
  Font('Raleway', GoogleFonts.ralewayTextTheme),
  Font('Lato', GoogleFonts.latoTextTheme),
  Font('Source Sans Pro', GoogleFonts.sourceSansProTextTheme),
  Font('Poppins', GoogleFonts.poppinsTextTheme),
  Font('Ubuntu', GoogleFonts.ubuntuTextTheme),
  Font("Inter", GoogleFonts.interTextTheme),
];

final ThemeConfiguration themeConfiguration = ThemeConfiguration(
  fonts: fonts,
  defaultFont: fonts.first,
  defaultLightThemeId: "swift",
  defaultDarkThemeId: "swift",
  persist: true,
  applyToAllThemes: (t) {
    return t.copyWith(
        cupertinoOverrideTheme:
            CupertinoThemeData(brightness: t.brightness).rawCopy(),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        }));
  },
  lightThemes: [
    ExtendedTheme(
      name: 'Swift',
      id: 'swift',
      colorScheme: const ColorScheme.light(),
      apply: (theme) => theme.copyWith(
        appBarTheme: AppBarTheme(
          color: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.onSurface,
          iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
          actionsIconTheme: IconThemeData(color: theme.colorScheme.onSurface),
          elevation: 0,
        ),
      ),
      shadow: lightShadow,
    ),
    ExtendedTheme(
      name: 'Abin',
      id: "abin",
      colorScheme: ColorScheme.fromSwatch(primarySwatch: purpleAbin),
      shadow: lightShadow,
    ),
  ],
  darkThemes: [
    ExtendedTheme(
      apply: (theme) => theme.copyWith(
        appBarTheme: AppBarTheme(
          color: theme.colorScheme.surface,
          foregroundColor: theme.colorScheme.onSurface,
          iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
          actionsIconTheme: IconThemeData(color: theme.colorScheme.onSurface),
          elevation: 0,
        ),
      ),
      colorScheme: const ColorScheme.dark(),
      shadow: darkShadow,
      id: 'swift',
      name: 'Swift',
    ),
    ExtendedTheme(
      name: 'Abin',
      id: 'abin',
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: purpleAbin, brightness: Brightness.dark),
      shadow: darkShadow,
    ),
  ],
);

extension ColorX on Color {
  /// Utility method to create a material color from any given
  /// color.
  MaterialColor toMaterialColor() {
    if (this is MaterialColor) return this as MaterialColor;

    final strengths = <double>[.05];
    final swatch = <int, Color>{};

    for (var i = 1; i < 10; i++) {
      strengths.add(i * 0.1);
    }

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromARGB(
        0xff,
        red + ((ds < 0 ? red : (255 - red)) * ds).round(),
        green + ((ds < 0 ? green : (255 - green)) * ds).round(),
        blue + ((ds < 0 ? blue : (255 - blue)) * ds).round(),
      );
    }

    return MaterialColor(value, swatch);
  }
}

extension CupertinoThemeDataX on CupertinoThemeData {
  CupertinoThemeData rawCopy() => CupertinoThemeData.raw(
        brightness,
        primaryColor,
        primaryContrastingColor,
        textTheme,
        barBackgroundColor,
        scaffoldBackgroundColor,
      );
}
