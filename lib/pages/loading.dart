import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MyHomePage()));
  }
}
