import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:pedantic/pedantic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/db/cache.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/logic/links.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/logic/preferences.dart';
import 'package:swift_travel/logic/quick_actions.dart';
import 'package:swift_travel/logic/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/routes/details/route_details.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';

const _tutoKey = 'hasAlreadySeenTuto';

class LoadingPage extends StatefulWidget {
  const LoadingPage({this.uri, Key? key}) : super(key: key);

  final Uri? uri;

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TickerProviderStateMixin {
  late final _controller =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  bool isDarwin = false;

  @override
  void initState() {
    super.initState();

    if (Env.page != 'loading') {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => init());
    }

    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isDarwin = Responsive.isDarwin(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: FadeTransition(
          opacity: _controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 64,
                width: 64,
                child: CircularProgressIndicator.adaptive(),
              ),
              SizedBox(height: 32),
              Text(
                'Loading ...',
                style: TextStyle(fontSize: 32),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    await initSettings(prefs);

    try {
      await Geolocator.requestPermission();
    } catch (_) {}

    unawaited(route());

    if (isMobile) {
      MyQuickActions.i.init();
      await context.read(linksProvider).init(
            push: (p) => Navigator.of(context).push(
              platformRoute(
                builder: (_) => RouteDetails(
                  route: p.first,
                  i: p.second,
                  doShowCloseButton: true,
                ),
                isDarwin: isDarwin,
              ),
            ),
            getApi: () => context.read(navigationAPIProvider),
          );
    }
  }

  Future<void> initSettings(SharedPreferences prefs) async {
    await initHive();
    await Future.wait([
      RouteHistoryRepository.i.open(),
      LineCache.i.open(),
    ]);

    try {
      await DynamicTheme.of(context).configure(themeConfiguration);
      await context.read(preferencesProvider).loadFromPreferences(prefs: prefs);
      await context.read(storeProvider).loadFromPreferences(prefs: prefs);
    } on Exception catch (e, s) {
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
      // ignore: avoid_catching_errors
    } on Error catch (e) {
      reportDartError(e, e.stackTrace, library: 'loading', reason: 'while loading');

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
  }

  Future<void> initHive() async {
    if (!kIsWeb) {
      final appDir = await getApplicationPath();
      final finalPath = await getHivePathOf(appDir);
      Hive.init(finalPath);
    }
  }

  Future<void> showTutoIfNeeded(SharedPreferences prefs) async {
    if (prefs.getBool(_tutoKey) != true) {
      await Navigator.of(context).pushNamed('/welcome');

      await prefs.setBool(_tutoKey, true);
    }
  }

  Future<void> route() async {
    log(Env.page);
    if (widget.uri != null) {
      try {
        final args = await DeepLinkBloc.parseRouteArguments(
            widget.uri!, context.read(navigationAPIProvider));
        final nav = Navigator.of(context);
        unawaited(nav.pushReplacementNamed('/'));
        unawaited(nav.pushNamed('/routeDetails', arguments: args));
      } on Exception catch (e, s) {
        log('', error: e, stackTrace: s);
        return _routeToDefault();
      }
    } else {
      return _routeToDefault();
    }
  }

  Future<void> _routeToDefault() {
    if (Env.page.isEmpty) {
      return Navigator.of(context).pushReplacement(
        platformRoute(
          builder: (context) => const MainApp(),
          isDarwin: isDarwin,
          settings: const RouteSettings(name: '/'),
        ),
      );
    } else {
      return Navigator.of(context).pushReplacementNamed(Env.page.isEmpty ? '/' : Env.page);
    }
  }
}

Future<String> getHivePathOf(Directory? appDir, [List<String> paths = const ['hive_data']]) async {
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
}
