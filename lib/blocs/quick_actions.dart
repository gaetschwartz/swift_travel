import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:swiss_travel/api/cff/local_route.dart';

final quickActions = Provider<MyQuickActions>((ref) => MyQuickActions());

class MyQuickActions {
  final quickActions = QuickActions();

  Future<void> init() async {
    log("init", name: "QuickActions");
    quickActions.initialize((shortcutType) {
      log('Tapped route $shortcutType', name: "QuickActions");
    });
  }

  Future<void> setRoutes(List<LocalRoute> r) async {
    log("Set $r", name: "QuickActions");
    quickActions.setShortcutItems(r
        .map(
          (route) => ShortcutItem(
            type: 'route_${route.hashCode}',
            localizedTitle: route.displayName,
          ),
        )
        .toList());
  }
}
