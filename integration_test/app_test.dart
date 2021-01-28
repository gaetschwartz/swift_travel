// This is a basic Flutter integration test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pedantic/pedantic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/main.dart' as app;
import 'package:swift_travel/tabs/stations/completion_tile.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  timeDilation = 0.5;
  group('end-to-end test', () {
    setUpAll(() async {
      final preferences = await SharedPreferences.getInstance();
      await preferences.clear();
    });

    testWidgets('Full app test', (t) async {
      unawaited(app.main());
      await t.pumpAndSettle();

      await testStations(t);
      await testRoutes(t);
      await testFavourites(t);
      await testSettings(t);

      await t.idle();

      await t.verifyTickersWereDisposed();
    });
  });
}

Future testSettings(WidgetTester t) async {
  await t.tap(find.byKey(const Key('settings-button')).first);
  await t.pumpAndSettle();

  final top = find.byKey(const Key('settings-top-theme-section'));
  final bottom = find.byKey(const Key('settings-bottom-info'));
  final view = find.byKey(const Key('settings-scrollview'));
  expect(top, findsOneWidget);

  final dark = find.byKey(const Key('mode-dark'));
  final light = find.byKey(const Key('mode-light'));
  final system = find.byKey(const Key('mode-system'));

  await t.tap(dark.first);
  await t.pumpAndSettle();
  await t.tap(light.first);
  await t.pumpAndSettle();
  await t.tap(system.first);
  await t.pumpAndSettle();
  await t.tap(dark.first);
  await t.pumpAndSettle();

  final iOS = find.byKey(const Key('platform-choice-ios'));
  final android = find.byKey(const Key('platform-choice-android'));

  await t.tap(iOS.first);
  await t.pumpAndSettle();

  await t.tap(android.first);
  await t.pumpAndSettle();

  await t.tap(iOS.first);
  await t.pumpAndSettle();

  final themes = find.byKey(const Key('theme-card'));

  await t.tap(themes.last);
  await t.pumpAndSettle();

  await t.tap(themes.first);
  await t.pumpAndSettle();

  await t.tap(themes.last);
  await t.pumpAndSettle();

  await t.dragUntilVisible(bottom, view, const Offset(0, -200));
  expect(bottom, findsOneWidget);

  await wait(100);

  await t.dragUntilVisible(top, view, const Offset(0, 200));
  expect(top, findsOneWidget);

  await t.tap(find.widgetWithText(CupertinoButton, 'Close'));
  await t.pumpAndSettle();
}

Future<void> wait(int ms) => Future.delayed(Duration(milliseconds: ms));

Future testFavourites(WidgetTester t) async {
  await t.tap(find.byTooltip('Favourites').first);
  await t.pumpAndSettle();
}

Future testRoutes(WidgetTester t) async {
  await t.tap(find.byTooltip('Itinerary').first);
  await t.pumpAndSettle();
}

Future testStations(WidgetTester t) async {
  final field = find.byKey(const Key('stations-textfield'));

  await t.enterText(field, 'Bern');

  await t.pumpAndSettle();

  final tile = find.byType(CffCompletionTile).first;

  await t.tap(tile);

  await t.pumpAndSettle();

  final conn = find.byType(ConnectionTile).first;

  await t.tap(conn);

  await t.pumpAndSettle();

  await t.tap(find.byType(BackButton).first);
  await t.pumpAndSettle();
  await t.tap(find.byType(BackButton).first);
  await t.pumpAndSettle();
}
