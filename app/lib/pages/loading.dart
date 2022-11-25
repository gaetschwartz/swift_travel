// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/cache.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/logic/links.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/logic/quick_actions.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/routes/details/route_details.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';

const _tutoKey = 'hasAlreadySeenTuto';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({this.uri, super.key});

  final Uri? uri;

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  final log = Logger.of('LoadingPage');

  @override
  void initState() {
    super.initState();

    if (Env.page != 'loading') {
      WidgetsBinding.instance.addPostFrameCallback((_) => unawaited(init()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }

  Future<void> init() async {
    await initSettings();

    try {
      await Geolocator.requestPermission();
    } on MissingPluginException {
      ignoreError();
    }

    unawaited(route());

    if (isMobile) {
      await QuickActionsManager.instance.init();

      await ref.read(linksProvider).init(
            onNewRoute: (p) => navigatorKey.currentState?.push(
              PlatformPageRoute(
                builder: (_) => RouteDetails(
                  route: p.first,
                  i: p.second,
                  doShowCloseButton: true,
                ),
              ),
            ),
          );
    }
  }

  Future<void> initSettings() async {
    final prefs = await SharedPreferences.getInstance();

    await initHive();

    try {
      await Future.wait([
        RouteHistoryRepository.instance.open(),
        LineCacheRepository.instance.open(),
        ref.read(favoritesStoreProvider).init(),
        DynamicTheme.of(context).configure(themeConfiguration),
      ]);
      await ref.read(preferencesProvider).loadFromPreferences(prefs: prefs);
    } on Exception catch (e, s) {
      await failedToLoadSettings(e, s, prefs);
      // ignore: avoid_catching_errors
    } on Error catch (e, s) {
      await failedToLoadSettings(e, s, prefs);
    }
  }

  Future<void> failedToLoadSettings(
      Object e, StackTrace s, SharedPreferences prefs) async {
    reportDartError(e, s, library: 'loading', reason: 'while loading');
    final delete = await confirm(
      context,
      title: const Text('Failed to load your previous settings !'),
      content: const SingleChildScrollView(
        child: Text(
          'We are very sorry for this inconvenience. Reset settings ?',
          textAlign: TextAlign.center,
        ),
      ),
    );
    if (delete) {
      await prefs.clear();
    }
  }

  Future<void> initHive() async {
    if (!kIsWeb) {
      final appDir = await getApplicationPath();
      final finalPath = await getHivePathOf(appDir, const ['hive_data']);
      try {
        Hive.init(finalPath);
      } finally {}
    }
  }

  Future<String> getHivePathOf(Directory? appDir,
      [List<String> paths = const []]) async {
    if (appDir == null) {
      throw Exception('Failed to get application path.');
    }

    final finalPath = path.joinAll([appDir.path, ...paths]);
    return finalPath;
  }

  Future<Directory?> getApplicationPath() async {
    if (Platform.isWindows || Platform.isLinux) {
      return getApplicationSupportDirectory();
    } else if (Platform.isIOS || Platform.isMacOS) {
      return getLibraryDirectory();
    } else if (Platform.isAndroid) {
      return getExternalStorageDirectory();
    }
    return null;
  }

  Future<void> showTutoIfNeeded(SharedPreferences prefs) async {
    if (prefs.getBool(_tutoKey) != true) {
      await Navigator.of(context).pushNamed('/welcome');

      await prefs.setBool(_tutoKey, true);
    }
  }

  Future<void> route() async {
    if (widget.uri != null) {
      try {
        final args = await DeepLinkManager.parseRouteArguments(
            widget.uri!, ref.read(navigationAPIProvider));
        await Navigator.of(context).pushNamed('/routeDetails', arguments: args);
      } on Exception catch (e, s) {
        log.log(e);
        debugPrintStack(stackTrace: s);
        return _routeToDefault();
      }
    } else {
      return _routeToDefault();
    }
  }

  Future<void> _routeToDefault() {
    if (Env.page.isNotEmpty) {
      log.log('Page: ${Env.page}');
    }

    if (Env.page.isEmpty) {
      return Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          settings: const RouteSettings(name: '/'),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const TabView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      );
    } else {
      return Navigator.of(context).pushReplacementNamed(Env.page);
    }
  }
}
