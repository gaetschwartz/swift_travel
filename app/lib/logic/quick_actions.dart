import 'dart:developer';
import 'dart:io';
import 'dart:math' show min;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:theming/responsive.dart';

class MyQuickActions {
  MyQuickActions._();

  static const maxFavoriteRoutes = 5;
  static const maxFavoriteStops = 5;

  static late final i = MyQuickActions._();

  bool _debugInitialized = false;

  void init() {
    log('Initialize', name: 'QuickActions');
    try {
      const QuickActions().initialize(_init);
    } on MissingPluginException {
      log('Unsupported for now on $platform');
      _debugInitialized = true;
    }
  }

  Future<void> _init(String shortcutType) async {
    assert(!_debugInitialized, "Quick Actions aren't initialized.");
    await FirebaseCrashlytics.instance.log('User tapped a quick action : `$shortcutType`');
    log('Tapped shortcut $shortcutType', name: 'QuickActions');

    final split = shortcutType.split('_');

    final id = int.parse(split.last);

    final actionId = split.first;

    if (actionId == 'route') {
      log('Tapped route $shortcutType', name: 'QuickActions');
      final favsDb = FavRoutesDb.i;
      await favsDb.open();

      final lr = favsDb.values.elementAt(id);

      await navigatorKey.currentState!.pushNamed('/route', arguments: lr);
    } else if (actionId == 'fav') {
      log('Tapped fav $shortcutType', name: 'QuickActions');
      final stopsDB = FavStopsDb.i;
      await stopsDB.open();

      final f2 = stopsDB.values.elementAt(id);

      await navigatorKey.currentState!.pushNamed('/route', arguments: f2);
    }
  }

  Future<void> setActions(List<LocalRoute> routes, List<FavoriteStop> favorites) async {
    if (!isMobile) {
      print('Actions not supported for now on $platform');
      return;
    }
    final shortcuts = <ShortcutItem>[];

    log('Add favorites $favorites', name: 'QuickActions');
    for (var i = 0; i < min(maxFavoriteStops, favorites.length); i++) {
      final fav = favorites[i];
      shortcuts.add(ShortcutItem(
        type: 'fav_$i',
        localizedTitle: fav.stop,
        icon: Platform.isIOS ? 'star' : 'ic_favorites_round',
      ));
    }

    log('Add routes $routes', name: 'QuickActions');
    for (var i = 0; i < min(maxFavoriteRoutes, routes.length); i++) {
      final route = routes[i];
      shortcuts.add(ShortcutItem(
        type: 'route_$i',
        localizedTitle: route.displayName ?? 'Unnamed route $i',
        icon: Platform.isIOS ? 'route' : 'ic_route_round',
      ));
    }
    try {
      await const QuickActions().setShortcutItems(shortcuts);
    } on MissingPluginException catch (e, s) {
      log('Unsupported for now on $platform', stackTrace: s);
    }
  }
}
