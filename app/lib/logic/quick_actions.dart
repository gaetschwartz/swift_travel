import 'dart:io';
import 'dart:math' show min;

import 'package:flutter/services.dart';
import 'package:gaets_logging/logging.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:theming/responsive.dart';

class MyQuickActions {
  MyQuickActions._();

  static const maxFavoriteRoutes = 5;
  static const maxFavoriteStops = 5;

  static final i = MyQuickActions._();

  bool _debugInitialized = false;

  Future<void> init() async {
    log.log('Initialize', channel: 'QuickActions');
    try {
      await const QuickActions().initialize(_init);
    } on MissingPluginException {
      log.log('Unsupported for now on $platform');
      _debugInitialized = true;
    }
  }

  Future<void> _init(String shortcutType) async {
    assert(!_debugInitialized, "Quick Actions aren't initialized.");

    log.log('Tapped shortcut $shortcutType', channel: 'QuickActions');

    final split = shortcutType.split('_');

    final id = int.parse(split.last);

    final actionId = split.first;

    if (actionId == 'route') {
      log.log('Tapped route $shortcutType', channel: 'QuickActions');
      final favsDb = FavRoutesDb.i;
      await favsDb.open();

      final lr = favsDb.values.elementAt(id);

      await navigatorKey.currentState!.pushNamed('/route', arguments: lr);
    } else if (actionId == 'fav') {
      log.log('Tapped fav $shortcutType', channel: 'QuickActions');
      final stopsDB = FavStopsDb.i;
      await stopsDB.open();

      final f2 = stopsDB.values.elementAt(id);

      await navigatorKey.currentState!.pushNamed('/route', arguments: f2);
    }
  }

  Future<void> setActions(
      List<LocalRoute> routes, List<FavoriteStop> favorites) async {
    if (!isMobile) {
      log.log('Actions not supported for now on $platform');
      return;
    }
    final shortcuts = <ShortcutItem>[];

    log.log('Add favorites $favorites', channel: 'QuickActions');
    for (var i = 0; i < min(maxFavoriteStops, favorites.length); i++) {
      final fav = favorites[i];
      shortcuts.add(ShortcutItem(
        type: 'fav_$i',
        localizedTitle: fav.stop,
        icon: Platform.isIOS ? 'star' : 'ic_favorites_round',
      ));
    }

    log.log('Add routes $routes', channel: 'QuickActions');
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
    } on MissingPluginException {
      log.log('Quick actions currently unspported on $platform');
    }
  }
}
