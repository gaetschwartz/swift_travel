import 'dart:async';
import 'dart:io';
import 'dart:math' show min;

import 'package:flutter/services.dart';
import 'package:gaets_logging/logging.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:theming/responsive.dart';

class QuickActionsManager {
  QuickActionsManager._();

  static const maxFavoriteRoutes = 5;
  static const maxFavoriteStops = 5;

  static final instance = QuickActionsManager._();

  bool _initialized = false;

  final log = Logger.of('QuickActionsManager');
  static const quickActions = QuickActions();

  Future<void> init() async {
    log.log('Initialize');
    try {
      await quickActions.initialize(_handler);
      if (Env.quickActionsOverride != null) {
        log.log('Override quick actions with ${Env.quickActionsOverride}');
        await _handler(Env.quickActionsOverride!);
      }
      _initialized = true;
      if (_actions != null) {
        await setActions(_actions!.first, _actions!.second);
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

  Pair<List<LocalRoute>, List<FavoriteStop>>? _actions;

  Future<void> setActions(
    List<LocalRoute> routes,
    List<FavoriteStop> stops,
  ) async {
    if (!isMobile) {
      log.log('Actions not supported for now on $platform');
      return;
    }
    if (!_initialized) {
      _actions = Pair(routes, stops);
      return;
    }
    final shortcuts = <ShortcutItem>[];

    log.log('Adding stops $stops');
    for (var i = 0; i < min(maxFavoriteStops, stops.length); i++) {
      final fav = stops[i];
      shortcuts.add(ShortcutItem(
        type: '${favStopId}_$i',
        localizedTitle: fav.stop,
        icon: Platform.isIOS ? 'star' : 'ic_favorites_round',
      ));
    }

    log.log('Adding routes $routes');
    for (var i = 0; i < min(maxFavoriteRoutes, routes.length); i++) {
      final route = routes[i];
      shortcuts.add(ShortcutItem(
        type: '${favRouteId}_$i',
        localizedTitle: route.displayName ?? 'Unnamed route $i',
        icon: Platform.isIOS ? 'route' : 'ic_route_round',
      ));
    }
    try {
      await quickActions.setShortcutItems(shortcuts);
    } on MissingPluginException {
      log.log('Quick actions currently unspported on $platform');
    }
  }
}
