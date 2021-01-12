import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theming/dynamic_theme.dart';

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

const List<Font> fonts = [
  Font("Muli", GoogleFonts.muliTextTheme),
  Font("Lexend", GoogleFonts.lexendDecaTextTheme),
  Font("Open Sans", GoogleFonts.openSansTextTheme),
  Font("IBM Plex Mono", GoogleFonts.ibmPlexMonoTextTheme),
  Font("Source Sans Pro", GoogleFonts.sourceSansProTextTheme),
  Font("Cardo", GoogleFonts.cardoTextTheme),
  Font("QuickSand", GoogleFonts.quicksandTextTheme),
];

ThemeConfiguration get themeConfiguration {
  const light = ColorScheme.light(
    onPrimary: Colors.black,
    primary: Colors.white,
    secondary: Colors.redAccent,
    onSecondary: Colors.white,
  );
  const dark = ColorScheme.dark(
    secondary: Colors.red,
    onSecondary: Colors.white,
  );
  return ThemeConfiguration(
    themes: {
      'default': FullTheme(
        name: 'Swift Travel',
        light: SerializableColorScheme.fromColorScheme(light),
        copyLight: (theme) => theme.copyWith(
          appBarTheme: theme.appBarTheme.copyWith(elevation: 0),
          bottomNavigationBarTheme:
              theme.bottomNavigationBarTheme.copyWith(selectedItemColor: light.secondary),
          cupertinoOverrideTheme: const CupertinoThemeData(textTheme: CupertinoTextThemeData()),
        ),
        dark: SerializableColorScheme.fromColorScheme(dark),
        lightShadow: lightShadow,
        darkShadow: darkShadow,
      ),
      'abin': FullTheme(
        name: 'Abin',
        light: SerializableColorScheme.fromColorScheme(
            ColorScheme.light(primary: purpleAbin, secondary: blueAbin)),
        dark: SerializableColorScheme.fromColorScheme(
            ColorScheme.dark(primary: purpleAbin, secondary: blueAbin)),
        lightShadow: lightShadow,
        darkShadow: darkShadow,
      ),
      'flutter': FullTheme(
        name: 'Flutter',
        light: SerializableColorScheme.fromColorScheme(const ColorScheme.light()),
        dark: SerializableColorScheme.fromColorScheme(const ColorScheme.dark()),
        lightShadow: lightShadow,
        darkShadow: darkShadow,
      ),
      'david': FullTheme(
        name: 'David',
        light: SerializableColorScheme.fromColorScheme(
            ColorScheme.light(primary: purpleAbin, secondary: blueAbin)),
        dark: SerializableColorScheme.fromColorScheme(
            ColorScheme.dark(primary: purpleAbin, secondary: blueAbin)),
        lightShadow: lightShadow,
        darkShadow: darkShadow,
      ),
    },
    fonts: fonts,
  );
}

/// Utility method to create a material color from any given
/// color.
MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = <int, Color>{};
  final r = color.red, g = color.green, b = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
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
