// Imports the Flutter Driver API.
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/search/search.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('main', () {
    testWidgets(
      'main tab',
      (t) async {
        await t.pumpAndSettle();

        print('Tapping first textfield');
        final tapField = find.byKey(RoutePageState.routeFromTextfieldKeyTap);
        await t.tap(tapField);
        await t.pumpAndSettle();

        print('Entering text in first textfield');
        final field = find.byKey(RoutePageState.routeFromTextfieldKey);
        await t.enterText(field, 'Genève');
        await t.pumpAndSettle();
        final suggested = find.byType(SuggestedTile).last;
        await t.tap(suggested);
        await t.pumpAndSettle();

        print('Tapping second textfield');
        final tapField2 = find.byKey(RoutePageState.routeToTextfieldKeyTap);
        await t.tap(tapField2);
        await t.pumpAndSettle();

        print('Entering text in second textfield');
        final field2 = find.byKey(RoutePageState.routeToTextfieldKey);
        await t.enterText(field2, 'Lausanne');
        await t.pumpAndSettle();
        await t.tap(suggested);
        await t.pumpAndSettle();

        print('Looking for route tile');
        final tile = find.byType(RouteTile).first;
        final text = find.text('Genève, Cornavin');
        expect(tile, findsOneWidget);
        expect(text.first, findsOneWidget);
        print('Found it, tapping the tile...');

        await t.tap(tile);
        await t.pumpAndSettle();

        final localizations = await AppLocalizations.delegate.load(const Locale('en'));
        expect(find.text(localizations.tabs_route), findsOneWidget);
        print('We are in the route details page');

        navigatorKey.currentState!.pop();
        await t.pumpAndSettle();
        print('We are back');

        expect(tile, findsOneWidget);
        expect(text.first, findsOneWidget);
        await t.idle();
      },
      skip: true,
    );
  });
}
