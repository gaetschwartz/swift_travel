import 'package:quick_actions/quick_actions.dart';
import 'package:swiss_travel/api/cff/local_route.dart';

class MyQuickActions {
  static Future<void> init() async {
    final QuickActions quickActions = QuickActions();
    quickActions.initialize((shortcutType) {
      if (shortcutType.startsWith("route_")) {
        print('The user tapped on the route : $shortcutType action.');
      }
      // More handling code...
    });
  }

  static Future<void> addNewRoute(LocalRoute route) async {
    QuickActions().setShortcutItems(<ShortcutItem>[
      ShortcutItem(
        type: 'route_${route.hashCode}',
        localizedTitle: '${route.from} → ${route.to}',
        icon: 'AppIcon',
      ),
    ]);
  }
}
