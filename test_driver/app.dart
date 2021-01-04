import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/blocs/theme/src/colorscheme.dart';

void main() {
  // This line enables the extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  runApp(
    ProviderScope(
      overrides: [
        dynamicTheme.overrideWithProvider(ChangeNotifierProvider((_) => DynamicTheme(
              ThemeConfiguration(
                themes: {
                  'default': FullTheme(
                    name: 'Default theme',
                    light: SerializableColorScheme.light(),
                    dark: SerializableColorScheme.dark(),
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
            )))
      ],
      child: Consumer(builder: (context, w, _) {
        final theme = w(dynamicTheme);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: 'Swift Travel',
          builder: (context, child) => Unfocus(child: child),
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: theme.mode,
          home: const MainApp(),
        );
      }),
    ),
  );
}
