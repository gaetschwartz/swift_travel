import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/blocs/links.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/blocs/quick_actions.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/welcome.dart';
import 'package:swift_travel/theme.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/confirmation_alert.dart';

import 'home_page.dart';

const _tutoKey = "hasAlreadySeenTuto";

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controller2;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    if (const String.fromEnvironment("PAGE") != "loading") {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) => init());
    }

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller2 = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _animation = Tween<double>(begin: 0, end: 2)
        .animate(CurveTween(curve: Curves.easeInOutCubic).animate(_controller));

    _controller.repeat();
    _controller2.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
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
                child: RotationTransition(
                  turns: _animation,
                  child: const Icon(
                    Icons.train,
                    size: 64,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Loading ...",
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

    await Future.wait([initSettings(prefs), Future.delayed(const Duration(seconds: 1))]);

    await showTutoIfNeeded(prefs);

    route();

    if (isMobile) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        MyQuickActions.instance.init();
        context.read(linksProvider).init(context.read(navigationAPIProvider));
      });
    }
  }

  Future<void> initSettings(SharedPreferences prefs) async {
    if (const bool.fromEnvironment("CORRUPT")) {
      await prefs.setStringList(FavoritesSharedPreferencesStore.routesKey, ["[", "}"]);
    }

    if (isMobile) {
      if (kDebugMode) {
        log("Disabling crash reports in debug mode", name: "Loading");
        await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      } else {
        await FirebaseCrashlytics.instance.log("Loading page");
      }
    }

    try {
      await context.read(dynamicTheme).configure(themeConfiguration);
      await context.read(preferencesProvider).loadFromPreferences(prefs: prefs);
      await context.read(storeProvider).loadFromPreferences(prefs: prefs);
    } on Exception {
      final String data = prefs.getKeys().map((e) => "$e : ${prefs.get(e)}").join("\n");
      await confirm(
        context,
        title: const Text("Failed to load your previous settings !"),
        content: SingleChildScrollView(
          child: Text(
            "Here is what it previously was :\n$data",
            textAlign: TextAlign.center,
          ),
        ),
      );
      rethrow;
    }
  }

  Future<void> showTutoIfNeeded(SharedPreferences prefs) async {
    if (prefs.getBool(_tutoKey) != true) {
      await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WelcomePage()));

      await prefs.setBool(_tutoKey, true);
    }
  }

  void route() {
    const String page = String.fromEnvironment("PAGE");
    log(page);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => pagesMap[page] ?? const MyHomePage(),
      ),
    );
  }
}
