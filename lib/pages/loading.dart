import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/api/cff/models/cff_route.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/links.dart';
import 'package:swiss_travel/blocs/preferences.dart';
import 'package:swiss_travel/blocs/quick_actions.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/main.dart';
import 'package:swiss_travel/pages/welcome.dart';
import 'package:swiss_travel/tabs/routes/details/route_details.dart';
import 'package:swiss_travel/utils/theme.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/confirmation_alert.dart';
import 'package:utils/dialogs/loading_dialog.dart';

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
    if (isSupported) {
      if (kDebugMode) {
        log("Disabling crash reports in debug mode", name: "Loading");
        await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      } else {
        await FirebaseCrashlytics.instance.log("Loading page");
      }
    }

    final prefs = await SharedPreferences.getInstance();
    try {
      await context.read(dynamicTheme).configure(themeConfiguration);
      await context.read(mapsAppProvider).loadFromPreferences(prefs: prefs);
      await context.read(storeProvider).loadFromPreferences(prefs: prefs);
    } on Exception {
      await confirm(
        context,
        title: const Text("Failed to load your previous settings !"),
        content: const Text("We are very sorry this happened !"),
      );
      rethrow;
    }
    if (prefs.getBool("hasAlreadySeenTuto") != true) {
      await Navigator.of(context).push(MaterialPageRoute(builder: (_) => WelcomePage()));

      await prefs.setBool("hasAlreadySeenTuto", true);
    }

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MyHomePage()));
    final cff = context.read(cffProvider);

    if (isSupported) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read(quickActions).init();
        context.read(linksProvider).init((link) async {
          Uri uri;
          try {
            uri = Uri.parse(link);
          } on Exception catch (e, s) {
            FirebaseCrashlytics.instance.recordError(e, s, printDetails: true);
            return;
          }
          if (uri.host == "route") {
            log("We have a new route");
            if (uri.queryParameters.containsKey("from") && uri.queryParameters.containsKey("to")) {
              log("Valid route");
              final Map<String, String> params = Map.from(uri.queryParameters);
              if (params.containsKey("i")) {
                params.remove("i");
                final qUri =
                    Uri.https("timetable.search.ch", "api/route.json", uri.queryParameters);
                log(qUri.toString());
                final CffRoute route = await load<CffRoute>(navigatorKey.currentContext,
                    future: () => cff.rawRoute(qUri.toString()),
                    title: const Text("Getting route infos ..."));
                final i = int.parse(uri.queryParameters["i"]);
                navigatorKey.currentState
                    .push(MaterialPageRoute(builder: (_) => RouteDetails(route: route, i: i)));
              }
            }
          }
        });
      });
    }
  }
}
