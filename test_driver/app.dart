import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:swiss_travel/pages/home_page.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  runApp(
    ProviderScope(
      overrides: [
        dynamicTheme.overrideWithValue(DynamicTheme(
          ThemeConfiguration(
            {
              "default": FullTheme(
                name: "Default theme",
                light: ThemeData(primarySwatch: Colors.red, primaryColor: Colors.red),
                dark: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.red,
                  primaryColor: Colors.red,
                ),
                lightShadow: const ShadowTheme(
                  buttonShadow:
                      BoxShadow(blurRadius: 16, color: Color(0x260700b1), offset: Offset(0, 8)),
                ),
                darkShadow: const ShadowTheme(
                  buttonShadow:
                      BoxShadow(blurRadius: 16, color: Color(0x4C000000), offset: Offset(0, 8)),
                ),
              ),
            },
            persist: false,
          ),
        ))
      ],
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    ),
  );
}
