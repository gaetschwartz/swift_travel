import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/pages/loading.dart';
import 'package:swift_travel/utils/theme.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

bool get isSupported => !kIsWeb && !Platform.isWindows;

String get platform => kIsWeb ? "Web" : Platform.operatingSystem;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (isSupported) {
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    runZonedGuarded<Future<void>>(() async => _runApp(), FirebaseCrashlytics.instance.recordError);
  } else {
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
          title: 'SwiftTravel',
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: theme.mode,
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
