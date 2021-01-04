import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

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

ThemeConfiguration get themeConfiguration {
  final String muli = GoogleFonts.muli().fontFamily;
  return ThemeConfiguration({
    'default': FullTheme(
      name: 'Swift Travel',
      light: ThemeData(
        primarySwatch: redAccent,
        fontFamily: muli,
        appBarTheme: AppBarTheme(
          color: Colors.white12,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black),
          toolbarTextStyle: TextStyle(color: Colors.black),
          textTheme: Typography.englishLike2018.apply(bodyColor: Colors.black, fontFamily: muli),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: redAccent,
        primaryColor: Colors.redAccent,
        fontFamily: muli,
      ),
      lightShadow: lightShadow,
      darkShadow: darkShadow,
    ),
    'lexend': FullTheme(
      name: 'Lexend',
      light: ThemeData(
        primarySwatch: redAccent,
        fontFamily: GoogleFonts.lexendDeca().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white12,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black),
          toolbarTextStyle: TextStyle(color: Colors.black),
          textTheme: Typography.englishLike2018
              .apply(bodyColor: Colors.black, fontFamily: GoogleFonts.lexendDeca().fontFamily),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: redAccent,
        primaryColor: Colors.redAccent,
        fontFamily: GoogleFonts.lexendDeca().fontFamily,
      ),
      lightShadow: lightShadow,
      darkShadow: darkShadow,
    ),
    'abin': FullTheme(
      name: 'Abin',
      light: ThemeData(
        primarySwatch: purpleAbin,
        accentColor: blueAbin,
        fontFamily: GoogleFonts.cardo().fontFamily,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: purpleAbin,
        primarySwatch: purpleAbin,
        accentColor: blueAbin,
        fontFamily: GoogleFonts.cardo().fontFamily,
      ),
      lightShadow: lightShadow,
      darkShadow: darkShadow,
    ),
    'code': FullTheme(
      name: 'Code',
      light: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigoAccent,
        fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigoAccent,
        fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
      ),
      lightShadow: lightShadow,
      darkShadow: darkShadow,
    ),
    'quicksand': FullTheme(
      name: 'Quicksand',
      light: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.purpleAccent,
        fontFamily: GoogleFonts.quicksand().fontFamily,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        accentColor: Colors.purpleAccent,
        fontFamily: GoogleFonts.quicksand().fontFamily,
      ),
      lightShadow: lightShadow,
      darkShadow: darkShadow,
    ),
  });
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
