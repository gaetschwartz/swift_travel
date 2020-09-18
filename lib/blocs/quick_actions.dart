import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/api/cff/local_route.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/main.dart';
import 'package:swiss_travel/tabs/route_tab.dart';

final quickActions = Provider<MyQuickActions>((ref) => MyQuickActions());

class MyQuickActions {
  final quickActions = QuickActions();

  Future<void> init() async {
    log("init", name: "QuickActions");
    quickActions.initialize((shortcutType) async {
      await FirebaseCrashlytics.instance
          .log("User tapped a quick action : `$shortcutType`");
      final split = shortcutType.split("_");
      if (split.first == "route") {
        log('Tapped route $shortcutType', name: "QuickActions");
        final prefs = await SharedPreferences.getInstance();
        final stringList =
            prefs.getStringList(FavoritesSharedPreferencesStore.routesKey);
        final idS = split.last;
        final id = int.parse(idS);
        final route = stringList[id];
        final lr =
            LocalRoute.fromJson(jsonDecode(route) as Map<String, dynamic>);
        navigatorKey.currentState.push(
            MaterialPageRoute(builder: (_) => SearchRoute(localRoute: lr)));
      }
    });
  }

  Future<void> setRoutes(List<LocalRoute> r) async {
    log("Set $r", name: "QuickActions");
    final shortcuts = <ShortcutItem>[];
    for (var i = 0; i < r.length; i++) {
      final route = r[i];
      shortcuts.add(ShortcutItem(
        type: 'route_$i',
        localizedTitle: route.displayName,
        icon: Platform.isIOS ? "route" : "ic_route",
      ));
    }
    await quickActions.setShortcutItems(shortcuts);
  }
}
