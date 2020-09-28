import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/api/cff/models/local_route.dart';
import 'package:swiss_travel/blocs/store.dart';

class HiveBoxStore extends FavoritesSharedPreferencesStore {
  Box _routesBox;
  Box _stopsBox;

  HiveBoxStore(ProviderReference ref) : super(ref);

  @override
  Future<void> addFavorite(CffCompletion completion) {
    throw UnimplementedError();
  }

  @override
  Future<void> addRoute(LocalRoute route) {
    throw UnimplementedError();
  }

  @override
  Map<String, CffCompletion> get cache => throw UnimplementedError();

  @override
  Future<void> deleteFavorite(CffCompletion completion) {
    throw UnimplementedError();
  }

  @override
  Iterable<CffCompletion> get favorites => throw UnimplementedError();

  @override
  Future<void> loadFromPreferences({
    SharedPreferences prefs,
    bool notify = true,
  }) async {
    _routesBox = await Hive.openBox<Map>("favorite-routes");
    _stopsBox = await Hive.openBox<Map>("favorite-stops");
  }

  @override
  Future<void> removeRoute(LocalRoute route) async {
    _routesBox.toMap();
  }

  @override
  Set<LocalRoute> get routes => throw UnimplementedError();

  @override
  Future<void> sync() {
    throw UnimplementedError();
  }
}
