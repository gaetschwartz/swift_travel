// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/db/db.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/states/favorites_routes_states.dart';
import 'package:swift_travel/states/favorites_states.dart';

abstract class BaseFavoritesStore extends ChangeNotifier {
  Future<void> init({bool doNotify = true});
  Future<DataWithId<FavoriteStop>> addStop(FavoriteStop stop);
  Future<void> removeStop(DataWithId<FavoriteStop> favoriteStop);
  Future<DataWithId<LocalRoute>> addRoute(LocalRoute route);
  Future<void> removeRoute(DataWithId<LocalRoute> route);

  Iterable<DataWithId<LocalRoute>> get routes;
  Iterable<DataWithId<FavoriteStop>> get stops;
}

final favoritesStoreProvider =
    ChangeNotifierProvider<BaseFavoritesStore>((_) => HiveFavoritesStore());
@Deprecated('Use favoritesStoreProvider instead')
final favoritesStatesProvider =
    StateProvider<FavoritesStates>((_) => const FavoritesStates.loading());
@Deprecated('Use favoritesStoreProvider instead')
final favoritesRoutesStatesProvider = StateProvider<FavoritesRoutesStates>(
    (_) => const FavoritesRoutesStates.loading());

class HiveFavoritesStore extends BaseFavoritesStore {
  final favRoutesDb = FavRoutesDb();
  final favStopsDb = FavStopsDb();

  @override
  Future<DataWithId<LocalRoute>> addRoute(LocalRoute route) async {
    final id = await favRoutesDb.add(route);
    notifyListeners();
    return DataWithId(id, route);
  }

  @override
  Future<DataWithId<FavoriteStop>> addStop(FavoriteStop stop) async {
    final id = await favStopsDb.add(stop);
    notifyListeners();
    return DataWithId(id, stop);
  }

  @override
  Future<void> init({bool doNotify = true}) async {
    await favRoutesDb.open();
    await favStopsDb.open();
    notifyListeners();
  }

  @override
  Future<void> removeRoute(DataWithId<LocalRoute> route) async {
    await favRoutesDb.delete(route.id);
    notifyListeners();
  }

  @override
  Future<void> removeStop(DataWithId<FavoriteStop> favoriteStop) async {
    await favStopsDb.delete(favoriteStop.id);
    notifyListeners();
  }

  @override
  Iterable<DataWithId<LocalRoute>> get routes => favRoutesDb.valuesWithIds;

  @override
  Iterable<DataWithId<FavoriteStop>> get stops => favStopsDb.valuesWithIds;

  @override
  Future<void> dispose() async {
    await favRoutesDb.close();
    await favStopsDb.close();
    super.dispose();
  }
}

class FavRoutesDb extends LocalDatabase<int, Map<dynamic, dynamic>, LocalRoute>
    with IndexedDatabaseWithIdMixin<Map<dynamic, dynamic>, LocalRoute> {
  @visibleForTesting
  FavRoutesDb() : this._();

  FavRoutesDb._()
      : super(
          boxKey: 'favorite_routes',
          maxSize: 0,
          decode: (d) => LocalRoute.fromJson(d.cast<String, dynamic>()),
          encode: (d) => d.toJson(),
        );

  static final i = FavRoutesDb();

  List<LocalRoute> get routes => values.toList(growable: false);

  /// Do nothing.
  @override
  void onDatabaseExceededMaxSize() {}
}

class FavStopsDb extends LocalDatabase<int, Map<dynamic, dynamic>, FavoriteStop>
    with IndexedDatabaseWithIdMixin<Map<dynamic, dynamic>, FavoriteStop> {
  @visibleForTesting
  FavStopsDb()
      : super(
          boxKey: 'favorite_stops',
          maxSize: 100,
          decode: (d) => FavoriteStop.fromJson(d.cast<String, dynamic>()),
          encode: (d) => d.toJson(),
        );

  static final i = FavStopsDb();

  List<FavoriteStop> get stops => values.toList(growable: false);

  /// Do nothing.
  @override
  void onDatabaseExceededMaxSize() {}
}

class QuickActionsFavoriteItemsDb extends LocalDatabase<int,
        Map<dynamic, dynamic>, QuickActionsReorderableItem>
    with
        IndexedDatabaseWithIdMixin<Map<dynamic, dynamic>,
            QuickActionsReorderableItem> {
  @visibleForTesting
  QuickActionsFavoriteItemsDb()
      : super(
          boxKey: 'quick_actions_favorite_items',
          maxSize: 3,
          decode: (d) =>
              QuickActionsReorderableItem.fromJson(d.cast<String, dynamic>()),
          encode: (d) => d.toJson(),
        );

  static final i = QuickActionsFavoriteItemsDb();

  List<QuickActionsReorderableItem> get items => values.toList(growable: false);

  /// Do nothing.
  @override
  void onDatabaseExceededMaxSize() {}
}

