import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/blocs/theme/src/colorscheme.dart';
import 'package:utils/blocs/theme/src/font.dart';

final MaterialColor purpleAbin = createMaterialColor(const Color(0xffcbaacb));
final MaterialColor blueAbin = createMaterialColor(const Color(0xffabdee6));
final MaterialColor redAccent = createMaterialColor(Colors.redAccent);
final MaterialColor white = createMaterialColor(Colors.white);

const lightShadow = ShadowTheme(
  buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x260700b1), offset: Offset(0, 8)),
);

const darkShadow = ShadowTheme(
  buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x4C000000), offset: Offset(0, 8)),
);

final List<Font> fonts = [
  Font("Muli", () => GoogleFonts.muliTextTheme(Typography.englishLike2018)),
  Font("Lexend", () => GoogleFonts.lexendDecaTextTheme(Typography.englishLike2018)),
  Font("Open Sans", () => GoogleFonts.openSansTextTheme(Typography.englishLike2018)),
  Font("IBM Plex Mono", () => GoogleFonts.ibmPlexMonoTextTheme(Typography.englishLike2018)),
  Font("Source Sans Pro", () => GoogleFonts.sourceSansProTextTheme(Typography.englishLike2018)),
  Font("Cardo", () => GoogleFonts.cardoTextTheme(Typography.englishLike2018)),
  Font("QuickSand", () => GoogleFonts.quicksandTextTheme(Typography.englishLike2018)),
];

ThemeConfiguration get themeConfiguration {
  final light = ColorScheme.fromSwatch(
    primarySwatch: createMaterialColor(Colors.white),
    accentColor: Colors.red,
  );
  final dark = ColorScheme.dark();
  return ThemeConfiguration(
    themes: {
      'default': FullTheme(
        name: 'Swift Travel',
        light: SerializableColorScheme.fromColorScheme(light),
        copyLight: (theme) => theme.copyWith(appBarTheme: theme.appBarTheme.copyWith(elevation: 0)),
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
