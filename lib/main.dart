import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/pages/loading.dart';
import 'package:swift_travel/pages/welcome.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

bool get isMobile =>
    defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android;

String get platform => kIsWeb ? "Web ($defaultTargetPlatform)" : Platform.operatingSystem;

const debugPlatformMap = {
  TargetPlatform.windows: TargetPlatform.macOS,
  TargetPlatform.android: TargetPlatform.iOS
};

const Map<String, WelcomePage> pagesMap = {
  "welcome": WelcomePage(),
};

Future<void> main() async {
  if (const bool.fromEnvironment("OVERRIDE_PLATFORM")) {
    final TargetPlatform platform = debugPlatformMap[defaultTargetPlatform];
    log("Overriding $defaultTargetPlatform by $platform");
    debugDefaultTargetPlatformOverride = platform;
  }
  WidgetsFlutterBinding.ensureInitialized();

  if (isMobile) {
    log("We are on mobile ($platform)");
    await Firebase.initializeApp();
    FlutterError.onError = reportFlutterError;
    runZonedGuarded<Future<void>>(() async => _runApp(), FirebaseCrashlytics.instance.recordError);
  } else {
    log("We are not on mobile ($platform)");
    _runApp();
  }
}

void _runApp() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void reassemble() {
    super.reassemble();
    log("Reload theme");
    context.read(dynamicTheme).configure(themeConfiguration);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Consumer(builder: (context, w, _) {
        final theme = w(dynamicTheme);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: scaffoldMessengerKey,
          title: 'Swift Travel',
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: theme.mode,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: LoadingPage(),
        );
      }),
    );
  }
}

class Unfocus extends StatelessWidget {
  const Unfocus({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: child,
      );
}
