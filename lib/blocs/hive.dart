import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/api/cff/models/favorite_stop.dart';
import 'package:swiss_travel/api/cff/models/local_route.dart';

class HiveBoxStore extends ChangeNotifier {
  final ProviderReference ref;
  HiveBoxStore(this.ref);

  Box<Map<String, dynamic>> _routesBox;
  Box<Map<String, dynamic>> _stopsBox;

  final Map<String, CffCompletion> _cache = {};
  final Set<String> _favs = {};
  final Set<LocalRoute> _routes = {};

  Future<void> addFavorite(CffCompletion completion, String name) async {
    final favoriteStop = FavoriteStop(completion.label, name: name);
    _cache[completion.label] = completion;
    await _stopsBox.put(completion.label, favoriteStop.toJson());
    sync();
  }

  Future<void> deleteFavorite(FavoriteStop stop) async {
    await _stopsBox.delete(stop.name);
    sync();
  }

  Future<void> addRoute(LocalRoute route) async {
    await _routesBox.put(route.hashCode, route.toJson());
    sync();
  }

  Future<void> removeRoute(LocalRoute route) async {
    await _routesBox.delete(route.hashCode);
    sync();
  }

  Map<String, CffCompletion> get cache => throw UnimplementedError();

  Iterable<FavoriteStop> get favorites => _stopsBox.values.map((m) => FavoriteStop.fromJson(m));

  Future<void> loadFromPreferences({
    SharedPreferences prefs,
    bool notify = true,
  }) async {
    _routesBox = await Hive.openBox<Map<String, dynamic>>("favorite-routes");
    _stopsBox = await Hive.openBox<Map<String, dynamic>>("favorite-stops");
  }

  Set<LocalRoute> get routes => throw UnimplementedError();

  Future<void> sync() {
    throw UnimplementedError();
  }
}
