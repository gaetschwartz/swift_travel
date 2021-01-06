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
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/confirmation_alert.dart';

const _tutoKey = 'hasAlreadySeenTuto';

class LoadingPage extends StatefulWidget {
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
            children: [
              SizedBox(
                height: 64,
                width: 64,
                child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(Colors.white)),
              ),
              const SizedBox(height: 32),
              const Text(
                'Loading ...',
                style: TextStyle(color: Colors.white, fontSize: 24),
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

    await showTutoIfNeeded(prefs);

    try {
      await Geolocator.requestPermission();
    } on MissingPluginException {}

    route();

    if (isMobile) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        MyQuickActions.instance.init();
        context.read(linksProvider).init(context.read(navigationAPIProvider));
      });
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
      } else {
        await FirebaseCrashlytics.instance.log('Loading page');
      }
    }

    try {
      await context.read(dynamicTheme).configure(themeConfiguration);
      await context.read(preferencesProvider).loadFromPreferences(prefs: prefs);
      await context.read(storeProvider).loadFromPreferences(prefs: prefs);
    } on Exception {
      final String data = prefs.getKeys().map((e) => '$e : ${prefs.get(e)}').join('\n');
      await confirm(
        context,
        title: const Text('Failed to load your previous settings !'),
        content: SingleChildScrollView(
          child: Text(
            'Here is what it previously was :\n$data',
            textAlign: TextAlign.center,
          ),
        ),
      );
      rethrow;
    }
  }

  Future<void> showTutoIfNeeded(SharedPreferences prefs) async {
    if (prefs.getBool(_tutoKey) != true) {
      await Navigator.of(context).pushNamed("/welcome");

      await prefs.setBool(_tutoKey, true);
    }
  }

  void route() {
    log(Env.page);
    Navigator.of(context).pushReplacementNamed(Env.page.isEmpty ? "/" : Env.page);
  }
}
