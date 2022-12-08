import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/favorite_store.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:theming/responsive.dart';

final quickActionsManagerProvider = Provider.autoDispose<QuickActionsManager>(
  (ref) {
    ref.keepAlive();
    return QuickActionsManager();
  },
);

class QuickActionsManager {
  final log = Logger.of('QuickActionsManager');

  late final AppLocalizations appLocalizations;

  /// This code initializes the Quick Actions plugin and overrides the
  /// Quick Actions with the value of Env.quickActionsOverride, if it is
  /// not null. It then generates the list of reorderable items from the
  /// Quick Actions database. It takes an [AppLocalizations] object as parameter
  /// because it needs to use localized strings and obtaining an instance of
  /// [AppLocalizations] requires a [BuildContext] which we don't have here.
  Future<void> init(AppLocalizations appLocalizations) async {
    log.log('Initialize');
    this.appLocalizations = appLocalizations;
    try {
      // Initialize the Quick Actions plugin.
      await const QuickActions().initialize(_handler);

      // For testing purposes, override the Quick Actions.
      if (Env.quickActionsOverride != null) {
        log.log('Overriding quick actions with ${Env.quickActionsOverride}');
        await _handler(Env.quickActionsOverride!);
      }
    } on MissingPluginException {
      log.log('Unsupported for now on $platform');
    }
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

  Future<void> setQuickActions(List<QuickActionsItem> quickActionsItems) async {
    // update the database
    if (!isMobile) {
      log.log('Actions not supported for now on $platform');
      return;
    }

    final shortcutItems = <ShortcutItem>[];
    final items = quickActionsItems
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
        stationTabsCurrentLocation: (_, __) {
          shortcutItems.add(ShortcutItem(
            type: currentLocationId,
            localizedTitle: appLocalizations.current_location,
          ));
        },
      );
    }

    log.i(
        'Setting shortcut items: ${shortcutItems.map((e) => e.toDetailedString())}');

    try {
      await const QuickActions().setShortcutItems(shortcutItems);
    } on MissingPluginException {
      log.log('Quick actions currently unspported on $platform');
    }
  }
}

extension on ShortcutItem {
  String toDetailedString() =>
      'ShortcutItem(type: $type, localizedTitle: $localizedTitle, icon: $icon)';
}
