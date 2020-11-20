import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' show min;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/apis/cff/models/local_route.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';

class MyQuickActions {
  static const maxFavoriteRoutes = 5;
  static const maxFavoriteStops = 5;
  final quickActions = QuickActions();

  MyQuickActions._();
  static MyQuickActions _instance;
  // ignore: prefer_constructors_over_static_methods
  static MyQuickActions get instance => _instance ?? (_instance = MyQuickActions._());

  void init() {
    log("Initialize", name: "QuickActions");
    try {
      quickActions.initialize(_init);
    } on MissingPluginException {
      log("Unsupported for now on $platform");
    }
  }

  Future<void> _init(String shortcutType) async {
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
      final f = jsonDecode(fav) as Map<String, dynamic>;
      final f2 = FavoriteStop.fromJson(f);
      navigatorKey.currentState.push(MaterialPageRoute(builder: (_) => SearchRoute(favStop: f2)));
    }
  }

  Future<void> setActions(List<LocalRoute> routes, List<FavoriteStop> favorites) async {
    if (!isMobile) {
      log("Actions not supported for now on $platform");
    }
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
    try {
      await quickActions.setShortcutItems(shortcuts);
    } on MissingPluginException {
      log("Unsupported for now on $platform");
    }
  }
}
