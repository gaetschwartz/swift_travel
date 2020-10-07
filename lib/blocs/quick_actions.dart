import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' show min;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/api/cff/models/favorite_stop.dart';
import 'package:swiss_travel/api/cff/models/local_route.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/main.dart';
import 'package:swiss_travel/tabs/routes/route_tab.dart';

final quickActions = Provider<MyQuickActions>((ref) => MyQuickActions());

class MyQuickActions {
  static const maxFavoriteRoutes = 5;
  static const maxFavoriteStops = 5;
  final quickActions = QuickActions();

  void init() {
    log("Initialize", name: "QuickActions");
    quickActions.initialize((shortcutType) async {
      await FirebaseCrashlytics.instance.log("User tapped a quick action : `$shortcutType`");
      log('Tapped shortcut $shortcutType', name: "QuickActions");
      final split = shortcutType.split("_");
      final first = split.first;
      if (first == "route") {
        log('Tapped route $shortcutType', name: "QuickActions");
        final prefs = await SharedPreferences.getInstance();
        final stringList = prefs.getStringList(FavoritesSharedPreferencesStore.routesKey);
        final idS = split.last;
        final id = int.parse(idS);
        final route = stringList[id];
        final lr = LocalRoute.fromJson(jsonDecode(route) as Map<String, dynamic>);
        navigatorKey.currentState
            .push(MaterialPageRoute(builder: (_) => SearchRoute(localRoute: lr)));
      } else if (first == "fav") {
        log('Tapped fav $shortcutType', name: "QuickActions");
        final prefs = await SharedPreferences.getInstance();
        final stringList = prefs.getStringList(FavoritesSharedPreferencesStore.stopsKey);
        final idS = split.last;
        final id = int.parse(idS);
        final fav = stringList[id];
        navigatorKey.currentState
            .push(MaterialPageRoute(builder: (_) => SearchRoute(destination: fav)));
      }
    });
  }

  Future<void> setActions(List<LocalRoute> routes, List<FavoriteStop> favorites) async {
    final List<ShortcutItem> shortcuts = [];

    log("Add favorites $favorites", name: "QuickActions");
    for (var i = 0; i < min(maxFavoriteStops, favorites.length); i++) {
      final fav = favorites[i];
      shortcuts.add(ShortcutItem(
        type: 'fav_$i',
        localizedTitle: fav.stop,
        icon: Platform.isIOS ? "star" : "ic_favorites_round",
      ));
    }

    log("Add routes $routes", name: "QuickActions");
    for (var i = 0; i < min(maxFavoriteRoutes, routes.length); i++) {
      final route = routes[i];
      shortcuts.add(ShortcutItem(
        type: 'route_$i',
        localizedTitle: route.displayName,
        icon: Platform.isIOS ? "route" : "ic_route_round",
      ));
    }
    await quickActions.setShortcutItems(shortcuts);
  }
}
