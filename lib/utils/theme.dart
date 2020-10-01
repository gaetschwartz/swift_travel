import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

final MaterialColor purpleAbin = createMaterialColor(const Color(0xffcbaacb));
final MaterialColor blueAbin = createMaterialColor(const Color(0xffabdee6));
final MaterialColor redAccent = createMaterialColor(Colors.redAccent);

const _pageTransitions = PageTransitionsTheme(builders: {
  TargetPlatform.android:
      SharedAxisPageTransitionsBuilder(transitionType: SharedAxisTransitionType.scaled),
});

ThemeConfiguration get themeConfiguration {
  return ThemeConfiguration({
    "default": FullTheme(
      name: "Swiss Travel",
      description: "The default theme.",
      light: ThemeData(
        primaryColor: Colors.redAccent,
        primarySwatch: redAccent,
        indicatorColor: const Color(0xFFFFFFFF),
        fontFamily: GoogleFonts.muli().fontFamily,
        pageTransitionsTheme: _pageTransitions,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.redAccent,
        primarySwatch: redAccent,
        fontFamily: GoogleFonts.muli().fontFamily,
        pageTransitionsTheme: _pageTransitions,
      ),
      lightShadow: const ShadowTheme(
        buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x260700b1), offset: Offset(0, 8)),
      ),
      darkShadow: const ShadowTheme(
        buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x4C000000), offset: Offset(0, 8)),
      ),
    ),
    "lexend": FullTheme(
      name: "Lexend",
      description: "Lexend !",
      light: ThemeData(
        primaryColor: Colors.redAccent,
        primarySwatch: redAccent,
        fontFamily: GoogleFonts.lexendDeca().fontFamily,
        pageTransitionsTheme: _pageTransitions,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.redAccent,
        primarySwatch: redAccent,
        fontFamily: GoogleFonts.lexendDeca().fontFamily,
        pageTransitionsTheme: _pageTransitions,
      ),
      lightShadow: const ShadowTheme(
        buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x260700b1), offset: Offset(0, 8)),
      ),
      darkShadow: const ShadowTheme(
        buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x4C000000), offset: Offset(0, 8)),
      ),
    ),
    "abin": FullTheme(
      name: "Abin",
      description: "My inspiration",
      light: ThemeData(
        primarySwatch: purpleAbin,
        accentColor: blueAbin,
        fontFamily: GoogleFonts.cardo().fontFamily,
        pageTransitionsTheme: _pageTransitions,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: purpleAbin,
        primarySwatch: purpleAbin,
        accentColor: blueAbin,
        fontFamily: GoogleFonts.cardo().fontFamily,
        pageTransitionsTheme: _pageTransitions,
      ),
      lightShadow: const ShadowTheme(
        buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x260700b1), offset: Offset(0, 8)),
      ),
      darkShadow: const ShadowTheme(
        buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x4C000000), offset: Offset(0, 8)),
      ),
    ),
    "lavender": FullTheme(
      name: "Lavender",
      description: "We all love lavender.",
      light: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        fontFamily: GoogleFonts.merriweather().fontFamily,
        pageTransitionsTheme: _pageTransitions,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        fontFamily: GoogleFonts.merriweather().fontFamily,
        pageTransitionsTheme: _pageTransitions,
      ),
      lightShadow: const ShadowTheme(
        buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x260700b1), offset: Offset(0, 8)),
      ),
      darkShadow: const ShadowTheme(
        buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x4C000000), offset: Offset(0, 8)),
      ),
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
