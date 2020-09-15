import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/api/cff/cff_completion.dart';
import 'package:swiss_travel/api/cff/local_route.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/models/favorites_routes_states.dart';
import 'package:swiss_travel/models/favorites_states.dart';

abstract class FavoritesStoreBase {
  Future<List<CffCompletion>> getFavorites({bool notify = true});
  Future<void> addFavorite(CffCompletion completion);
  Future<void> deleteFavorite(CffCompletion completion);
  Future<void> addRoute(LocalRoute route);
  Future<void> removeRoute(LocalRoute route);
}

final favoritesProvider = Provider<FavoritesStoreBase>((r) => FavoritesSharedPreferencesStore(r));
final favoritesStatesProvider =
    StateProvider<FavoritesStates>((_) => const FavoritesStates.loading());
final favoritesRoutesStatesProvider =
    StateProvider<FavoritesRoutesStates>((_) => const FavoritesRoutesStates.loading());

class FavoritesSharedPreferencesStore implements FavoritesStoreBase {
  static const _stopsKey = "favoritesStop";
  static const _routesKey = "favoritesRoutes";

  final ProviderReference ref;
  FavoritesSharedPreferencesStore(this.ref);

  SharedPreferences _prefs;

  final Map<String, CffCompletion> _cache = {};
  final Set<String> _favs = {};
  final Set<LocalRoute> _routes = {};

  Future<void> _checkState() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Map<String, CffCompletion> get completions => _cache;

  @override
  Future<List<CffCompletion>> getFavorites({bool notify = true}) async {
    if (notify) ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
    _prefs = await SharedPreferences.getInstance();

    //? Stops

    final List<String> favsIds = _prefs.getStringList(_stopsKey) ?? [];
    _favs.clear();
    _favs.addAll(favsIds);
    if (_cache.length >= 50) _cache.clear();
    final List<CffCompletion> lComp = [];
    for (final l in favsIds) {
      if (_cache[l] == null) {
        log("Fetching $l because it's not in the cache");
        final List<CffCompletion> c = await ref.read(cffProvider).complete(l, showIds: true);
        _cache[l] = c.first;
      }
      lComp.add(_cache[l]);
    }
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(lComp);

    //? Routes

    final List<String> routes = _prefs.getStringList(_routesKey) ?? [];
    _routes.clear();
    for (final spr in routes) {
      final split = spr.split(",");
      if (split.length != 2) {
        throw StateError("Invalid local route $spr");
      }
      final r = LocalRoute(Uri.decodeComponent(split.first), Uri.decodeComponent(split.last));
      _routes.add(r);
    }

    ref.read(favoritesRoutesStatesProvider).state = FavoritesRoutesStates.data(_routes.toList());

    await sync();
    return lComp;
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
  Future<void> addFavorite(CffCompletion completion) async {
    ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
    await _checkState();
    final list = await getFavorites(notify: false);
    _favs.add(completion.id ?? completion.label);
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(list..add(completion));
    await sync();
  }

  Future<void> sync() async {
    await _prefs.setStringList(_stopsKey, _favs.toList());
    await _prefs.setStringList(_routesKey,
        _routes.map((e) => "${Uri.encodeComponent(e.from)},${Uri.encodeComponent(e.to)}").toList());
  }

  @override
  Future<void> deleteFavorite(CffCompletion completion) async {
    ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
    await _checkState();
    final list = await getFavorites(notify: false);
    _favs.removeWhere((s) => s == completion.label || s == completion.id);

    await sync();
    ref.read(favoritesStatesProvider).state = FavoritesStates.data(
        list..removeWhere((c) => c.label == completion.label || c.id == completion.id));
  }
}
