import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/db/db.dart';
import 'package:swift_travel/logic/quick_actions.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/states/favorites_routes_states.dart';
import 'package:swift_travel/states/favorites_states.dart';
import 'package:theming/responsive.dart';

abstract class BaseFavoritesStore extends ChangeNotifier {
  Future<void> init({SharedPreferences? prefs, bool doNotify = true});
  Future<void> addStop(FavoriteStop stop);
  Future<void> removeStop(FavoriteStop favoriteStop);
  Future<void> addRoute(LocalRoute route);
  Future<void> removeRoute(LocalRoute route);

  Iterable<LocalRoute> get routes;
  Iterable<FavoriteStop> get stops;
}

final storeProvider =
    ChangeNotifierProvider<BaseFavoritesStore>((r) => FavoritesSharedPreferencesStore(r));
final favoritesStatesProvider =
    StateProvider<FavoritesStates>((_) => const FavoritesStates.loading());
final favoritesRoutesStatesProvider =
    StateProvider<FavoritesRoutesStates>((_) => const FavoritesRoutesStates.loading());

class HiveFavoritesStore extends BaseFavoritesStore {
  final favRoutesDb = FavRoutesDb();
  final favStopsDb = FavStopsDb();

  @override
  Future<void> addRoute(LocalRoute route) async {
    await favRoutesDb.hashAdd(route);
    notify();
  }

  @override
  Future<void> addStop(FavoriteStop stop) async {
    await favStopsDb.hashAdd(stop);
    notify();
  }

  @override
  Future<void> init({SharedPreferences? prefs, bool doNotify = true}) async {
    await favRoutesDb.open();
    await favStopsDb.open();
    notify();
  }

  @override
  Future<void> removeRoute(LocalRoute route) async {
    await favRoutesDb.hashDelete(route);
    notify();
  }

  @override
  Future<void> removeStop(FavoriteStop favoriteStop) async {
    await favStopsDb.hashDelete(favoriteStop);
    notify();
  }

  @override
  Iterable<LocalRoute> get routes => favRoutesDb.routes;

  @override
  Iterable<FavoriteStop> get stops => favStopsDb.stops;

  void notify() {
    notifyListeners();
    MyQuickActions.i.setActions(favRoutesDb.routes, favStopsDb.stops);
  }

  @override
  Future<void> dispose() async {
    await favRoutesDb.close();
    await favStopsDb.close();
    super.dispose();
  }
}

class FavRoutesDb extends LocalDatabase<int, Map, LocalRoute> with IndexedDatabaseMixin {
  @visibleForTesting
  FavRoutesDb()
      : super(
          boxKey: 'favorite_routes',
          maxSize: 100,
          decode: (d) => LocalRoute.fromJson(d.cast<String, dynamic>()),
          encode: (d) => d.toJson(),
        );

  static late final i = FavRoutesDb();

  List<LocalRoute> get routes => values.toList(growable: false);

  /// Do nothing.
  @override
  void onDatabaseExceededMaxSize() {}
}

class FavStopsDb extends LocalDatabase<int, Map, FavoriteStop> with IndexedDatabaseMixin {
  @visibleForTesting
  FavStopsDb()
      : super(
          boxKey: 'favorite_stops',
          maxSize: 100,
          decode: (d) => FavoriteStop.fromJson(d.cast<String, dynamic>()),
          encode: (d) => d.toJson(),
        );

  static late final i = FavStopsDb();

  List<FavoriteStop> get stops => values.toList(growable: false);

  /// Do nothing.
  @override
  void onDatabaseExceededMaxSize() {}
}

class FavoritesSharedPreferencesStore extends BaseFavoritesStore {
  FavoritesSharedPreferencesStore(this.ref);

  static const stopsKey = 'favoritesStop';
  static const routesKey = 'favoritesRoutes';

  final ProviderReference ref;
  final Set<FavoriteStop> _stops = {};

  SharedPreferences? _prefs;
  final Set<LocalRoute> _routes = {};

  @override
  Set<LocalRoute> get routes => _routes;
  @override
  Set<FavoriteStop> get stops => _stops;

  Future<void> _checkState() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  @override
  Future<void> init({SharedPreferences? prefs, bool doNotify = true}) async {
    if (doNotify) {
      ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
      ref.read(favoritesRoutesStatesProvider).state = const FavoritesRoutesStates.loading();
    }
    _prefs = prefs ?? await SharedPreferences.getInstance();

    //? Stops

    final favStops = <FavoriteStop>[];
    for (final stopString in _prefs!.getStringList(stopsKey) ?? <String>[]) {
      final decode = jsonDecode(stopString) as Map<String, dynamic>;
      final fs = FavoriteStop.fromJson(decode);
      favStops.add(fs);
    }
    _stops
      ..clear()
      ..addAll(favStops);

    ref.read(favoritesStatesProvider).state = FavoritesStates.data(stops.toList(growable: false));

    //? Routes
    final routes = _prefs!.getStringList(routesKey) ?? [];
    _routes.clear();
    for (final spr in routes) {
      final decode = jsonDecode(spr) as Map<String, dynamic>;
      final r = LocalRoute.fromJson(decode);
      _routes.add(r);
    }

    ref.read(favoritesRoutesStatesProvider).state =
        FavoritesRoutesStates.data(_routes.toList(growable: false));

    if (doNotify) {
      await sync();
    }
  }

  @override
  Future<void> addRoute(LocalRoute route) async {
    _routes.add(route);

    ref.read(favoritesRoutesStatesProvider).state =
        FavoritesRoutesStates.data(_routes.toList(growable: false));
    await sync();
  }

  @override
  Future<void> removeRoute(LocalRoute route) async {
    _routes.remove(route);
    ref.read(favoritesRoutesStatesProvider).state =
        FavoritesRoutesStates.data(_routes.toList(growable: false));
    await sync();
  }

  @override
  Future<void> addStop(FavoriteStop stop) async {
    _stops.add(stop);
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(stops.toList(growable: false));
    await sync();
  }

  @override
  Future<void> removeStop(FavoriteStop? favoriteStop) async {
    await _checkState();

    if (!_stops.remove(favoriteStop)) {
      log('$favoriteStop was not in favorites ?', name: 'Store');
    }
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(stops.toList(growable: false));
    await sync();
  }

  Future<void> sync() async {
    notifyListeners();

    final stops = <String>[];
    for (final e in _stops) {
      try {
        stops.add(jsonEncode(e.toJson()));
      } on FormatException {
        await _prefs!.setStringList(stopsKey, []);
        rethrow;
      }
    }
    await _prefs!.setStringList(stopsKey, stops);

    final routes = _routes.map((e) => jsonEncode(e.toJson())).toList(growable: false);

    await _prefs!.setStringList(routesKey, routes);

    if (isMobile) {
      await MyQuickActions.i
          .setActions(_routes.toList(growable: false), _stops.toList(growable: false));
    }
  }

  Future<void> editRoute(LocalRoute oldRoute, LocalRoute route) async {
    _routes
      ..remove(oldRoute)
      ..add(route);
    await sync();
  }
}
