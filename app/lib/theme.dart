import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
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

const List<Font> fonts = [
  Font('Montserrat', GoogleFonts.montserratTextTheme),
  Font('Lexend', GoogleFonts.lexendDecaTextTheme),
  Font('Muli', GoogleFonts.mulishTextTheme),
  Font('Open Sans', GoogleFonts.openSansTextTheme),
  Font('IBM Plex Mono', GoogleFonts.ibmPlexMonoTextTheme),
  Font('Cardo', GoogleFonts.cardoTextTheme),
  Font('QuickSand', GoogleFonts.quicksandTextTheme),
  Font('Raleway', GoogleFonts.ralewayTextTheme),
  Font('Lato', GoogleFonts.latoTextTheme),
  Font('Source Sans Pro', GoogleFonts.sourceSansProTextTheme),
  Font('Poppins', GoogleFonts.poppinsTextTheme),
  Font('Ubuntu', GoogleFonts.ubuntuTextTheme),
];

const _light = ColorScheme.light();
const _dark = ColorScheme.dark();

final ThemeConfiguration themeConfiguration = ThemeConfiguration(
  fonts: fonts,
  defaultFont: fonts.first,
  applyToAllThemes: (t) => t.copyWith(fixTextFieldOutlineLabel: true),
  defaultTheme: 'default',
  themes: {
    'default': FullTheme(
      name: 'Swift',
      light: _light,
      applyToLight: (theme) => theme.copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.black,
          textTheme: Typography.englishLike2018.apply(bodyColor: Colors.black),
          iconTheme: const IconThemeData(color: Colors.black),
          actionsIconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(),
      ),
      dark: _dark,
      lightShadow: lightShadow,
      darkShadow: darkShadow,
    ),
    'abin': FullTheme(
      name: 'Abin',
      light: ColorScheme.light(primary: purpleAbin, secondary: blueAbin),
      dark: ColorScheme.dark(primary: purpleAbin, secondary: blueAbin),
      lightShadow: lightShadow,
      darkShadow: darkShadow,
    ),
    'material': FullTheme(
      name: 'Material',
      light: FlexColorScheme.light(
        colors: FlexColor.schemes[FlexScheme.material]!.light,
      ).toScheme,
      dark: FlexColorScheme.dark(
        colors: FlexColor.schemes[FlexScheme.material]!.dark,
      ).toScheme,
      lightShadow: lightShadow,
      darkShadow: darkShadow,
    ),
    'david': FullTheme(
      name: 'David',
      light: ColorScheme.light(primary: Colors.pink[900]!, secondary: Colors.yellow[800]!),
      dark: ColorScheme.dark(primary: Colors.pink[900]!, secondary: Colors.yellow[800]!),
      applyToDark: (theme) => theme.copyWith(
        appBarTheme:
            theme.appBarTheme.copyWith(color: theme.colorScheme.primary, centerTitle: true),
      ),
      lightShadow: lightShadow,
      darkShadow: darkShadow,
    ),
  },
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
