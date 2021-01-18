import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/blocs/links.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/blocs/quick_actions.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dynamic_theme.dart';

const _tutoKey = 'hasAlreadySeenTuto';

class LoadingPage extends StatefulWidget {
  const LoadingPage({this.uri});

  final Uri uri;

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TickerProviderStateMixin {
  AnimationController _controller2;

  @override
  void initState() {
    super.initState();

    if (Env.page != 'loading') {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) => init());
    }

    _controller2 = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _controller2.forward();
  }

  @override
  void dispose() {
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SizedBox(
        width: double.infinity,
        child: FadeTransition(
          opacity: _controller2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 64,
                width: 64,
                child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(Colors.white)),
              ),
              SizedBox(height: 32),
              Text(
                'Loading ...',
                style: TextStyle(color: Colors.white, fontSize: 32),
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
    } on MissingPluginException catch (_) {}

    await showTutoIfNeeded(prefs);

    await route();

    if (isMobile) {
      MyQuickActions.instance.init();
      context.read(linksProvider).init(context.read(navigationAPIProvider));
    }
  }

  Future<void> initSettings(SharedPreferences prefs) async {
    if (Env.corruptedFavorites) {
      await prefs.setStringList(FavoritesSharedPreferencesStore.routesKey, ['[', '}']);
    }

    if (isMobile) {
      if (kDebugMode) {
        log('Disabling crash reports in debug mode', name: 'Loading');
        await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      }
    }

    try {
      await context.read(dynamicTheme).configure(themeConfiguration);
      await context.read(preferencesProvider).loadFromPreferences(prefs: prefs);
      await context.read(storeProvider).loadFromPreferences(prefs: prefs);
    } on Exception catch (e, s) {
      reportDartError(e, s, name: "loading", reason: "while loading");
      final bool delete = await confirm(
        context,
        title: const Text('Failed to load your previous settings !'),
        content: const SingleChildScrollView(
          child: Text(
            'We are very sorry for this inconvenience. Reset settings ?',
            textAlign: TextAlign.center,
          ),
        ),
      );
      if (delete) await prefs.clear();
      // ignore: avoid_catching_errors
    } on Error catch (e) {
      reportDartError(e, e.stackTrace, name: "loading", reason: "while loading");

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
      if (delete) await prefs.clear();
    }
  }

  Future<void> showTutoIfNeeded(SharedPreferences prefs) async {
    if (prefs.getBool(_tutoKey) != true) {
      await Navigator.of(context).pushNamed("/welcome");

      await prefs.setBool(_tutoKey, true);
    }
  }

  Future<void> route() async {
    log(Env.page);
    if (widget.uri != null) {
      try {
        final args =
            await DeepLinkBloc.parseRouteArguments(widget.uri, context.read(navigationAPIProvider));
        Navigator.of(context)
          ..pushReplacementNamed("/")
          ..pushNamed("/routeDetails", arguments: args);
      } on Exception catch (e, s) {
        log("", error: e, stackTrace: s);
        Navigator.of(context).pushReplacementNamed(Env.page.isEmpty ? "/" : Env.page);
      }
    } else {
      Navigator.of(context).pushReplacementNamed(Env.page.isEmpty ? "/" : Env.page);
    }
  }
}
