import 'dart:async';
import 'dart:io';

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

  final QuickActionsFavoriteItemsDb db = QuickActionsFavoriteItemsDb.i;

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
    state = db.values.toList();
  }

  static const favRouteId = 'froute';
  static const favStopId = 'fstop';
  static const currentLocationId = 'stationTabsCurrentLocation';
  static const delimiter = ',';

  Future<void> _handler(String shortcutType) async {
    log.log('Tapped shortcut $shortcutType');

    final index = shortcutType.indexOf(delimiter);

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

  Future<void> setQuickActions(List<QuickActionsReorderableItem> items) async {
    state = items;
    if (!isMobile) {
      log.log('Actions not supported for now on $platform');
      return;
    }

    final shortcutItems = <ShortcutItem>[];
    for (final item in items) {
      item.when(
        item: (fav, p) {
          fav.when(stop: (stop, id) {
            shortcutItems.add(ShortcutItem(
              type: [favStopId, id].join(delimiter),
              localizedTitle: stop.name,
              icon: Platform.isIOS ? 'star' : 'ic_favorites_round',
            ));
          }, route: (route, id) {
            shortcutItems.add(ShortcutItem(
              type: [favRouteId, id].join(delimiter),
              localizedTitle: route.displayName ?? route.toPrettyString(),
              icon: Platform.isIOS ? 'route' : 'ic_route_round',
            ));
          }, stationTabsCurrentLocation: () {
            shortcutItems.add(ShortcutItem(
              type: currentLocationId,
              localizedTitle: appLocalizations.current_location,
            ));
          });
        },
        divider: () {},
      );
    }
    try {
      await const QuickActions().setShortcutItems(shortcutItems);
    } on MissingPluginException {
      log.log('Quick actions currently unspported on $platform');
    }
  }
}
