import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gaets_logging/logging.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/links.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/pages/search/search.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/states/route_states.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';
import 'package:swift_travel/utils/route_uri.dart';
import 'package:theming/dynamic_theme.dart';

import 'apis_test.dart';
import 'blocs_test.dart';

class MockFetcher extends FetcherBase {
  @override
  Future<void> fetch(ProviderReference ref) async {
    state = RouteStates(SbbRoute.fromJson(mockRoute));
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('deep links', () async {
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
    DeepLinkBloc.channel.setMockMethodCallHandler((methodCall) async => uri.toString());

    final c = ProviderContainer(
        overrides: [navigationAPIProvider.overrideWithValue(MockNavigationApi())]);

    late Pair<NavRoute, int> p;
    await c.read(linksProvider).init(
          getApi: () => c.read(navigationAPIProvider),
          onNewRoute: (map) => p = map,
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

  group('route tab >', () {
    late final String dirPath;
    setUpAll(() async {
      final directory = await getTempDirForTests();
      dirPath = path.join(directory.path, 'swift_travel', 'test_results', 'route_tab_test');
      Hive.init(dirPath);
    });

    setUp(() async {
      log.log('Setup...');
      final d = Directory(dirPath);
      if (d.existsSync()) {
        await d.delete(recursive: true);
      }
      await openBoxes();
      log.log('Setup done');
    });

    testWidgets(
      'main tab',
      (t) async {
        await t.pumpWidget(DynamicTheme(
          theme: DynamicThemeData(DynamicThemeData.defaultConfig),
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

        log.log('Tapping first textfield');
        final tapField = find.byKey(RoutePageState.routeFromTextfieldKeyTap);
        await t.tap(tapField);
        await t.pumpAndSettle();

        log.log('Entering text in first textfield');
        final field = find.byKey(RoutePageState.routeFromTextfieldKey);
        await t.enterText(field, 'Genève');
        await t.pumpAndSettle();
        final suggested = find.byType(SuggestedTile).last;
        await t.tap(suggested);
        await t.pumpAndSettle();

        log.log('Tapping second textfield');
        final tapField2 = find.byKey(RoutePageState.routeToTextfieldKeyTap);
        await t.tap(tapField2);
        await t.pumpAndSettle();

        log.log('Entering text in second textfield');
        final field2 = find.byKey(RoutePageState.routeToTextfieldKey);
        await t.enterText(field2, 'Lausanne');
        await t.pumpAndSettle();
        await t.tap(suggested);
        await t.pumpAndSettle();

        log.log('Looking for route tile');
        final tile = find.byType(RouteTile).first;
        final text = find.text('Genève, Cornavin');
        expect(tile, findsOneWidget);
        expect(text.first, findsOneWidget);
        log.log('Found it, tapping the tile...');

        await t.tap(tile);
        await t.pumpAndSettle();

        final localizations = await AppLocalizations.delegate.load(const Locale('en'));
        expect(find.text(localizations.tabs_route), findsOneWidget);
        log.log('We are in the route details page');

        navigatorKey.currentState!.pop();
        await t.pumpAndSettle();
        log.log('We are back');

        expect(tile, findsOneWidget);
        expect(text.first, findsOneWidget);
        await t.idle();
      },
      skip: true,
    );
  });
}

Future<void> openBoxes() async {
  await FavRoutesDb.i.open();
  await FavStopsDb.i.open();
  await RouteHistoryRepository.i.open();
}

Future<void> clearBoxes() async {
  await FavRoutesDb.i.clear();
  await FavStopsDb.i.clear();
  await RouteHistoryRepository.i.clear();
}
