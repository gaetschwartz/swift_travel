// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:swift_travel/apis/cff/cff.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/apis/cff/models/local_route.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:utils/utils/levenshtein.dart';

final storeProvider = ChangeNotifierProvider((r) => FavoritesSharedPreferencesStore(r));

final preferencesProvider = ChangeNotifierProvider((r) => PreferencesBloc());

class FavsListener extends Mock {
  void call(Iterable<FavoriteStop> value);
}

class RoutesListener extends Mock {
  void call(Iterable<LocalRoute> value);
}

class PrefsListener extends Mock {
  void call();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final Random r = Random();

  group("favorites store", () {
    setUp(() async {
      SharedPreferencesStorePlatform.instance = InMemorySharedPreferencesStore.empty();
      final preferences = await SharedPreferences.getInstance();
      preferences.clear();
    });

    test("add favs and remove", () async {
      final container = ProviderContainer();

      final store = container.read(storeProvider);

      store.loadFromPreferences(prefs: await SharedPreferences.getInstance());

      final geneva = FavoriteStop("Genève");
      await store.addFavorite(geneva);
      final route = LocalRoute("Genève", "Lausanne");
      await store.addRoute(route);

      store.loadFromPreferences(prefs: await SharedPreferences.getInstance());

      expect(store.favorites, [geneva]);
      expect(store.routes, [route]);
    });

    test("default is empty", () async {
      final container = ProviderContainer();

      final store = container.read(storeProvider);

      store.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      expect(store.favorites, []);
      expect(store.routes, []);
    });

    test("add favs and remove", () async {
      final container = ProviderContainer();

      final favsListener = FavsListener();
      final store = container.read(storeProvider);

      store.addListener(() => favsListener(store.favorites));

      store.loadFromPreferences(prefs: await SharedPreferences.getInstance());

      final geneva = FavoriteStop("Genève");
      await store.addFavorite(geneva);
      expect(store.favorites, [geneva]);
      verify(favsListener([geneva]));
      await store.deleteFavorite(geneva);
      expect(store.favorites, []);
      verify(favsListener([]));

      verifyNoMoreInteractions(favsListener);
    });

    test("add routes and remove", () async {
      final container = ProviderContainer();

      final routesListener = RoutesListener();
      final store = container.read(storeProvider);

      store.addListener(() => routesListener(store.routes));

      store.loadFromPreferences(prefs: await SharedPreferences.getInstance());

      final route = LocalRoute("Genève", "Lausanne");
      await store.addRoute(route);
      expect(store.routes, [route]);
      verify(routesListener([route]));
      await store.deleteRoute(route);
      expect(store.routes, []);
      verify(routesListener([]));

      verifyNoMoreInteractions(routesListener);
    });
  });

  group("preferences store", () {
    setUp(() {
      SharedPreferencesStorePlatform.instance = InMemorySharedPreferencesStore.empty();
    });

    test("prefs persist", () async {
      final container = ProviderContainer();

      final listener = PrefsListener();
      final prefs = container.read(preferencesProvider);

      prefs.addListener(listener);

      prefs.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      verify(listener()).called(1);

      prefs.api = NavigationApiType.sncf;
      verify(listener()).called(1);
      prefs.mapsApp = Maps.apple;
      verify(listener()).called(1);

      prefs.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      verify(listener()).called(1);

      expect(prefs.api, NavigationApiType.sncf);
      expect(prefs.mapsApp, Maps.apple);

      verifyNoMoreInteractions(listener);
    });
  });

  group("misc", () {
    test("levenshtein", () {
      expect(levenshtein("hello", "hello"), 0);
      expect(levenshtein("hello!", "hello"), 1);
      expect(levenshtein("hello!!!", "hello"), 3);
    });
    test("query builder", () {
      final builder = QueryBuilder("https://example.com", (s) => "$s.json");
      expect(builder("compute", {}), "https://example.com/compute.json");
      expect(builder("delete", {"test1": true, "test2": false}),
          "https://example.com/delete.json?test1=true&test2=false");
    });

    const count = 50;
    test("colorFromString", () {
      for (var i = 0; i < count; i++) {
        final nextInt = r.nextInt(1 << 12);
        final s = nextInt.toRadixString(16).padLeft(3, "0");
        expect(s.length, 3);
        expect(colorFromString(s).toRadixString(16), "ff${s[0]}0${s[1]}0${s[2]}0");
      }
      for (var i = 0; i < count; i++) {
        final nextInt = r.nextInt(1 << 24);
        final s = nextInt.toRadixString(16).padLeft(6, "0");
        expect(s.length, 6);
        expect(colorFromString(s).toRadixString(16), "ff$s");
      }
    });
  });
}
