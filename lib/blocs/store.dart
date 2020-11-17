import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/apis/cff/models/local_route.dart';
import 'package:swift_travel/blocs/quick_actions.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/models/favorites_routes_states.dart';
import 'package:swift_travel/models/favorites_states.dart';
import 'package:swift_travel/utils/errors.dart';

abstract class FavoritesStoreBase extends ChangeNotifier {
  Future<void> loadFromPreferences({SharedPreferences prefs, bool notify = true});
  Future<void> addFavorite(FavoriteStop stop);
  Future<void> deleteFavorite(FavoriteStop favoriteStop);
  Future<void> addRoute(LocalRoute route);
  Future<void> deleteRoute(LocalRoute route);
}

final storeProvider =
    ChangeNotifierProvider<FavoritesStoreBase>((r) => FavoritesSharedPreferencesStore(r));
final favoritesStatesProvider =
    StateProvider<FavoritesStates>((_) => const FavoritesStates.loading());
final favoritesRoutesStatesProvider =
    StateProvider<FavoritesRoutesStates>((_) => const FavoritesRoutesStates.loading());

class FavoritesSharedPreferencesStore extends FavoritesStoreBase {
  static const stopsKey = "favoritesStop";
  static const routesKey = "favoritesRoutes";

  final ProviderReference ref;
  FavoritesSharedPreferencesStore(this.ref);

  SharedPreferences _prefs;

  final Set<FavoriteStop> _favs = {};
  final Set<LocalRoute> _routes = {};

  Set<LocalRoute> get routes => _routes;

  Future<void> _checkState() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Iterable<FavoriteStop> get favorites => _favs.where((e) => e != null);

  @override
  Future<void> loadFromPreferences({SharedPreferences prefs, bool notify = true}) async {
    log("Getting favorites", name: "Store");
    if (notify) {
      ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
      ref.read(favoritesRoutesStatesProvider).state = const FavoritesRoutesStates.loading();
    }
    _prefs = prefs ?? await SharedPreferences.getInstance();

    //? Stops

    final List<FavoriteStop> favStops = [];
    for (final String ll in _prefs.getStringList(stopsKey) ?? []) {
      final fs = FavoriteStop.fromJson(jsonDecode(ll) as Map<String, dynamic>);
      log("Found $fs", name: "Store");
      favStops.add(fs);
    }
    _favs.clear();
    _favs.addAll(favStops);

    ref.read(favoritesStatesProvider).state = FavoritesStates.data(favorites.toList());

    //? Routes
    final List<String> routes = _prefs.getStringList(routesKey) ?? [];
    _routes.clear();
    for (final spr in routes) {
      try {
        final decode = jsonDecode(spr) as Map<String, dynamic>;
        final r = LocalRoute.fromJson(decode);
        _routes.add(r);
      } on Exception catch (e, s) {
        report(e, s, name: "Store", text: "Error while trying to decode $spr");
      }
    }

    ref.read(favoritesRoutesStatesProvider).state = FavoritesRoutesStates.data(_routes.toList());

    if (notify) {
      await sync();
    }
  }

  @override
  Future<void> addRoute(LocalRoute route) async {
    _routes.add(route);

    ref.read(favoritesRoutesStatesProvider).state = FavoritesRoutesStates.data(_routes.toList());
    await sync();
  }

  @override
  Future<void> deleteRoute(LocalRoute route) async {
    _routes.remove(route);
    ref.read(favoritesRoutesStatesProvider).state = FavoritesRoutesStates.data(_routes.toList());
    await sync();
  }

  @override
  Future<void> addFavorite(FavoriteStop stop) async {
    _favs.add(stop);
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(favorites.toList());
    await sync();
  }

  Future<void> sync() async {
    notifyListeners();
    await _prefs.setStringList(stopsKey, _favs.map((e) => jsonEncode(e.toJson())).toList());

    final routes = <String>[];

    for (final e in _routes) {
      try {
        routes.add(jsonEncode(e.toJson()));
      } on Exception catch (e, s) {
        report(e, s, text: "Error while trying to encode $e", name: "Store");
      }
    }

    await _prefs.setStringList(routesKey, routes);
    if (isMobile) await ref.read(quickActions).setActions(_routes.toList(), favorites.toList());
  }

  @override
  Future<void> deleteFavorite(FavoriteStop favoriteStop) async {
    await _checkState();

    if (!_favs.remove(favoriteStop)) {
      log("$favoriteStop was not in favorites ?", name: "Store");
    }
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(favorites.toList());
    await sync();
  }
}
