import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedantic/pedantic.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/constants/build.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/live_route/live_route.dart';
import 'package:swift_travel/pages/loading.dart';
import 'package:swift_travel/pages/page_not_found.dart';
import 'package:swift_travel/pages/settings.dart';
import 'package:swift_travel/pages/welcome.dart';
import 'package:swift_travel/tabs/routes/details/route_details.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';
import 'package:url_strategy/url_strategy.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

bool get isMobile => !kIsWeb && (Platform.isIOS || Platform.isAndroid);

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
  }
  if (kDebugMode) print(Env.map);

  WidgetsFlutterBinding.ensureInitialized();

  overridePlatform();
  setPathUrlStrategy();

  print('Platform: $platform');

  if (isMobile) {
    await Firebase.initializeApp();
    unawaited(FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode));
  }

  FlutterError.onError = reportFlutterError;
  runZonedGuarded(_runApp, reportDartError);
}

void overridePlatform() {
  if (Env.overridePlatform) {
    final platform = debugPlatformMap[defaultTargetPlatform];
    log('Overriding $defaultTargetPlatform by $platform');
    debugDefaultTargetPlatformOverride = platform;
  }
}

void _runApp() => runApp(ProviderScope(child: MyApp()));

final ctrl = defaultTargetPlatform == TargetPlatform.macOS
    ? LogicalKeyboardKey.meta
    : LogicalKeyboardKey.control;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class TabIntent extends Intent {
  final int tab;

  const TabIntent(this.tab);
}

class TabAction extends Action {
  final void Function(int tab) changeTab;

  TabAction(this.changeTab);

  @override
  Object? invoke(covariant TabIntent intent) {
    changeTab(intent.tab);
    return null;
  }
}

class SwitchTabIntent extends Intent {
  const SwitchTabIntent();
}

class EscapeIntent extends Intent {
  const EscapeIntent();
}

const digit1KeyId = 0x10700000031;

class _MyAppState extends State<MyApp> {
  @override
  void reassemble() {
    super.reassemble();
    log('Reload theme');
    context.read(dynamicTheme).configure(themeConfiguration);
  }

  final shortcuts2 = {
    LogicalKeySet(LogicalKeyboardKey.escape): const EscapeIntent(),
    LogicalKeySet(ctrl, LogicalKeyboardKey.tab): const SwitchTabIntent(),
    LogicalKeySet(ctrl, const LogicalKeyboardKey(digit1KeyId, debugName: 'Digit 1')):
        const TabIntent(0),
    LogicalKeySet(ctrl, LogicalKeyboardKey.digit1): const TabIntent(0),
    LogicalKeySet(ctrl, const LogicalKeyboardKey(digit1KeyId + 1, debugName: 'Digit 2')):
        const TabIntent(1),
    LogicalKeySet(ctrl, const LogicalKeyboardKey(digit1KeyId + 2, debugName: 'Digit 3')):
        const TabIntent(2),
    LogicalKeySet(ctrl, const LogicalKeyboardKey(digit1KeyId + 3, debugName: 'Digit 4')):
        const TabIntent(3),
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      excludeFromSemantics: true,
      behavior: HitTestBehavior.opaque,
      child: Consumer(builder: (context, w, _) {
        final theme = w(dynamicTheme);
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
              context.read(tabProvider).setPage(tab, isDarwin);
            }),
            SwitchTabIntent: CallbackAction(onInvoke: (_) {
              print('Switching tab');
              final tabs = context.read(tabProvider);
              tabs.setPage(
                  (tabs.page + 1) %
                      (isDarwin ? MainApp.iosTabs.length : MainApp.androidTabs.length),
                  isDarwin);
              return null;
            })
          },
          onGenerateRoute: (settings) => onGenerateRoute(settings, isDarwin),
          onUnknownRoute: (settings) => onUnknownRoute<void>(settings, isDarwin),
          onGenerateInitialRoutes: (settings) => onGenerateInitialRoutes(settings, isDarwin),
          builder: (context, child) => IfWrapper(
            condition: Responsive.isDarwin(context),
            builder: (context, child) {
              final t = Theme.of(context);
              final cupertinoOverride =
                  t.cupertinoOverrideTheme ?? const NoDefaultCupertinoThemeData();
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
            elseBuilder: (context, child) =>
                ScrollConfiguration(behavior: const NoOverscrollGlowBehavior(), child: child!),
            child: child,
          ),
          initialRoute: 'loading',
        );
      }),
    );
  }

  List<Route> onGenerateInitialRoutes(String initialRoute, bool isDarwin) {
    log('Initial route : $initialRoute');
    final uri = Uri.tryParse(initialRoute)!;

    final routes = <Route>[];

    switch (uri.path) {
      case '/route':
        routes.add(platformRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => LoadingPage(uri: uri),
          isDarwin: isDarwin,
        ));
        break;

      default:
        routes.add(platformRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const LoadingPage(),
          isDarwin: isDarwin,
        ));
    }
    return routes;
  }
}

Route<T> onUnknownRoute<T extends Object?>(RouteSettings settings, bool isDarwin) {
  reportDartError('Unknown page : `${settings.name}`', StackTrace.current,
      library: 'router', reason: 'while trying to route', showSnackbar: false);
  return MaterialPageRoute<T>(builder: (_) => PageNotFound(settings: settings));
}

Route? onGenerateRoute(RouteSettings settings, bool isDarwin) {
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
        builder: (_) => const SettingsPage(),
        fullscreenDialog: true,
        isDarwin: isDarwin,
      );
    case '/routeDetails':
      if (settings.arguments is Map) {
        final map = settings.arguments as Map?;
        return platformRoute(
          settings: settings,
          builder: (_) => RouteDetails(
            route: map!['route'] as CffRoute?,
            i: map['i'] as int?,
            doClose: true,
          ),
          isDarwin: isDarwin,
        );
      }
      break;

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
          builder: (_) => RoutePage.route(settings.arguments as LocalRoute?),
          isDarwin: isDarwin,
        );
      } else if (settings.arguments is FavoriteStop) {
        return platformRoute(
          settings: settings,
          builder: (_) => RoutePage.stop(settings.arguments as FavoriteStop?),
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

    case '/error':
    case 'error':
      return platformRoute(
        settings: settings,
        builder: (_) => ErrorPage(settings.arguments as FlutterErrorDetails?),
        isDarwin: isDarwin,
      );
  }
  return null;
}

Route<T> platformRoute<T extends Object?>({
  required Widget Function(BuildContext) builder,
  required bool isDarwin,
  RouteSettings? settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String? title,
}) {
  return isDarwin
      ? CupertinoPageRoute<T>(
          builder: builder,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
          title: title,
          maintainState: maintainState,
        )
      : MaterialPageRoute<T>(
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
  Widget buildViewportChrome(context, child, axisDirection) => child;
}
