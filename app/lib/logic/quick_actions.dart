import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/favorite_store.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:theming/responsive.dart';

final quickActionsManagerProvider = StateNotifierProvider.autoDispose<
    QuickActionsManager, List<QuickActionsReorderableItem>>(
  (ref) {
    ref.keepAlive();
    return QuickActionsManager();
  },
);

class QuickActionsManager
    extends StateNotifier<List<QuickActionsReorderableItem>> {
  final log = Logger.of('QuickActionsManager');

  QuickActionsManager() : super([]);

  final db = FavoritesDatabase();

  late final AppLocalizations appLocalizations;

  Future<void> init(AppLocalizations appLocalizations) async {
    log.log('Initialize');
    this.appLocalizations = appLocalizations;
    await db.open();
    try {
      await const QuickActions().initialize(_handler);
      if (Env.quickActionsOverride != null) {
        log.log('Override quick actions with ${Env.quickActionsOverride}');
        await _handler(Env.quickActionsOverride!);
      }
    } on MissingPluginException {
      log.log('Unsupported for now on $platform');
    }
    state = db.values.map(QuickActionsReorderableItem.item).toList();
  }

  static const favRouteId = 'froute';
  static const favStopId = 'fstop';
  static const currentLocationId = 'stationTabsCurrentLocation';
  static const delimiter = ',';

  Future<void> _handler(String shortcutType) async {
    log.log('Tapped shortcut $shortcutType');

    final index = shortcutType.indexOf(delimiter);

    final actionId = shortcutType.substring(0, index);

    final favsDb = FavoritesDatabase.i;
    await favsDb.open();
    if (actionId == favRouteId) {
      log.log('Tapped route $shortcutType');

      final id = int.parse(shortcutType.substring(index + 1));
      final route = favsDb.get(id);

      unawaited(
          navigatorKey.currentState?.pushNamed('/route', arguments: route));
    } else if (actionId == favStopId) {
      log.log('Tapped stop $shortcutType');

      final id = int.parse(shortcutType.substring(index + 1));
      final stop = favsDb.get(id);

      unawaited(
          navigatorKey.currentState?.pushNamed('/route', arguments: stop));
    } else {
      log.log("Unknown shortcut type: '$shortcutType'");
    }
  }

  Future<void> setQuickActions(
      List<QuickActionsReorderableItem> reoerderableItems) async {
    state = reoerderableItems;
    if (!isMobile) {
      log.log('Actions not supported for now on $platform');
      return;
    }

    final shortcutItems = <ShortcutItem>[];
    final items = reoerderableItems
        .whereType<QuickActionsFavoriteItem>()
        .map((e) => e.item)
        .where((e) => e.quickActionsIndex != null)
        .sortedBy<num>((e) => e.quickActionsIndex!);
    for (final fav in items) {
      fav.when(
        stop: (stop, id, _) {
          shortcutItems.add(ShortcutItem(
            type: [favStopId, id].join(delimiter),
            localizedTitle: stop.name,
            icon: Platform.isIOS ? 'star' : 'ic_favorites_round',
          ));
        },
        route: (route, id, _) {
          shortcutItems.add(ShortcutItem(
            type: [favRouteId, id].join(delimiter),
            localizedTitle: route.displayName ?? route.toPrettyString(),
            icon: Platform.isIOS ? 'route' : 'ic_route_round',
          ));
        },
        stationTabsCurrentLocation: (_) {
          shortcutItems.add(ShortcutItem(
            type: currentLocationId,
            localizedTitle: appLocalizations.current_location,
          ));
        },
      );
    }

    try {
      await const QuickActions().setShortcutItems(shortcutItems);
    } on MissingPluginException {
      log.log('Quick actions currently unspported on $platform');
    }
  }
}
