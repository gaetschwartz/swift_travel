import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stop.dart';
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
import 'package:swift_travel/tabs/stations/stations_tab.dart';
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

final isTest = Platform.environment.containsKey('FLUTTER_TEST');
final platform =
    kIsWeb ? 'Web ($defaultTargetPlatform)' : Platform.operatingSystem;

void main() {
  preLaunchRoutine();

  runZonedGuarded(() => runApp(const FullApp()), reportDartError);
}

void preLaunchRoutine() {
  final log = Logger.of('main');
  if (kReleaseMode) {
    log.log(
      '=== Release mode ===\n'
      'Build date: $commitBuildDate\n'
      'Commit message: $commitMessage\n'
      'Commit hash: $commitHash\n'
      'Platform: $platform\n',
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

    case TargetPlatform.iOS:
      p = TargetPlatform.android;
      break;
    case TargetPlatform.macOS:
      p = TargetPlatform.windows;
      break;
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
      return;
  }

  Logger.of('overridePlatform').log('Overriding $defaultTargetPlatform by $p');
  debugDefaultTargetPlatformOverride = p;
}

class FullApp extends StatefulWidget {
  const FullApp({
    super.key,
  });

  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> {
  final DynamicThemeNotifier dynamicThemeData =
      DynamicThemeNotifier(DynamicThemeNotifier.defaultConfig);

  final log = Logger.of('FullApp');

  @override
  void reassemble() {
    super.reassemble();
    if (kDebugMode) {
      log.log('Reload theme');
    }
    unawaited(dynamicThemeData.configure(themeConfiguration, doLog: true));
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: DynamicTheme(
        theme: dynamicThemeData,
        child: const SwiftTravelApp(),
      ),
    );
  }
}

class SwiftTravelApp extends ConsumerStatefulWidget {
  const SwiftTravelApp({super.key});

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

class _SwiftTravelAppState extends ConsumerState<SwiftTravelApp> {
  final log = Logger.of('SwiftTravelApp');

  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    final darwin = isThemeDarwin(context);

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
      shortcuts: _shortcuts,
      actions: {
        EscapeIntent: CallbackAction(onInvoke: (e) {
          // log.log('Clearing sidebar');
          ref.read(sideTabBarProvider.notifier).state = null;
          sideBarNavigatorKey.currentState!.popUntil((route) => route.isFirst);
          return null;
        }),
        TabIntent: TabAction(() => ref.read(tabProvider)),
        SwitchTabIntent: CallbackAction(onInvoke: (_) {
          // log.log('Switching tab');
          final tabs = ref.read(tabProvider);
          tabs.index = tabs.index %
              (darwin ? TabView.iosTabs.length : TabView.androidTabs.length);
          return null;
        })
      },
      onGenerateRoute: onGenerateRoute,
      onUnknownRoute: onUnknownRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      initialRoute: 'loading',
      builder: (context, child) =>
          Unfocus(child: ListenToLocaleChange(child: child!)),
    );
  }

  List<Route<void>> onGenerateInitialRoutes(String initialRoute) {
    log.log('Initial route : $initialRoute');
    final uri = Uri.tryParse(initialRoute)!;

    final routes = <Route<void>>[];

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

class ListenToLocaleChange extends ConsumerStatefulWidget {
  const ListenToLocaleChange({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<ListenToLocaleChange> createState() =>
      _ListenToLocaleChangeState();
}

class _ListenToLocaleChangeState extends ConsumerState<ListenToLocaleChange> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final notifier = ref.read(appLocalizationsProvider.notifier);
    final locale = notifier.state.localeName;
    final newAppLoc = AppLocalizations.of(context);
    final newLocale = newAppLoc.localeName;
    if (locale != newLocale) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(appLocalizationsProvider.notifier).state = newAppLoc;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

// ignore: long-method
Route<void>? onGenerateRoute(RouteSettings settings) {
  final log = Logger.of('onGenerateRoute');
  if (kDebugMode) {
    log.log('Routing to ${settings.name}');
  }

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
          builder: (_) => RoutePage.route(settings.arguments! as LocalRoute),
        );
      } else if (settings.arguments is FavoriteStop) {
        return PlatformPageRoute(
          settings: settings,
          builder: (_) => RoutePage.stop(settings.arguments! as FavoriteStop),
        );
      } else if (settings.arguments is Object) {
        log.e('Unknown route argument type ${settings.arguments.runtimeType}');
        break;
      } else {
        return PlatformPageRoute(
          settings: settings,
          builder: (_) => const RoutePage(),
        );
      }
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
            StopDetails(SchStop(sbbName: settings.arguments as String?)),
      );
    case '/stop':
      return PlatformPageRoute(
        settings: settings,
        builder: (_) => Material(
            child:
                StationsTab(action: settings.arguments as StationsTabAction?)),
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
  const Unfocus({super.key, required this.child});

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
