import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/links.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/states/route_states.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';
import 'package:swift_travel/utils/predict/predict.dart';
import 'package:swift_travel/utils/route_uri.dart';
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
      final dir = path.join(temp.path, 'swift_travel', 'test_results', 'route_tab');
      Hive.init(dir);
    });

    tearDown(() async {
      await Hive.deleteBoxFromDisk(RouteHistoryRepository.i.boxKey);
    });

    _testRouteTab();

    test('loading page', () async {
// Register the mock handler.
      final uri = Uri.parse(
        'https://travel.gaetanschwartz.com/route'
        '?fr=Universit%C3%A9+populaire+du+canton+de+Fribourg%2C+Fribourg%2C+Rue+de+Romont+12'
        '&to=Gen%C3%A8ve%2C+Uni-Mail'
        '&tt=dpt'
        '&stc=1'
        '&sd=1'
        '&pre=0'
        '&num=4'
        '&dtm=1g3ashk'
        '&i=0',
      );
      DeepLinkBloc.platform.setMockMethodCallHandler((methodCall) async => uri.toString());

      final c = ProviderContainer(
          overrides: [navigationAPIProvider.overrideWithValue(MockNavigationApi())]);

      late Pair<NavRoute, int> p;
      await c.read(linksProvider).init(
            getApi: () => c.read(navigationAPIProvider),
            push: (map) => p = map,
          );

      expect(p, isNotNull);
      expect(p.first, isNotNull);
      expect(p.second, 0);
      expect(
        (c.read(navigationAPIProvider) as MockNavigationApi).rawQueries,
        contains(
          SearchChApi.queryBuilder(
            'route',
            decodeRouteUri(uri),
          ),
        ),
      );
    });
  });
}

class Obs extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {}

  @override
  void didPush(Route route, Route? previousRoute) {}

  @override
  void didRemove(Route route, Route? previousRoute) {}

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {}
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
    },
  );
}
