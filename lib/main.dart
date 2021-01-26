import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pedantic/pedantic.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/apis/cff/models/route_connection.dart';
import 'package:swift_travel/apis/cff/models/stationboard_connection.dart';
import 'package:swift_travel/constants/build.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/live_route/live_route.dart';
import 'package:swift_travel/pages/loading.dart';
import 'package:swift_travel/pages/page_not_found.dart';
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
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';
import 'package:url_strategy/url_strategy.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

bool get isMobile => !kIsWeb && (Platform.isIOS || Platform.isIOS);

String get platform => kIsWeb ? 'Web ($defaultTargetPlatform)' : Platform.operatingSystem;

const debugPlatformMap = {
  TargetPlatform.windows: TargetPlatform.macOS,
  TargetPlatform.android: TargetPlatform.iOS,
};

Future<void> main() async {
  if (kReleaseMode) {
    print(
      '=== Release mode ===\n'
      'Build date: $commitBuildDate\n'
      'Commit message: $commitMessage\n'
      'Commit hash: $commitHash',
    );
    print('Platform: $platform');
  }
  if (Env.overridePlatform) {
    final platform = debugPlatformMap[defaultTargetPlatform];
    log('Overriding $defaultTargetPlatform by $platform');
    debugDefaultTargetPlatformOverride = platform;
  }

  if (kDebugMode) print(Env.env);
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  if (isMobile) {
    await Firebase.initializeApp();
    unawaited(FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode));
  }

  FlutterError.onError = reportFlutterError;
  runZonedGuarded(_runApp, reportDartError);
}

void _runApp() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarwin = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isDarwin = Responsive.isDarwin(context);
  }

  @override
  void reassemble() {
    super.reassemble();
    log('Reload theme');
    context.read(dynamicTheme).configure(themeConfiguration);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      excludeFromSemantics: true,
      behavior: HitTestBehavior.opaque,
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
          supportedLocales: Strings.delegate.supportedLocales,
          onGenerateRoute: (settings) => onGenerateRoute(settings, isDarwin),
          onUnknownRoute: (settings) => onUnknownRoute(settings, isDarwin),
          onGenerateInitialRoutes: (settings) => onGenerateInitialRoutes(settings, isDarwin),
          builder: (context, child) => IfWrapper(
            builder: (context, child) => CupertinoTheme(
              data: CupertinoThemeData(
                brightness: DynamicTheme.resolveBrightness(context, theme.mode),
              ),
              child: child,
            ),
            condition: isDarwin,
            child: child,
          ),
          initialRoute: 'loading',
        );
      }),
    );
  }

  List<Route> onGenerateInitialRoutes(String initialRoute, bool isDarwin) {
    log('Initial route : $initialRoute');
    final uri = Uri.tryParse(initialRoute);

    final routes = <Route>[];

    switch (uri.path) {
      case '/route':
        routes.add(MaterialWithModalsPageRoute(
            settings: const RouteSettings(name: '/'), builder: (_) => LoadingPage(uri: uri)));
        break;

      default:
        routes.add(MaterialWithModalsPageRoute(
            settings: const RouteSettings(name: '/'), builder: (_) => const LoadingPage()));
    }
    return routes;
  }
}

Route onUnknownRoute(RouteSettings settings, bool isDarwin) {
  reportDartError('Unknown page : `${settings.name}`', StackTrace.current,
      name: 'router', reason: 'while trying to route', showSnackbar: false);
  return MaterialPageRoute(builder: (_) => PageNotFound(settings: settings));
}

Route onGenerateRoute(RouteSettings settings, bool isDarwin) {
  log('Routing to ${settings.name}');

  switch (settings.name) {
    case '/':
      return platformRoute(
        settings: settings,
        builder: (_) => const MainApp(),
        isDarwin: isDarwin,
      );
    case 'loading':
      return platformRoute(
        settings: settings,
        builder: (_) => const LoadingPage(),
        isDarwin: isDarwin,
      );
    case '/settings':
      return platformRoute(
        settings: settings,
        builder: (_) => const Settings(),
        fullscreenDialog: true,
        isDarwin: isDarwin,
      );
    case '/routeDetails':
      if (settings.arguments is Map) {
        final map = settings.arguments as Map;
        return platformRoute(
          settings: settings,
          builder: (_) => RouteDetails(
            route: map['route'] as CffRoute,
            i: map['i'] as int,
            doClose: true,
          ),
          isDarwin: isDarwin,
        );
      }
      break;
    case '/tuto':
      return platformRoute(
        settings: settings,
        builder: (_) => const Tuto(),
        isDarwin: isDarwin,
      );
    case '/welcome':
      return platformRoute(
        settings: settings,
        builder: (_) => const WelcomePage(),
        isDarwin: isDarwin,
      );
    case '/route':
      if (settings.arguments is LocalRoute) {
        return platformRoute(
          settings: settings,
          builder: (_) => RoutePage.route(settings.arguments as LocalRoute),
          isDarwin: isDarwin,
        );
      } else if (settings.arguments is FavoriteStop) {
        return platformRoute(
          settings: settings,
          builder: (_) => RoutePage.stop(settings.arguments as FavoriteStop),
          isDarwin: isDarwin,
        );
      }
      break;
    case '/ourTeam':
      return platformRoute(
          settings: settings, builder: (_) => const TeamPage(), isDarwin: isDarwin);
    case '/liveRoute':
      return platformRoute(
          settings: settings,
          builder: (_) => LiveRoutePage(connection: settings.arguments as RouteConnection),
          isDarwin: isDarwin);
    case '/stopDetails':
      return platformRoute(
          settings: settings,
          builder: (_) => StopDetails(stopName: settings.arguments as String),
          isDarwin: isDarwin);

    case '/nextStops':
      return platformRoute(
          settings: settings,
          builder: (_) => NextStopsPage(connection: settings.arguments as StationboardConnection),
          isDarwin: isDarwin);
    case '/error':
    case 'error':
      return platformRoute(
        settings: settings,
        builder: (_) => ErrorPage(settings.arguments as FlutterErrorDetails),
        isDarwin: isDarwin,
      );
  }
  return null;
}

Route platformRoute({
  @required Widget Function(BuildContext) builder,
  @required bool isDarwin,
  RouteSettings settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String title,
}) {
  return isDarwin
      ? CupertinoPageRoute(
          builder: builder,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
          title: title,
          maintainState: maintainState,
        )
      : MaterialPageRoute(
          builder: builder,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
          maintainState: maintainState,
        );
}

class Routes {
  Routes._();

  static const route = '/route';
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
