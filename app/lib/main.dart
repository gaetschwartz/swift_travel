import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/constants/build.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/live_route/live_route.dart';
import 'package:swift_travel/pages/loading.dart';
import 'package:swift_travel/pages/page_not_found.dart';
import 'package:swift_travel/pages/welcome.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/settings/team_page.dart';
import 'package:swift_travel/tabs/routes/details/route_details.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/intents.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';
import 'package:url_strategy/url_strategy.dart';

import 'l10n/app_localizations.dart';
import 'models/favorites.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
bool get isTest => Platform.environment.containsKey('FLUTTER_TEST');

String get platform =>
    kIsWeb ? 'Web ($defaultTargetPlatform)' : Platform.operatingSystem;

void main() {
  preLaunchRoutine();

  runZonedGuarded(() => runApp(const FullApp()), reportDartError);
}

void preLaunchRoutine() {
  if (kReleaseMode) {
    log.log(
      '=== Release mode ===\n'
      'Build date: $commitBuildDate\n'
      'Commit message: $commitMessage\n'
      'Commit hash: $commitHash',
    );
  }
  if (kDebugMode) {
    log.log(Env.env);
  }

  if (Env.overridePlatform) {
    overridePlatform();
  }
  setPathUrlStrategy();

  if (isTest) {
    log.log('We are in a test');
  } else {
    FlutterError.onError = reportFlutterError;
  }

  WidgetsFlutterBinding.ensureInitialized();
}

void overridePlatform() {
  final TargetPlatform p;

  switch (defaultTargetPlatform) {
    case TargetPlatform.windows:
      p = TargetPlatform.macOS;
      break;
    case TargetPlatform.android:
      p = TargetPlatform.iOS;
      break;

    case TargetPlatform.fuchsia:
    case TargetPlatform.iOS:
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
      return;
  }

  log.log('Overriding $defaultTargetPlatform by $platform');
  debugDefaultTargetPlatformOverride = p;
}

class FullApp extends StatefulWidget {
  const FullApp({
    Key? key,
  }) : super(key: key);

  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> {
  final DynamicThemeData dynamicThemeData =
      DynamicThemeData(DynamicThemeData.defaultConfig);

  @override
  void reassemble() {
    super.reassemble();
    log.log('Reload theme');
    dynamicThemeData.configure(themeConfiguration, doLog: true);
  }

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: DynamicTheme(
          theme: dynamicThemeData,
          child: const Unfocus(child: SwiftTravelApp()),
        ),
      );
}

class SwiftTravelApp extends StatefulWidget {
  const SwiftTravelApp({Key? key}) : super(key: key);

  @override
  _SwiftTravelAppState createState() => _SwiftTravelAppState();
}

final _shortcuts = {
  LogicalKeySet(LogicalKeyboardKey.escape): const EscapeIntent(),
  LogicalKeySet(ctrl, LogicalKeyboardKey.tab): const SwitchTabIntent(),
  LogicalKeySet(ctrl, LogicalKeyboardKey.digit1): const TabIntent(0),
  LogicalKeySet(ctrl, LogicalKeyboardKey.digit2): const TabIntent(1),
  LogicalKeySet(ctrl, LogicalKeyboardKey.digit3): const TabIntent(2),
  LogicalKeySet(ctrl, LogicalKeyboardKey.digit4): const TabIntent(3),
};

class _SwiftTravelAppState extends State<SwiftTravelApp> {
  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    final darwin = isThemeDarwin(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: "Swift Travel",
      theme: theme.light,
      darkTheme: theme.dark,
      themeMode: theme.themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      shortcuts: _shortcuts,
      actions: {
        EscapeIntent: CallbackAction(onInvoke: (e) {
          // log.log('Clearing sidebar');
          context.read(sideTabBarProvider).state = null;
          sideBarNavigatorKey.currentState!.popUntil((route) => route.isFirst);
        }),
        TabIntent: TabAction((tab) {
          //log.log('Changing tab to $tab');
          context.read(tabProvider).index = tab;
        }),
        SwitchTabIntent: CallbackAction(onInvoke: (_) {
          // log.log('Switching tab');
          final tabs = context.read(tabProvider);
          tabs.index = tabs.index %
              (darwin ? TabView.iosTabs.length : TabView.androidTabs.length);
        })
      },
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      scrollBehavior: const MaterialScrollBehavior(
        androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      ),
      initialRoute: 'loading',
    );
  }

  List<Route> onGenerateInitialRoutes(String initialRoute) {
    log.log('Initial route : $initialRoute');
    final uri = Uri.tryParse(initialRoute)!;

    final routes = <Route>[];

    switch (uri.path) {
      case '/route':
        routes.add(PlatformPageRoute<void>(
          settings: const RouteSettings(name: '/'),
          builder: (_) => LoadingPage(uri: uri),
        ));
        break;

      default:
        routes.add(PlatformPageRoute<void>(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const LoadingPage(),
        ));
    }

    return routes;
  }
}

Route<void> onUnknownRoute(RouteSettings settings) {
  reportDartError('Unknown page : `${settings.name}`', StackTrace.current,
      library: 'router', reason: 'while trying to route', showSnackbar: false);
  return MaterialPageRoute(builder: (_) => PageNotFound(settings: settings));
}

// ignore: long-method
Route<void>? onGenerateRoute(RouteSettings settings) {
  log.log('Routing to ${settings.name}');

  switch (settings.name) {
    case '/':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) => const TabView(),
      );
    case 'loading':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) => const LoadingPage(),
      );
    case '/settings':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) => const SettingsPage(),
        fullscreenDialog: true,
      );

    case '/routeDetails':
      if (settings.arguments is Pair<NavRoute, int>) {
        final pair = settings.arguments! as Pair<NavRoute, int>;
        return PlatformPageRoute(
          settings: settings,
          builder: (_) => RouteDetails(
            route: pair.first,
            i: pair.second,
            doShowCloseButton: true,
          ),
        );
      }
      break;

    case '/welcome':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) => const WelcomePage(),
      );
    case '/route':
      if (settings.arguments is LocalRoute) {
        return PlatformPageRoute(
          settings: settings,
          builder: (_) => RoutePage.route(settings.arguments as LocalRoute?),
        );
      } else if (settings.arguments is FavoriteStop) {
        return PlatformPageRoute(
          settings: settings,
          builder: (_) => RoutePage.stop(settings.arguments as FavoriteStop?),
        );
      }
      break;
    case '/ourTeam':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) => const TeamPage(),
      );
    case '/liveRoute':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) =>
            LiveRoutePage(connection: settings.arguments! as RouteConnection),
      );
    case '/stopDetails':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) =>
            StopDetails(SbbStop(name: settings.arguments! as String)),
      );

    case '/error':
    case 'error':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) => ErrorPage(settings.arguments as FlutterErrorDetails?),
      );
  }
}

class Unfocus extends StatelessWidget {
  const Unfocus({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: child,
    );
  }
}
