import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/constants/build.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/live_route/live_route.dart';
import 'package:swift_travel/pages/loading.dart';
import 'package:swift_travel/pages/page_not_found.dart';
import 'package:swift_travel/pages/settings/settings.dart';
import 'package:swift_travel/pages/welcome.dart';
import 'package:swift_travel/tabs/routes/details/route_details.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/extensions.dart';
import 'package:swift_travel/utils/intents.dart';
import 'package:swift_travel/utils/predict/models/models.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';
import 'package:url_strategy/url_strategy.dart';

import 'l10n/app_localizations.dart';
import 'models/favorites.dart';
import 'pages/settings/team_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final isTest = () {
  // ignore: do_not_use_environment
  if (const bool.fromEnvironment('testing_mode')) {
    return true;
  }
  var _isTest = false;
  assert(() {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      _isTest = true;
    }
    return true;
  }(), '');
  return _isTest;
}();

bool get isMobile => !kIsWeb && (Platform.isIOS || Platform.isAndroid);

String get platform => kIsWeb ? 'Web ($defaultTargetPlatform)' : Platform.operatingSystem;

void main() {
  if (kReleaseMode) {
    print(
      '=== Release mode ===\n'
      'Build date: $commitBuildDate\n'
      'Commit message: $commitMessage\n'
      'Commit hash: $commitHash',
    );
  }
  if (kDebugMode) {
    print(Env.env);
  }

  if (isTest) {
    print('We are in a test');
  }

  WidgetsFlutterBinding.ensureInitialized();

  if (Env.overridePlatform) {
    overridePlatform();
  }
  setPathUrlStrategy();

  if (!isTest) {
    FlutterError.onError = reportFlutterError;
  }
  runZonedGuarded(_runApp, reportDartError);
}

void overridePlatform() {
  late final TargetPlatform p;

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

  log('Overriding $defaultTargetPlatform by $platform');
  debugDefaultTargetPlatformOverride = p;
}

void _runApp() => runApp(const FullApp());

class FullApp extends StatefulWidget {
  const FullApp({
    Key? key,
  }) : super(key: key);

  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> {
  final DynamicThemeData dynamicThemeData = DynamicThemeData();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    dynamicThemeData.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    log('Reload theme');
    dynamicThemeData.configure(themeConfiguration);
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

class _SwiftTravelAppState extends State<SwiftTravelApp> {
  final shortcuts2 = {
    LogicalKeySet(LogicalKeyboardKey.escape): const EscapeIntent(),
    LogicalKeySet(ctrl, LogicalKeyboardKey.tab): const SwitchTabIntent(),
    LogicalKeySet(ctrl, LogicalKeyboardKey.digit1): const TabIntent(0),
    LogicalKeySet(ctrl, LogicalKeyboardKey.digit2): const TabIntent(1),
    LogicalKeySet(ctrl, LogicalKeyboardKey.digit3): const TabIntent(2),
    LogicalKeySet(ctrl, LogicalKeyboardKey.digit4): const TabIntent(3),
  };

  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    final isDarwin = Responsive.isDarwin(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Swift Travel',
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
      shortcuts: shortcuts2,
      actions: {
        EscapeIntent: CallbackAction(onInvoke: (e) {
          if (kDebugMode) {
            print('Clearing sidebar');
          }
          context.read(sideTabBarProvider).state = null;
          sideBarNavigatorKey.currentState!.popUntil((route) => route.isFirst);
          return null;
        }),
        TabIntent: TabAction((tab) {
          print('Changing tab to $tab');
          context.read(tabProvider).index = tab;
        }),
        SwitchTabIntent: CallbackAction(onInvoke: (_) {
          print('Switching tab');
          final tabs = context.read(tabProvider);
          tabs.index = (isDarwin ? TabView.iosTabs : TabView.androidTabs).modulo(tabs.index);
        })
      },
      onGenerateRoute: (settings) => onGenerateRoute(settings, isDarwin: isDarwin),
      onUnknownRoute: (settings) => onUnknownRoute<void>(settings, isDarwin: isDarwin),
      onGenerateInitialRoutes: (settings) => onGenerateInitialRoutes(settings, isDarwin: isDarwin),
      builder: (context, child) => PlatformBuilder(
        cupertinoBuilder: (context, child) {
          final t = Theme.of(context);
          final cupertinoOverride = t.cupertinoOverrideTheme ?? const NoDefaultCupertinoThemeData();
          return CupertinoTheme(
            data: CupertinoThemeData(
              brightness: t.brightness,
              primaryColor: cupertinoOverride.primaryColor,
              primaryContrastingColor: cupertinoOverride.primaryContrastingColor,
              textTheme: cupertinoOverride.textTheme,
              barBackgroundColor: cupertinoOverride.barBackgroundColor,
              scaffoldBackgroundColor: cupertinoOverride.scaffoldBackgroundColor,
            ),
            child: child!,
          );
        },
        materialBuilder: (context, child) => ScrollConfiguration(
          behavior: const NoOverscrollGlowBehavior(),
          child: child!,
        ),
        child: child,
      ),
      initialRoute: 'loading',
    );
  }

  List<Route> onGenerateInitialRoutes(String initialRoute, {required bool isDarwin}) {
    log('Initial route : $initialRoute');
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

Route<T> onUnknownRoute<T extends Object?>(RouteSettings settings, {required bool isDarwin}) {
  reportDartError('Unknown page : `${settings.name}`', StackTrace.current,
      library: 'router', reason: 'while trying to route', showSnackbar: false);
  return MaterialPageRoute<T>(builder: (_) => PageNotFound(settings: settings));
}

Route? onGenerateRoute(RouteSettings settings, {required bool isDarwin}) {
  log('Routing to ${settings.name}');

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
        builder: (_) => LiveRoutePage(connection: settings.arguments! as RouteConnection),
      );
    case '/stopDetails':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) => StopDetails(SbbStop(settings.arguments! as String)),
      );

    case '/error':
    case 'error':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) => ErrorPage(settings.arguments as FlutterErrorDetails?),
      );
  }
  return null;
}

class Unfocus extends StatelessWidget {
  const Unfocus({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: child,
      );
}

class NoOverscrollGlowBehavior extends ScrollBehavior {
  const NoOverscrollGlowBehavior();

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
