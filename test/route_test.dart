import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:swift_travel/apis/search.ch/models/cff_route.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/db/database.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/states/route_states.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';

import 'apis_test.dart';
import 'swift_travel_test.dart';

class MockFetcher extends FetcherBase {
  @override
  Future<void> fetch(ProviderReference ref) async {
    state = RouteStates.routes(CffRoute.fromJson(mockRoute!));
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final dir = path.join(testResultFolder, 'route_tab');
  group('route tab >', () {
    setUpAll(() async {
      Hive.init(dir);
    });

    tearDown(() async {
      await Hive.deleteBoxFromDisk(RouteHistoryRepository.boxKey);
    });

    _testRouteTab();
  });
}

Future<void> _testRouteTab() async {
  testWidgets(
    'main tab',
    (t) async {
      await t.pumpWidget(ProviderScope(
          overrides: [
            navigationAPIProvider.overrideWithValue(MockNavigationApi()),
            fetcherProvider.overrideWithValue(MockFetcher()),
          ],
          child: MaterialApp(
            home: const RoutePage(),
            navigatorKey: navigatorKey,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
          )));
      await t.pumpAndSettle();

      final field = find.byKey(const Key('route-first-textfield-key'));
      await t.enterText(field, 'Genève');
      await t.pumpAndSettle();

      final field2 = find.byKey(const Key('route-second-textfield-key'));
      await t.enterText(field2, 'Lausanne');
      await t.pumpAndSettle();

      final tile = find.byType(RouteTile).first;
      final text = find.text('Genève, Cornavin');
      expect(tile, findsOneWidget);
      expect(text, findsOneWidget);

      await t.tap(tile);
      await t.pumpAndSettle();

      expect(find.text('Itinerary'), findsOneWidget);

      navigatorKey.currentState!.pop();
      await t.pumpAndSettle();

      expect(tile, findsOneWidget);
      expect(text, findsOneWidget);
      print('test done');

      await t.idle();

      await Hive.close();
    },
  );
}
