import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theming/dynamic_theme.dart';

List<BoxShadow> shadowListOf(BuildContext context) =>
    ShadowTheme.of(context).shadows((s) => [s.buttonShadow]);

final MaterialColor purpleAbin = createMaterialColor(const Color(0xffcbaacb));
final MaterialColor blueAbin = createMaterialColor(const Color(0xffabdee6));
final MaterialColor redAccent = createMaterialColor(Colors.redAccent);
final MaterialColor white = createMaterialColor(Colors.white);

const lightShadow = ShadowTheme(
  buttonShadow: BoxShadow(blurRadius: 8, color: Color(0x200700b1), offset: Offset(0, 4)),
);

const darkShadow = ShadowTheme(
  buttonShadow: BoxShadow(blurRadius: 4, color: Color(0x4C000000), offset: Offset(0, 4)),
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
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(),
      ),
      brightness: Brightness.light,
      shadow: lightShadow,
    ),
    ExtendedTheme(
      name: 'Abin',
      id: "abin",
      colorScheme: ColorScheme.light(primary: purpleAbin, secondary: blueAbin),
      brightness: Brightness.light,
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
      brightness: Brightness.dark,
      id: 'swift',
      name: 'Swift',
    ),
    ExtendedTheme(
      name: 'Abin',
      id: 'abin',
      colorScheme: ColorScheme.dark(primary: purpleAbin, secondary: blueAbin),
      shadow: darkShadow,
      brightness: Brightness.dark,
    ),
  ],
);

/// Utility method to create a material color from any given
/// color.
MaterialColor createMaterialColor(Color color) {
  final strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red;
  final g = color.green;
  final b = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(i * 0.1);
  }

  for (final strength in strengths) {
    final ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
