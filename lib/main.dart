import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/apis/cff/models/local_route.dart';
import 'package:swift_travel/apis/cff/models/route_connection.dart';
import 'package:swift_travel/apis/cff/models/stationboard_connection.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/pages/404.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/live_route/live_route.dart';
import 'package:swift_travel/pages/loading.dart';
import 'package:swift_travel/pages/settings.dart';
import 'package:swift_travel/pages/tuto.dart';
import 'package:swift_travel/pages/welcome.dart';
import 'package:swift_travel/tabs/routes/details/route_details.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/tabs/stations/subsequent_stops.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final FirebaseAnalytics analytics = FirebaseAnalytics();

bool get isMobile =>
    defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android;

String get platform => kIsWeb ? 'Web ($defaultTargetPlatform)' : Platform.operatingSystem;

const debugPlatformMap = {
  TargetPlatform.windows: TargetPlatform.macOS,
  TargetPlatform.android: TargetPlatform.iOS
};

Future<void> main() async {
  if (Env.overridePlatform) {
    final TargetPlatform platform = debugPlatformMap[defaultTargetPlatform];
    log('Overriding $defaultTargetPlatform by $platform');
    debugDefaultTargetPlatformOverride = platform;
  }
  print(Env.doShowErrors);
  WidgetsFlutterBinding.ensureInitialized();

  if (isMobile) {
    log('We are on mobile ($platform)');
    await Firebase.initializeApp();
    FlutterError.onError = reportFlutterError;
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode);
    runZonedGuarded(_runApp, reportDartError);
  } else {
    log('We are not on mobile ($platform)');
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
    log('Reload theme');
    context.read(dynamicTheme).configure(themeConfiguration, doLog: false);
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
            Strings.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorObservers: [],
          builder: (context, child) => LocalizationAwareWidget(child: child),
          supportedLocales: Strings.delegate.supportedLocales,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          initialRoute: "loading",
        );
      }),
    );
  }

  Route onUnknownRoute(RouteSettings settings) {
    reportDartError("Unknown page : `${settings.name}`", StackTrace.current,
        name: "router", reason: "while trying to route", showSnackbar: false);
    return MaterialPageRoute(builder: (_) => PageNotFound(settings: settings));
  }

  Route onGenerateRoute(RouteSettings settings) {
    log("Routing to ${settings.name}");
    switch (settings.name) {
      case "/":
        return MaterialWithModalsPageRoute(settings: settings, builder: (_) => MainApp());
      case "loading":
        return MaterialWithModalsPageRoute(settings: settings, builder: (_) => LoadingPage());
      case "/settings":
        return MaterialWithModalsPageRoute(settings: settings, builder: (_) => Settings());
      case "/routeDetails":
        if (settings.arguments is Map) {
          final map = settings.arguments as Map;
          return MaterialWithModalsPageRoute(
              settings: settings,
              builder: (_) => RouteDetails(route: map["route"] as CffRoute, i: map["i"] as int));
        }
        break;
      case "/tuto":
        return MaterialWithModalsPageRoute(settings: settings, builder: (_) => Tuto());
      case "/welcome":
        return MaterialWithModalsPageRoute(settings: settings, builder: (_) => WelcomePage());
      case "/route":
        if (settings.arguments is LocalRoute)
          return MaterialWithModalsPageRoute(
              settings: settings,
              builder: (_) => SearchRoute.route(settings.arguments as LocalRoute));
        else if (settings.arguments is FavoriteStop)
          return MaterialWithModalsPageRoute(
              settings: settings,
              builder: (_) => SearchRoute.stop(settings.arguments as FavoriteStop));
        break;
      case "/ourTeam":
        return MaterialWithModalsPageRoute(settings: settings, builder: (_) => TeamPage());
      case "/liveRoute":
        return MaterialWithModalsPageRoute(
            settings: settings,
            builder: (_) => LiveRoutePage(connection: settings.arguments as RouteConnection));
      case "/stopDetails":
        return MaterialWithModalsPageRoute(
            settings: settings,
            builder: (_) => StopDetails(stopName: settings.arguments as String));

      case "/nextStops":
        return MaterialWithModalsPageRoute(
            settings: settings,
            builder: (_) =>
                NextStopsPage(connection: settings.arguments as StationboardConnection));
      case "/error":
      case "error":
        return MaterialWithModalsPageRoute(
            settings: settings,
            builder: (_) => ErrorPage(settings.arguments as FlutterErrorDetails));
    }
    return null;
  }
}

class LocalizationAwareWidget extends StatefulWidget {
  final Widget child;

  const LocalizationAwareWidget({Key key, this.child}) : super(key: key);

  @override
  _LocalizationAwareWidgetState createState() => _LocalizationAwareWidgetState();
}

class _LocalizationAwareWidgetState extends State<LocalizationAwareWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read(navigationAPIProvider).locale = locale;
  }

  @override
  Widget build(BuildContext context) => widget.child;
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
