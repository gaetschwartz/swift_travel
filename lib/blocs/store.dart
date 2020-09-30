import 'dart:convert';
import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/api/cff/models/favorite_stop.dart';
import 'package:swiss_travel/api/cff/models/local_route.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/quick_actions.dart';
import 'package:swiss_travel/models/favorites_routes_states.dart';
import 'package:swiss_travel/models/favorites_states.dart';

abstract class FavoritesStoreBase extends ChangeNotifier {
  Future<void> loadFromPreferences({SharedPreferences prefs, bool notify = true});
  Future<void> addFavorite(CffCompletion completion, String displayName);
  Future<void> deleteFavorite(FavoriteStop favoriteStop);
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
  static const stopsKey = "favoritesStop";
  static const routesKey = "favoritesRoutes";

  final ProviderReference ref;
  FavoritesSharedPreferencesStore(this.ref);

  SharedPreferences _prefs;

  final Map<String, CffCompletion> _cache = {};
  final Set<FavoriteStop> _favs = {};
  final Set<LocalRoute> _routes = {};

  Set<LocalRoute> get routes => _routes;

  Future<void> _checkState() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Map<String, CffCompletion> get cache => _cache;

  Iterable<FavoriteStop> get favorites => _favs.where((e) => e != null);

  @override
  Future<void> loadFromPreferences({SharedPreferences prefs, bool notify = true}) async {
    log("Gettings favorites", name: "Store");
    if (notify) {
      ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
      ref.read(favoritesRoutesStatesProvider).state = const FavoritesRoutesStates.loading();
    }
    _prefs = prefs ?? await SharedPreferences.getInstance();

    //? Stops

    final List<FavoriteStop> favStops = [];
    for (final String ll in _prefs.getStringList(stopsKey) ?? []) {
      final fs = FavoriteStop.fromJson(jsonDecode(ll) as Map<String, dynamic>);
      if (_cache[fs.stop] == null) {
        log("Fetching ${fs.stop} because it's not in the cache");
        final List<CffCompletion> c = await ref.read(cffProvider).complete(fs.stop, showIds: true);
        _cache[fs.stop] = c.first;
      }
    }
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(favorites.toList());

    _favs.clear();
    _favs.addAll(favStops);

    //? Routes
    final List<String> routes = _prefs.getStringList(routesKey) ?? [];
    _routes.clear();
    for (final spr in routes) {
      try {
        final decode = await Future.microtask(() => jsonDecode(spr));
        final r = LocalRoute.fromJson(decode as Map<String, dynamic>);
        _routes.add(r);
      } on Exception catch (e, s) {
        log("Error while trying to decode $spr", error: e, name: "Store");
        FirebaseCrashlytics.instance.recordError(e, s, printDetails: true);
      }
    }

    ref.read(favoritesRoutesStatesProvider).state = FavoritesRoutesStates.data(_routes.toList());

    if (notify) {
      await sync();
    }
    return favorites;
  }

  @override
  Future<void> addRoute(LocalRoute route) async {
    _routes.add(route);

    ref.read(favoritesRoutesStatesProvider).state = FavoritesRoutesStates.data(_routes.toList());
    await sync();
  }

  @override
  Future<void> removeRoute(LocalRoute route) async {
    _routes.remove(route);
    ref.read(favoritesRoutesStatesProvider).state = FavoritesRoutesStates.data(_routes.toList());
    await sync();
  }

  @override
  Future<void> addFavorite(CffCompletion completion, String displayName) async {
    ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
    await _checkState();
    final value = completion.label;
    if (value != null) {
      _cache[value] = completion;
      log("Added $completion", name: "Store");
    } else {
      log("Completion couldn't be added because label and id was null", name: "Store");
    }
    _favs.add(FavoriteStop(completion.label, name: displayName, completion: _cache[value]));
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(favorites.toList());
    await sync();
  }

  Future<void> sync() async {
    if (hasListeners) notifyListeners();
    await _prefs.setStringList(stopsKey, _favs.map((e) => jsonEncode(e.toJson())).toList());

    final routes = <String>[];

    for (final e in _routes) {
      try {
        routes.add(await Future.microtask(() => jsonEncode(e.toJson())));
      } on Exception catch (e, s) {
        log("Error while trying to encode $e", error: e, name: "Store");
        FirebaseCrashlytics.instance.recordError(e, s, printDetails: true);
      }
    }

    await _prefs.setStringList(routesKey, routes);
    await ref.read(quickActions).setActions(_routes.toList(), favorites.toList());
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
