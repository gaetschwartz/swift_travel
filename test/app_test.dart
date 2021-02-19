import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/states/route_states.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';
import 'package:theming/dynamic_theme.dart';

import 'apis_test.dart';

class MockFetcher extends FetcherBase {
  @override
  Future<void> fetch(ProviderReference ref) async {
    state = RouteStates(CffRoute.fromJson(mockRoute!));
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('route tab >', () {
    setUpAll(() async {
      final temp = await getTemporaryDirectory();
      final dir = path.join(temp!.path, 'swift_travel', 'test_results', 'route_tab');
      Hive.init(dir);
    });

    tearDown(() async {
      await Hive.deleteBoxFromDisk(RouteHistoryRepository.i.boxKey);
    });

    _testRouteTab();
  });
}

Future<void> _testRouteTab() async {
  testWidgets(
    'main tab',
    (t) async {
      await t.pumpWidget(DynamicTheme(
        theme: DynamicThemeData(),
        child: ProviderScope(
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
            )),
      ));
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
      expect(text.first, findsOneWidget);

      await t.tap(tile);
      await t.pumpAndSettle();

      expect(find.text('Itinerary'), findsOneWidget);

      navigatorKey.currentState!.pop();
      await t.pumpAndSettle();

      expect(tile, findsOneWidget);
      expect(text.first, findsOneWidget);

      await t.idle();

      await Hive.close();
    },
  );
}
