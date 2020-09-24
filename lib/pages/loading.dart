import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/blocs/preferences.dart';
import 'package:swiss_travel/blocs/quick_actions.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/pages/tuto.dart';
import 'package:swiss_travel/utils/theme.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

import 'home_page.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => init());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const SizedBox(
        height: 64,
        width: 64,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }

  Future<void> init() async {
    if (kDebugMode) {
      log("Disabling crash reports in debug mode", name: "Loading");
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await FirebaseCrashlytics.instance.log("Loading page");
    }

    await context.read(dynamicTheme).configure(themeConfiguration);
    final prefs = await SharedPreferences.getInstance();
    await context.read(mapsAppProvider).loadFromPreferences(prefs: prefs);
    await context.read(storeProvider).loadFromPreferences(prefs: prefs);
    if (kDebugMode || prefs.getBool("hasAlreadySeenTuto") != true) {
      await Navigator.of(context).push(MaterialPageRoute(builder: (_) => Tuto()));

      await prefs.setBool("hasAlreadySeenTuto", true);
    }

    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MyHomePage()));

    await context.read(quickActions).init();
  }
}
