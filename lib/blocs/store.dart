import 'dart:convert';
import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/api/cff/cff_completion.dart';
import 'package:swiss_travel/api/cff/local_route.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/quick_actions.dart';
import 'package:swiss_travel/models/favorites_routes_states.dart';
import 'package:swiss_travel/models/favorites_states.dart';

abstract class FavoritesStoreBase extends ChangeNotifier {
  Future<List<CffCompletion>> getFavorites({bool notify = true});
  Future<void> addFavorite(CffCompletion completion);
  Future<void> deleteFavorite(CffCompletion completion);
  Future<void> addRoute(LocalRoute route);
  Future<void> removeRoute(LocalRoute route);
}

final storeProvider = ChangeNotifierProvider<FavoritesStoreBase>(
    (r) => FavoritesSharedPreferencesStore(r));
final favoritesStatesProvider =
    StateProvider<FavoritesStates>((_) => const FavoritesStates.loading());
final favoritesRoutesStatesProvider = StateProvider<FavoritesRoutesStates>(
    (_) => const FavoritesRoutesStates.loading());

class FavoritesSharedPreferencesStore extends FavoritesStoreBase {
  static const stopsKey = "favoritesStop";
  static const routesKey = "favoritesRoutes";

  final ProviderReference ref;
  FavoritesSharedPreferencesStore(this.ref);

  SharedPreferences _prefs;

  final Map<String, CffCompletion> _cache = {};
  final Set<String> _favs = {};
  final Set<LocalRoute> _routes = {};

  Set<LocalRoute> get routes => _routes;

  Future<void> _checkState() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Map<String, CffCompletion> get cache => _cache;

  Iterable<CffCompletion> get favorites =>
      _favs.map((e) => _cache[e]).where((e) => e != null);

  @override
  Future<List<CffCompletion>> getFavorites({bool notify = true}) async {
    log("Gettings favorites", name: "Store");
    if (notify) {
      ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
    }
    _prefs = await SharedPreferences.getInstance();

    //? Stops

    final List<String> favsIds = _prefs.getStringList(stopsKey) ?? [];
    _favs.clear();
    _favs.addAll(favsIds);
    if (_cache.length >= 50) _cache.clear();
    final List<CffCompletion> lComp = [];
    for (final l in favsIds) {
      if (_cache[l] == null) {
        log("Fetching $l because it's not in the cache");
        final List<CffCompletion> c =
            await ref.read(cffProvider).complete(l, showIds: true);
        _cache[l] = c.first;
      }
      lComp.add(_cache[l]);
    }
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(lComp);

    //? Routes

    final List<String> routes = _prefs.getStringList(routesKey) ?? [];
    _routes.clear();
    for (final spr in routes) {
      try {
        final decode = await Future.microtask(() => jsonDecode(spr));
        final r = LocalRoute.fromJson(decode as Map<String, dynamic>);
        _routes.add(r);
      } on Exception catch (e) {
        log("Error while trying to decode $spr", error: e, name: "Store");
        FirebaseCrashlytics.instance
            .recordError(e, StackTrace.current, printDetails: true);
      }
    }

    ref.read(favoritesRoutesStatesProvider).state =
        FavoritesRoutesStates.data(_routes.toList());

    if (notify) {
      await sync();
    }
    return lComp;
  }

  @override
  Future<void> addRoute(LocalRoute route) async {
    _routes.add(route);

    ref.read(favoritesRoutesStatesProvider).state =
        FavoritesRoutesStates.data(_routes.toList());
    await sync();
  }

  @override
  Future<void> removeRoute(LocalRoute route) async {
    _routes.remove(route);
    ref.read(favoritesRoutesStatesProvider).state =
        FavoritesRoutesStates.data(_routes.toList());
    await sync();
  }

  @override
  Future<void> addFavorite(CffCompletion completion) async {
    ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
    await _checkState();
    final list = await getFavorites(notify: false);
    _favs.add(completion.id ?? completion.label);
    ref.read(favoritesStatesProvider).state =
        FavoritesStates.data(list..add(completion));
    await sync();
  }

  Future<void> sync() async {
    if (hasListeners) notifyListeners();
    await _prefs.setStringList(stopsKey, _favs.toList());

    final routes = <String>[];

    for (final e in _routes) {
      try {
        routes.add(await Future.microtask(() => jsonEncode(e.toJson())));
      } on Exception catch (e) {
        log("Error while trying to encode $e", error: e, name: "Store");
        FirebaseCrashlytics.instance
            .recordError(e, StackTrace.current, printDetails: true);
      }
    }

    await _prefs.setStringList(routesKey, routes);
    await ref.read(quickActions).setRoutes(_routes.toList());
  }

  @override
  Future<void> deleteFavorite(CffCompletion completion) async {
    ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
    await _checkState();
    final list = await getFavorites(notify: false);
    _favs.removeWhere((s) => s == completion.label || s == completion.id);

    await sync();
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(list
      ..removeWhere(
          (c) => c.label == completion.label || c.id == completion.id));
  }
}
