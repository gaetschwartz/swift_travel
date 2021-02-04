// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:swift_travel/apis/search.ch/cff.dart';
import 'package:swift_travel/apis/search.ch/models/cff_completion.dart';
import 'package:swift_travel/apis/sncf/sncf.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/db/database.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/utils/complete.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/utils/route_uri.dart';
import 'package:utils/levenshtein.dart';

final storeProvider = ChangeNotifierProvider((r) => FavoritesSharedPreferencesStore(r));

class FavsListener extends Mock {
  void call(Iterable<FavoriteStop> value);
}

class RoutesListener extends Mock {
  void call(Iterable<LocalRoute> value);
}

class PrefsListener extends Mock {
  void call();
}

final r = Random();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('navigation api', () {
    setUp(() async {
      SharedPreferencesStorePlatform.instance = InMemorySharedPreferencesStore.empty();
      final preferences = await SharedPreferences.getInstance();
      await preferences.clear();
    });
    test('returns the right instance', () async {
      final container = ProviderContainer();
      final store = container.read(preferencesProvider);
      await store.loadFromPreferences();

      store.api = NavigationApiType.cff;
      var navApi = container.read(navigationAPIProvider);
      expect(navApi is CffApi, isTrue);

      store.api = NavigationApiType.sncf;
      navApi = container.read(navigationAPIProvider);
      expect(navApi is SncfApi, isTrue);
    });
  });

  group('route history', () {
    const route1 = LocalRoute('Genève', 'Lausanne');
    const route2 = LocalRoute('Lausanne', 'Genève');
    const route3 = LocalRoute('Zürich', 'Bern');

    setUpAll(() async => await Hive.initFlutter());

    setUp(() async => await Hive.close());

    test('add route', () async {
      final hist = RouteHistoryRepository.newInstance();

      await hist.open();

      await hist.clear();
      expect(hist.routes, isEmpty);

      await hist.add(route1);
      expect(hist.routes, [route1]);

      await hist.add(route2);
      expect(hist.routes, [route1, route2]);

      await hist.box.deleteAt(0);
      expect(hist.routes, [route2]);

      await hist.clear();
      expect(hist.routes, isEmpty);
    });

    test('throws when not accessed properly', () async {
      final hist = RouteHistoryRepository.newInstance();

      expect(() async => await hist.add(route1), throwsAssertionError);
    });
    test('safe add works', () async {
      final hist = RouteHistoryRepository.newInstance();

      await hist.safeAdd(route1);
      expect(hist.routes, [route1]);
    });

    test('completion', () async {
      final hist = RouteHistoryRepository.newInstance();

      await hist.open();

      final c = completeWithFavorites(
          favorites: [],
          completions: [],
          query: 'query',
          history: [
            route1,
            route3,
            route1,
            route3,
          ]);

      expect(
        c,
        [
          CffCompletion(label: route1.from, origin: DataOrigin.history),
          CffCompletion(label: route1.to, origin: DataOrigin.history),
          CffCompletion(label: route3.from, origin: DataOrigin.history),
          CffCompletion(label: route3.to, origin: DataOrigin.history),
        ],
      );
    });
  });

  group('favorites store', () {
    setUp(() async {
      SharedPreferencesStorePlatform.instance = InMemorySharedPreferencesStore.empty();
      final preferences = await SharedPreferences.getInstance();
      await preferences.clear();
    });

    test('favs and routes are persisted correctly', () async {
      final container = ProviderContainer();

      final store = container.read(storeProvider);

      await store.loadFromPreferences(prefs: await SharedPreferences.getInstance());

      const bern = FavoriteStop('Bern');
      await store.addStop(bern);
      const route = LocalRoute('Bern', 'Bern');
      await store.addRoute(route);

      await store.loadFromPreferences(prefs: await SharedPreferences.getInstance());

      expect(store.stops, [bern]);
      expect(store.routes, [route]);
    });

    test('default is empty', () async {
      final container = ProviderContainer();

      final store = container.read(storeProvider);

      await store.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      expect(store.stops, []);
      expect(store.routes, []);
    });

    test('add favs and remove', () async {
      final container = ProviderContainer();

      final favsListener = FavsListener();
      final store = container.read(storeProvider);

      store.addListener(() => favsListener(store.stops));

      await store.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      verify(favsListener([])).called(1);

      const bern = FavoriteStop('Bern');
      const nowhere = FavoriteStop('Nowhere');

      await store.addStop(bern);
      expect(store.stops, [bern]);
      verify(favsListener([bern])).called(1);
      await store.removeStop(bern);
      expect(store.stops, []);
      verify(favsListener([])).called(1);

      verifyNever(favsListener([nowhere]));
      verifyNoMoreInteractions(favsListener);
    });

    test('add routes and remove', () async {
      final container = ProviderContainer();

      final routesListener = RoutesListener();
      final store = container.read(storeProvider);

      store.addListener(() => routesListener(store.routes));

      await store.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      verify(routesListener([])).called(1);

      const route = LocalRoute('Bern', 'Bern');
      const routeNever = LocalRoute('Nowhere', 'Everywhere');

      await store.addRoute(route);
      expect(store.routes, [route]);
      verify(routesListener([route])).called(1);
      await store.removeRoute(route);
      expect(store.routes, []);
      verify(routesListener([])).called(1);

      verifyNever(routesListener([routeNever]));
      verifyNoMoreInteractions(routesListener);
    });
  });

  group('preferences store', () {
    setUp(() {
      SharedPreferencesStorePlatform.instance = InMemorySharedPreferencesStore.empty();
    });

    test('prefs persist', () async {
      final container = ProviderContainer();

      final listener = PrefsListener();
      final prefs = container.read(preferencesProvider);

      prefs.addListener(listener);

      await prefs.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      verify(listener()).called(1);
      prefs.api = NavigationApiType.cff;
      verify(listener()).called(1);
      prefs.mapsApp = Maps.apple;
      verify(listener()).called(1);

      prefs.api = NavigationApiType.sncf;
      verify(listener()).called(1);
      prefs.mapsApp = Maps.google;
      verify(listener()).called(1);

      await prefs.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      verify(listener()).called(1);

      expect(prefs.api, NavigationApiType.sncf);
      expect(prefs.mapsApp, Maps.google);

      verifyNoMoreInteractions(listener);
    });
  });

  group('route uri', () {
    group('ints <-> list<bool>', () {
      final r = Random();
      test('encode/decoded', () {
        for (var i = 0; i < 10000; i++) {
          final l = List.generate(r.nextInt(10), (_) => r.nextBool());
          final encoded = encodeArgsToInt(l);
          final decoded = decodeIntToArgs(encoded, l.length);

          expect(decoded, l);
        }
      });
    });
    test("encode malformed data doesn't work", () {
      final paramList = [
        {
          'from': 'Genève Aéroport',
          'to': 'Berne',
          'date': '30/1/2021/',
          'time': '13:46',
          'time_type': describeEnum(TimeType.arrival),
          'show_trackchanges': 1,
          'show_delays': 1,
        },
        {
          'from': 'Genève Aéroport',
          'to': 'Berne',
          'date': '30/1/',
          'time': '13:46',
          'time_type': describeEnum(TimeType.arrival),
          'show_trackchanges': 1,
          'show_delays': 1,
        },
        {
          'from': 'Genève Aéroport',
          'to': 'Berne',
          'date': '30/1/2021',
          'time': '13::41',
          'time_type': describeEnum(TimeType.arrival),
          'show_trackchanges': 1,
          'show_delays': 1,
        },
        {
          'from': 'Genève Aéroport',
          'to': 'Berne',
          'date': '//',
          'time': ':',
          'time_type': describeEnum(TimeType.arrival),
          'show_trackchanges': 1,
          'show_delays': 1,
        },
      ].map((e) => e.map((key, value) => MapEntry(key, value.toString())));
      final builder = QueryBuilder('https://timetable.search.ch/api', (s) => '$s.json');

      for (var params in paramList) {
        final url = builder('route', params);
        expect(() => encodeRouteUri(Uri.parse(url), 0), throwsFormatException);
      }
    });
    test('encode/decode are compatible', () {
      final paramList = [
        {
          'from': 'Genève Aéroport',
          'to': 'Berne',
          'date': '1/30/2021',
          'time': '13:46',
          'time_type': describeEnum(TimeType.arrival),
          'show_trackchanges': 1,
          'show_delays': 1,
        },
        {
          'from': 'Université de Genève, Genève, Rue du Général-Dufour 24',
          'to': 'Badenerstrasse 549, 8048 Zürich',
          'date': '12/31/2021',
          'time': '0:0',
          'time_type': describeEnum(TimeType.depart),
          'show_trackchanges': 0,
          'show_delays': 0,
        },
      ].map((e) => e.map((key, value) => MapEntry(key, value.toString())));
      final builder = QueryBuilder('https://timetable.search.ch/api', (s) => '$s.json');

      for (var params in paramList) {
        final url = builder('route', params);

        final encoded = encodeRouteUri(Uri.parse(url), 0);
        final decoded = decodeRouteUri(Uri.parse(builder('route', encoded)));

        expect(decoded, params);
      }
    });
  });

  group('format', () {
    test('distance', () {
      expect(Format.distance(0), '0 m');
      expect(Format.distance(10), '10 m');
      expect(Format.distance(1000), '1.0 km');
      expect(Format.distance(1234), '1.2 km');
      expect(Format.distance(null), '');
    });

    test('duration - en', () {
      expect(Format.duration(const Duration(hours: 2, minutes: 3)), '2:03');
      expect(Format.duration(const Duration(hours: 2)), '2:00');
      expect(Format.duration(const Duration(minutes: 3)), '3 mins');
      expect(Format.duration(Duration.zero), 'Now');
    });

    test('duration - fr', () {
      const locale = Locale('fr');
      expect(Format.duration(const Duration(hours: 2, minutes: 3), locale: locale), '2h03');
      expect(Format.duration(const Duration(hours: 2), locale: locale), '2h00');
      expect(Format.duration(const Duration(minutes: 3), locale: locale), '3 mins');
      expect(Format.duration(Duration.zero, locale: locale), 'Maint.');
    });
  });
  test('levenshtein', () {
    expect(levenshtein('hello', 'hello'), 0);
    expect(levenshtein('hello!', 'hello'), 1);
    expect(levenshtein('hello!!!', 'hello'), 3);
  });
  test('query builder', () {
    final builder = QueryBuilder('https://example.com', (s) => '$s.json');
    expect(builder('compute', {}), 'https://example.com/compute.json');
    expect(builder('delete', {'test1': true, 'test2': false}),
        'https://example.com/delete.json?test1=true&test2=false');
    expect(
        builder('encode', {'f1': '¦@#°§', 'f2': '¬|¢´', 'f3': '&?'}),
        'https://example.com/encode.json?'
        'f1=%C2%A6%40%23%C2%B0%C2%A7'
        '&f2=%C2%AC%7C%C2%A2%C2%B4'
        '&f3=%26%3F');
  });

  const count = 50;

  group('parse color', () {
    test('works correctly ', () {
      for (var i = 0; i < count; i++) {
        final nextInt = r.nextInt(1 << 12);
        final s = nextInt.toRadixString(16).padLeft(3, '0');
        expect(s.length, 3);
        expect(parseColorInt(s).toRadixString(16), 'ff${s[0]}0${s[1]}0${s[2]}0');
      }
      for (var i = 0; i < count; i++) {
        final nextInt = r.nextInt(1 << 24);
        final s = nextInt.toRadixString(16).padLeft(6, '0');
        expect(s.length, 6);
        expect(parseColorInt(s).toRadixString(16), 'ff$s');
      }
    });
    test("throw exception if doesn't work", () {
      expect(() => parseColorInt('hell'), throwsArgumentError);
      expect(() => parseColorInt('1234'), throwsArgumentError);

      expect(() => parseColorInt('zzz'), throwsFormatException);
      expect(() => parseColorInt('------'), throwsFormatException);

      expect(parseColorInt(''), null);
      expect(parseColorInt(null), null);
    });
  });
}
