import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:gaets_logging/logging.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/favorite_store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:theming/responsive.dart';

class QuickActionsManager {
  QuickActionsManager._();

  static const maxFavoriteRoutes = 5;
  static const maxFavoriteStops = 5;

  static final instance = QuickActionsManager._();

  bool _initialized = false;

  final log = Logger.of('QuickActionsManager');
  static const quickActions = QuickActions();
  final QuickActionsFavoriteItemsDb db = QuickActionsFavoriteItemsDb.i;

  Future<void> init() async {
    log.log('Initialize');
    await db.open();
    try {
      await quickActions.initialize(_handler);
      if (Env.quickActionsOverride != null) {
        log.log('Override quick actions with ${Env.quickActionsOverride}');
        await _handler(Env.quickActionsOverride!);
      }
      _initialized = true;
      if (_actions != null) {
        await setQuickActions(_actions!);
      }
    } on MissingPluginException {
      log.log('Unsupported for now on $platform');
    }
  }

  static const favRouteId = 'froute';
  static const favStopId = 'fstop';

  Future<void> _handler(String shortcutType) async {
    log.log('Tapped shortcut $shortcutType');

    final index = shortcutType.indexOf('_');

    final actionId = shortcutType.substring(0, index);

    if (actionId == favRouteId) {
      log.log('Tapped route $shortcutType');
      final favsDb = FavRoutesDb.i;
      await favsDb.open();

      final id = int.parse(shortcutType.substring(index + 1));
      final lr = favsDb.values.elementAt(id);

      unawaited(navigatorKey.currentState?.pushNamed('/route', arguments: lr));
    } else if (actionId == favStopId) {
      log.log('Tapped stop $shortcutType');
      final stopsDB = FavStopsDb.i;
      await stopsDB.open();

      final id = int.parse(shortcutType.substring(index + 1));
      final f2 = stopsDB.values.elementAt(id);

      unawaited(navigatorKey.currentState?.pushNamed('/route', arguments: f2));
    } else {
      log.log("Unknown shortcut '$shortcutType'");
    }
  }

  List<Favorite>? _actions;

  Future<void> setQuickActions(List<Favorite> favs) async {
    if (!isMobile) {
      log.log('Actions not supported for now on $platform');
      return;
    }
    if (!_initialized) {
      _actions = favs;
      return;
    }

    final items = <ShortcutItem>[];
    for (final fav in favs) {
      fav.when(stop: (stop, id) {
        items.add(ShortcutItem(
          type: 'stop_$id',
          localizedTitle: stop.name,
          icon: Platform.isIOS ? 'star' : 'ic_favorites_round',
        ));
      }, route: (route, id) {
        items.add(ShortcutItem(
          type: 'route_$id',
          localizedTitle: route.displayName ?? route.toPrettyString(),
          icon: Platform.isIOS ? 'route' : 'ic_route_round',
        ));
      });
    }
    try {
      await quickActions.setShortcutItems(items);
    } on MissingPluginException {
      log.log('Quick actions currently unspported on $platform');
    }
  }
}
