import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';

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
  group('favorites store >', () {
    setUpAll(() async {
      SharedPreferencesStorePlatform.instance = InMemorySharedPreferencesStore.empty();
    });

    tearDown(() async {
      final preferences = await SharedPreferences.getInstance();
      await preferences.clear();
    });

    test('favs and routes are persisted correctly', () async {
      final container = ProviderContainer();

      final store = container.read(storeProvider) as FavoritesSharedPreferencesStore;

      await store.loadFromPreferences(prefs: await SharedPreferences.getInstance());

      final bern = FavoriteStop.fromStop('Bern', api: NavigationApi.sbb);
      await store.addStop(bern);
      const route = LocalRoute('Bern', 'Bern');
      await store.addRoute(route);

      await store.loadFromPreferences(prefs: await SharedPreferences.getInstance());

      expect(store.stops, [bern]);
      expect(store.routes, [route]);
    });

    test('default is empty', () async {
      final container = ProviderContainer();

      final store = container.read(storeProvider) as FavoritesSharedPreferencesStore;

      await store.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      expect(store.stops, <FavoriteStop>{});
      expect(store.routes, <LocalRoute>{});
    });

    test('add favs and remove', () async {
      final container = ProviderContainer();

      final favsListener = FavsListener();
      final store = container.read(storeProvider) as FavoritesSharedPreferencesStore;

      store.addListener(() => favsListener(store.stops));

      await store.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      verify(favsListener([])).called(1);

      final bern = FavoriteStop.fromStop('Bern', api: NavigationApi.sbb);
      final nowhere = FavoriteStop.fromStop('Nowhere', api: NavigationApi.sbb);

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
      final container = ProviderContainer();

      final routesListener = RoutesListener();
      final store = container.read(storeProvider) as FavoritesSharedPreferencesStore;

      store.addListener(() => routesListener(store.routes));

      await store.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      verify(routesListener([])).called(1);

      const route = LocalRoute('Bern', 'Bern');
      const routeNever = LocalRoute('Nowhere', 'Everywhere');

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
      final container = ProviderContainer();

      final store = container.read(storeProvider) as FavoritesSharedPreferencesStore;

      final prefs = await SharedPreferences.getInstance();

      await prefs.setStringList(FavoritesSharedPreferencesStore.stopsKey, ['{']);
      await prefs.setStringList(FavoritesSharedPreferencesStore.routesKey, ['{']);

      expect(() async => await store.loadFromPreferences(), throwsFormatException);
    });
  });

  group('preferences store >', () {
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
      prefs.api = NavigationApi.sbb;
      verify(listener()).called(1);
      prefs.mapsApp = Maps.apple;
      verify(listener()).called(1);

      prefs.api = NavigationApi.sncf;
      verify(listener()).called(1);
      prefs.mapsApp = Maps.google;
      verify(listener()).called(1);

      await prefs.loadFromPreferences(prefs: await SharedPreferences.getInstance());
      verify(listener()).called(1);

      expect(prefs.api, NavigationApi.sncf);
      expect(prefs.mapsApp, Maps.google);

      verifyNoMoreInteractions(listener);
    });
  });
}
