// ignore_for_file: unnecessary_await_in_return
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:swift_travel/apis/navigation/france/france.dart';
import 'package:swift_travel/apis/navigation/switzerland/switzerland.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/models/favorites.dart';

class FavsListener extends Mock {
  void call(Iterable<FavoriteStop> value);
}

class RoutesListener extends Mock {
  void call(Iterable<LocalRoute> value);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('HiveFavoritesStore >', () {
    late ProviderContainer container;
    late final SharedPreferences prefs;

    setUpAll(() async {
      final directory = await getTempDirForTests();

      final dir = path.join(directory.path, 'swift_travel', 'test_results',
          'HiveFavoritesStoreTest');
      Hive.init(dir);

      SharedPreferencesStorePlatform.instance =
          InMemorySharedPreferencesStore.empty();
      prefs = await SharedPreferences.getInstance();
    });

    setUp(() async {
      container = ProviderContainer(overrides: [
        storeProvider.overrideWith(
          (_) => HiveFavoritesStore(),
        )
      ]);
    });

    tearDown(() async {
      await Hive.deleteFromDisk();
      await prefs.clear();
    });

    test('favs and routes are persisted correctly', () async {
      final store = container.read(storeProvider);

      await store.init(prefs: prefs);

      final bern = FavoriteStop.fromStop('Bern', api: searchChApi.id);
      await store.addStop(bern);
      final route = LocalRoute.simple('Bern', 'Bern');
      await store.addRoute(route);

      await store.init();

      expect(store.stops, [bern]);
      expect(store.routes, [route]);
    });

    test('default is empty', () async {
      final store = container.read(storeProvider);

      await store.init();
      expect(store.stops, <FavoriteStop>{});
      expect(store.routes, <LocalRoute>{});
    });

    test('add favs and remove', () async {
      final favsListener = FavsListener();
      final store = container.read(storeProvider);

      store.addListener(() => favsListener(store.stops));

      await store.init();
      verify(favsListener([])).called(1);

      final bern = FavoriteStop.fromStop('Bern', api: searchChApi.id);
      final nowhere = FavoriteStop.fromStop('Nowhere', api: searchChApi.id);

      await store.addStop(bern);
      expect(store.stops, [bern]);
      verify(favsListener([bern])).called(1);
      await store.removeStop(bern);
      expect(store.stops, <FavoriteStop>{});
      verify(favsListener([])).called(1);

      verifyNever(favsListener([nowhere]));
      verifyNoMoreInteractions(favsListener);
    });

    test('add routes and remove', () async {
      final routesListener = RoutesListener();
      final store = container.read(storeProvider);

      store.addListener(() => routesListener(store.routes));

      await store.init();
      verify(routesListener([])).called(1);

      final route = LocalRoute.simple('Bern', 'Bern');
      final routeNever = LocalRoute.simple('Nowhere', 'Everywhere');

      await store.addRoute(route);
      expect(store.routes, [route]);
      verify(routesListener([route])).called(1);
      await store.removeRoute(route);
      expect(store.routes, <LocalRoute>{});
      verify(routesListener([])).called(1);

      verifyNever(routesListener([routeNever]));
      verifyNoMoreInteractions(routesListener);
    });
  });

  /*group('FavoritesSharedPreferencesStore >', () {
    late ProviderContainer container;
    late SharedPreferences prefs;
    setUpAll(() async {
      SharedPreferencesStorePlatform.instance =
          InMemorySharedPreferencesStore.empty();
    });

    tearDown(() async {
      await prefs.clear();
    });

    setUp(() async {
      container = ProviderContainer(overrides: [
        storeProvider.overrideWithValue(
            ChangeNotifierProvider((r) => FavoritesSharedPreferencesStore(r)))
      ]);
      prefs = await SharedPreferences.getInstance();
    });

    test('favs and routes are persisted correctly', () async {
      final store = container.read(storeProvider);

      await store.init(prefs: prefs);

      final bern = FavoriteStop.fromStop('Bern', api: searchChApi.id);
      await store.addStop(bern);
      final route = LocalRoute.simple('Bern', 'Bern');
      await store.addRoute(route);

      await store.init(prefs: prefs);

      expect(store.stops, [bern]);
      expect(store.routes, [route]);
    });

    test('default is empty', () async {
      final store = container.read(storeProvider);

      await store.init(prefs: prefs);
      expect(store.stops, <FavoriteStop>{});
      expect(store.routes, <LocalRoute>{});
    });

    test('add favs and remove', () async {
      final favsListener = FavsListener();
      final store = container.read(storeProvider);

      store.addListener(() => favsListener(store.stops));

      await store.init(prefs: prefs);
      verify(favsListener([])).called(1);

      final bern = FavoriteStop.fromStop('Bern', api: searchChApi.id);
      final nowhere = FavoriteStop.fromStop('Nowhere', api: searchChApi.id);

      await store.addStop(bern);
      expect(store.stops, [bern]);
      verify(favsListener([bern])).called(1);
      await store.removeStop(bern);
      expect(store.stops, <FavoriteStop>{});
      verify(favsListener([])).called(1);

      verifyNever(favsListener([nowhere]));
      verifyNoMoreInteractions(favsListener);
    });

    test('add routes and remove', () async {
      final routesListener = RoutesListener();
      final store = container.read(storeProvider);

      store.addListener(() => routesListener(store.routes));

      await store.init(prefs: prefs);
      verify(routesListener([])).called(1);

      final route = LocalRoute.simple('Bern', 'Bern');
      final routeNever = LocalRoute.simple('Nowhere', 'Everywhere');

      await store.addRoute(route);
      expect(store.routes, [route]);
      verify(routesListener([route])).called(1);
      await store.removeRoute(route);
      expect(store.routes, <LocalRoute>{});
      verify(routesListener([])).called(1);

      verifyNever(routesListener([routeNever]));
      verifyNoMoreInteractions(routesListener);
    });

    test('exceptions are thrown when malformed data', () async {
      final store = container.read(storeProvider);

      await prefs
          .setStringList(FavoritesSharedPreferencesStore.stopsKey, ['{']);
      await prefs
          .setStringList(FavoritesSharedPreferencesStore.routesKey, ['{']);

      expect(() async => await store.init(), throwsFormatException);
    });
  });*/

  group('preferences store >', () {
    late SharedPreferences prefs;
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
    });

    test('prefs persist', () async {
      expect(prefs.getKeys(), isEmpty);

      final container = ProviderContainer();
      final store = container.read(preferencesProvider);

      await store.loadFromPreferences();
      await store.api.setValue(searchChApi.id);
      await store.mapsApp.setValue(NavigationApp.apple);

      await store.api.setValue(sncfFactory.id);
      await store.mapsApp.setValue(NavigationApp.google);

      await store.loadFromPreferences();
      expect(store.api.value, sncfFactory.id);
      expect(store.mapsApp.value, NavigationApp.google);
    });

    tearDown(() async {
      await prefs.clear();
    });
  });
}

Future<Directory> getTempDirForTests() async {
  late final Directory directory;
  try {
    directory = await getTemporaryDirectory();
  } on MissingPluginException {
    directory = Directory('./temp');
  }
  return directory;
}
