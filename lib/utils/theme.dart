import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

ThemeConfiguration get themeConfiguration => ThemeConfiguration({
      "default": FullTheme(
        name: "Swiss Travel",
        description: "The default theme.",
        light: ThemeData(
          primaryColor: Colors.redAccent,
          indicatorColor: const Color(0xFFFFFFFF),
          fontFamily: GoogleFonts.muli().fontFamily,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.redAccent,
          fontFamily: GoogleFonts.muli().fontFamily,
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
          fontFamily: GoogleFonts.lexendDeca().fontFamily,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.redAccent,
          fontFamily: GoogleFonts.lexendDeca().fontFamily,
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
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent,
          fontFamily: GoogleFonts.merriweather().fontFamily,
        ),
        lightShadow: const ShadowTheme(
          buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x260700b1), offset: Offset(0, 8)),
        ),
        darkShadow: const ShadowTheme(
          buttonShadow: BoxShadow(blurRadius: 16, color: Color(0x4C000000), offset: Offset(0, 8)),
        ),
      ),
    });