class FavoritesSharedPreferencesStore extends BaseFavoritesStore {
  FavoritesSharedPreferencesStore(this.ref);

  static const stopsKey = 'favoritesStop';
  static const routesKey = 'favoritesRoutes';

  final log = Logger.of('FavoritesSharedPreferencesStore');

  final Ref ref;
  final Set<FavoriteStop> _stops = {};

  late SharedPreferences _prefs;
  final Set<LocalRoute> _routes = {};

  @override
  Iterable<DataWithId<LocalRoute>> get routes =>
      _routes.map((e) => DataWithId(0, e));
  @override
  Iterable<DataWithId<FavoriteStop>> get stops =>
      _stops.map((e) => DataWithId(0, e));

  @override
  Future<void> init({SharedPreferences? prefs, bool doNotify = true}) async {
    if (doNotify) {
      ref.read(favoritesStatesProvider.notifier).state =
          const FavoritesStates.loading();
      ref.read(favoritesRoutesStatesProvider.notifier).state =
          const FavoritesRoutesStates.loading();
    }
    _prefs = prefs ?? await SharedPreferences.getInstance();

    //? Stops

    final favStops = <FavoriteStop>[];
    for (final stopString in _prefs.getStringList(stopsKey) ?? <String>[]) {
      final decode = jsonDecode(stopString) as Map<String, dynamic>;
      final fs = FavoriteStop.fromJson(decode);
      favStops.add(fs);
    }
    _stops
      ..clear()
      ..addAll(favStops);

    ref.read(favoritesStatesProvider.notifier).state =
        FavoritesStates.data(stops.map((e) => e.data).toList(growable: false));

    //? Routes
    final routes = _prefs.getStringList(routesKey) ?? [];
    _routes.clear();
    for (final spr in routes) {
      final decode = jsonDecode(spr) as Map<String, dynamic>;
      final r = LocalRoute.fromJson(decode);
      _routes.add(r);
    }

    ref.read(favoritesRoutesStatesProvider.notifier).state =
        FavoritesRoutesStates.data(_routes.toList(growable: false));

    if (doNotify) {
      await sync();
    }
  }

  @override
  Future<DataWithId<LocalRoute>> addRoute(LocalRoute route) async {
    _routes.add(route);

    ref.read(favoritesRoutesStatesProvider.notifier).state =
        FavoritesRoutesStates.data(_routes.toList(growable: false));
    await sync();
    return DataWithId(0, route);
  }

  @override
  Future<void> removeRoute(DataWithId<LocalRoute> route) async {
    if (!_routes.remove(route.data)) {
      log.log('${route.data} was not in favorites ?', channel: 'Store');
    }
    ref.read(favoritesRoutesStatesProvider.notifier).state =
        FavoritesRoutesStates.data(_routes.toList(growable: false));
    await sync();
  }

  @override
  Future<DataWithId<FavoriteStop>> addStop(FavoriteStop stop) async {
    _stops.add(stop);
    ref.read(favoritesStatesProvider.notifier).state =
        FavoritesStates.data(_stops.toList(growable: false));
    await sync();
    return DataWithId(0, stop);
  }

  @override
  Future<void> removeStop(DataWithId<FavoriteStop> favoriteStop) async {
    if (!_stops.remove(favoriteStop.data)) {
      log.log('${favoriteStop.data} was not in favorites ?', channel: 'Store');
    }
    ref.read(favoritesStatesProvider.notifier).state =
        FavoritesStates.data(_stops.toList(growable: false));
    await sync();
  }

  Future<void> sync() async {
    notifyListeners();

    final stops = <String>[];
    for (final e in _stops) {
      try {
        stops.add(jsonEncode(e.toJson()));
      } on FormatException {
        await _prefs.setStringList(stopsKey, []);
        rethrow;
      }
    }
    await _prefs.setStringList(stopsKey, stops);

    final routes =
        _routes.map((e) => jsonEncode(e.toJson())).toList(growable: false);

    await _prefs.setStringList(routesKey, routes);
  }

  Future<void> editRoute(LocalRoute oldRoute, LocalRoute route) async {
    _routes
      ..remove(oldRoute)
      ..add(route);
    await sync();
  }
}
