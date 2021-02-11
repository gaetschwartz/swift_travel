import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/blocs/quick_actions.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/states/favorites_routes_states.dart';
import 'package:swift_travel/states/favorites_states.dart';

abstract class FavoritesStoreBase extends ChangeNotifier {
  Future<void> loadFromPreferences({SharedPreferences? prefs, bool notify = true});
  Future<void> addStop(FavoriteStop stop);
  Future<void> removeStop(FavoriteStop favoriteStop);
  Future<void> addRoute(LocalRoute route);
  Future<void> removeRoute(LocalRoute route);
}

final storeProvider =
    ChangeNotifierProvider<FavoritesStoreBase>((r) => FavoritesSharedPreferencesStore(r));
final favoritesStatesProvider =
    StateProvider<FavoritesStates>((_) => const FavoritesStates.loading());
final favoritesRoutesStatesProvider =
    StateProvider<FavoritesRoutesStates>((_) => const FavoritesRoutesStates.loading());

class FavoritesSharedPreferencesStore extends FavoritesStoreBase {
  static const stopsKey = 'favoritesStop';
  static const routesKey = 'favoritesRoutes';

  final ProviderReference ref;
  FavoritesSharedPreferencesStore(this.ref);

  SharedPreferences? _prefs;

  final Set<FavoriteStop> _stops = {};
  final Set<LocalRoute> _routes = {};

  Set<LocalRoute> get routes => _routes;
  Set<FavoriteStop> get stops => _stops;

  Future<void> _checkState() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  @override
  Future<void> loadFromPreferences({SharedPreferences? prefs, bool notify = true}) async {
    if (notify) {
      ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
      ref.read(favoritesRoutesStatesProvider).state = const FavoritesRoutesStates.loading();
    }
    _prefs = prefs ?? await SharedPreferences.getInstance();

    //? Stops

    final favStops = <FavoriteStop>[];
    for (final stopString in _prefs!.getStringList(stopsKey) ?? []) {
      final decode = jsonDecode(stopString) as Map<String, dynamic>;
      final fs = FavoriteStop.fromJson(decode);
      favStops.add(fs);
    }
    _stops.clear();
    _stops.addAll(favStops);

    ref.read(favoritesStatesProvider).state = FavoritesStates.data(stops.toList());

    //? Routes
    final routes = _prefs!.getStringList(routesKey) ?? [];
    _routes.clear();
    for (final spr in routes) {
      final decode = jsonDecode(spr) as Map<String, dynamic>;
      final r = LocalRoute.fromJson(decode);
      _routes.add(r);
    }

    ref.read(favoritesRoutesStatesProvider).state = FavoritesRoutesStates.data(_routes.toList());

    if (notify) {
      await _sync();
    }
  }

  @override
  Future<void> addRoute(LocalRoute route) async {
    _routes.add(route);

    ref.read(favoritesRoutesStatesProvider).state = FavoritesRoutesStates.data(_routes.toList());
    await _sync();
  }

  @override
  Future<void> removeRoute(LocalRoute route) async {
    _routes.remove(route);
    ref.read(favoritesRoutesStatesProvider).state = FavoritesRoutesStates.data(_routes.toList());
    await _sync();
  }

  @override
  Future<void> addStop(FavoriteStop stop) async {
    _stops.add(stop);
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(stops.toList());
    await _sync();
  }

  @override
  Future<void> removeStop(FavoriteStop? favoriteStop) async {
    await _checkState();

    if (!_stops.remove(favoriteStop)) {
      log('$favoriteStop was not in favorites ?', name: 'Store');
    }
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(stops.toList());
    await _sync();
  }

  Future<void> _sync() async {
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

    final routes = _routes.map((e) => jsonEncode(e.toJson())).toList();

    await _prefs!.setStringList(routesKey, routes);

    if (isMobile) await MyQuickActions.instance.setActions(_routes.toList(), _stops.toList());
  }
}
