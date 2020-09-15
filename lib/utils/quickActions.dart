import 'dart:developer';

import 'package:quick_actions/quick_actions.dart';
import 'package:swiss_travel/api/cff/local_route.dart';

mixin MyQuickActions {
  static final quickActions = QuickActions();
  static Future<void> init() async {
    log("init", name: "QuickActions");
    quickActions.initialize((shortcutType) {
      print('The user tapped on the route : $shortcutType action.');
    });
  }

  static Future<void> addNewRoute(LocalRoute route) async {
    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
        type: 'route_${route.hashCode}',
        localizedTitle: '${route.from} → ${route.to}',
        icon: 'AppIcon',
      ),
    ]);
  }
}
