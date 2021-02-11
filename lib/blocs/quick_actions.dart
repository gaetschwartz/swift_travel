import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' show min;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';

class MyQuickActions {
  static const maxFavoriteRoutes = 5;
  static const maxFavoriteStops = 5;
  final quickActions = QuickActions();

  MyQuickActions._();
  static MyQuickActions? _instance;
  // ignore: prefer_constructors_over_static_methods
  static MyQuickActions get instance => _instance ?? (_instance = MyQuickActions._());

  bool _debugInitialized = false;

  void init() {
    log('Initialize', name: 'QuickActions');
    try {
      quickActions.initialize(_init);
    } on MissingPluginException {
      log('Unsupported for now on $platform');
      _debugInitialized = true;
    }
  }

  Future<void> _init(String shortcutType) async {
    assert(!_debugInitialized, 'Quick Actions aren\'t initialized.');
    await FirebaseCrashlytics.instance.log('User tapped a quick action : `$shortcutType`');
    log('Tapped shortcut $shortcutType', name: 'QuickActions');
    final split = shortcutType.split('_');
    final first = split.first;
    if (first == 'route') {
      log('Tapped route $shortcutType', name: 'QuickActions');
      final prefs = await SharedPreferences.getInstance();
      final stringList = prefs.getStringList(FavoritesSharedPreferencesStore.routesKey)!;
      final idS = split.last;
      final id = int.parse(idS);
      final route = stringList[id];
      final lr = LocalRoute.fromJson(jsonDecode(route) as Map<String, dynamic>);
      await navigatorKey.currentState!.pushNamed('/route', arguments: lr);
    } else if (first == 'fav') {
      log('Tapped fav $shortcutType', name: 'QuickActions');
      final prefs = await SharedPreferences.getInstance();
      final stringList = prefs.getStringList(FavoritesSharedPreferencesStore.stopsKey)!;
      final idS = split.last;
      final id = int.parse(idS);
      final fav = stringList[id];
      final f = jsonDecode(fav) as Map<String, dynamic>;
      final f2 = FavoriteStop.fromJson(f);
      await navigatorKey.currentState!.pushNamed('/route', arguments: f2);
    }
  }

  Future<void> setActions(List<LocalRoute> routes, List<FavoriteStop?> favorites) async {
    if (!isMobile) {
      log('Actions not supported for now on $platform');
    }
    final shortcuts = <ShortcutItem>[];

    log('Add favorites $favorites', name: 'QuickActions');
    for (var i = 0; i < min(maxFavoriteStops, favorites.length); i++) {
      final fav = favorites[i]!;
      shortcuts.add(ShortcutItem(
        type: 'fav_$i',
        localizedTitle: fav.stop,
        icon: !kIsWeb && Platform.isIOS ? 'star' : 'ic_favorites_round',
      ));
    }

    log('Add routes $routes', name: 'QuickActions');
    for (var i = 0; i < min(maxFavoriteRoutes, routes.length); i++) {
      final route = routes[i];
      shortcuts.add(ShortcutItem(
        type: 'route_$i',
        localizedTitle: route.displayName!,
        icon: !kIsWeb && Platform.isIOS ? 'route' : 'ic_route_round',
      ));
    }
    try {
      await quickActions.setShortcutItems(shortcuts);
    } on MissingPluginException {
      log('Unsupported for now on $platform');
    }
  }
}
