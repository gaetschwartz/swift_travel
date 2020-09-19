import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/blocs/preferences.dart';
import 'package:swiss_travel/blocs/quick_actions.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/main.dart';
import 'package:utils/blocs/full_theme.dart';
import 'package:utils/blocs/theme_configuration.dart';
import 'package:utils/blocs/theme_riverpod.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => init());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const SizedBox(
        height: 64,
        width: 64,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }

  Future<void> init() async {
    if (kDebugMode) {
      log("Disabling crash reports in debug mode", name: "Loading");
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await FirebaseCrashlytics.instance.log("Loading page");
    }

    await context.read(dynamicTheme).configure(
          ThemeConfiguration({
            "default": FullTheme(
                name: "Default theme",
                light: ThemeData(
                  primarySwatch: Colors.red,
                  fontFamily: GoogleFonts.muli().fontFamily,
                ),
                dark: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.red,
                  fontFamily: GoogleFonts.muli().fontFamily,
                )),
            "dancing": FullTheme(
                name: "Dancing",
                light: ThemeData(
                  primaryColor: const Color(0xfffbf3d4),
                  accentColor: Colors.pinkAccent,
                  fontFamily: GoogleFonts.merriweather().fontFamily,
                ),
                dark: ThemeData(
                  brightness: Brightness.dark,
                  primaryColor: const Color(0xfffbf3d4),
                  accentColor: Colors.deepOrangeAccent,
                  fontFamily: GoogleFonts.merriweather().fontFamily,
                )),
            "lavender": FullTheme(
                name: "Lavender",
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
                )),
          }),
        );
    final prefs = await SharedPreferences.getInstance();
    await context.read(mapsAppProvider).loadFromPreferences(prefs: prefs);
    await context.read(storeProvider).loadFromPreferences(prefs: prefs);

    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => MyHomePage()));

    await context.read(quickActions).init();
  }
}
