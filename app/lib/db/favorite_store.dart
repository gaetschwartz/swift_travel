// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/db/db.dart';
import 'package:swift_travel/models/favorites.dart';

final favoritesStoreProvider =
    ChangeNotifierProvider<BaseFavoritesStore>((_) => HiveFavoritesStore());

class HiveFavoritesStore extends BaseFavoritesStore {
  final favoritesDb = FavoritesDatabase();

  @override
  Future<DataWithId<LocalRoute>> addRoute(LocalRoute route) async {
    final id = newUuid();
    await favoritesDb.put(id, QuickActionsItem.route(route, id: id));
    notifyListeners();
    return DataWithId(id, route);
  }

  int newUuid() =>
      DateTime.now().millisecondsSinceEpoch ^ Random().nextInt(1000);

  @override
  Future<DataWithId<FavoriteStop>> addStop(FavoriteStop stop) async {
    final id = newUuid();
    await favoritesDb.put(id, QuickActionsItem.stop(stop, id: id));
    notifyListeners();
    return DataWithId(id, stop);
  }

  @override
  Future<void> init({bool doNotify = true}) async {
    await favoritesDb.open();
    notifyListeners();
  }

  @override
  Future<void> removeRoute(DataWithId<LocalRoute> route) async {
    await favoritesDb.delete(route.id);
    notifyListeners();
  }

  @override
  Future<void> removeStop(DataWithId<FavoriteStop> favoriteStop) async {
    await favoritesDb.delete(favoriteStop.id);
    notifyListeners();
  }

  @override
  Iterable<DataWithId<LocalRoute>> get routes => favoritesDb.values
      .whereType<FavoriteUnionRoute>()
      .map((e) => DataWithId(e.id, e.route));

  @override
  Iterable<DataWithId<FavoriteStop>> get stops => favoritesDb.values
      .whereType<FavoriteUnionStop>()
      .map((e) => DataWithId(e.id, e.stop));

  @override
  Iterable<QuickActionsItem> get items => favoritesDb.values;

  @override
  void dispose() {
    unawaited(favoritesDb.close());
    super.dispose();
  }

  @override
  Future<void> save(List<QuickActionsItem> list) async {
    await favoritesDb.putAll({for (var e in list) e.id: e});
  }
}

abstract class BaseFavoritesStore extends ChangeNotifier {
  Future<void> init({bool doNotify = true});
  Future<DataWithId<FavoriteStop>> addStop(FavoriteStop stop);
  Future<void> removeStop(DataWithId<FavoriteStop> favoriteStop);
  Future<DataWithId<LocalRoute>> addRoute(LocalRoute route);
  Future<void> removeRoute(DataWithId<LocalRoute> route);

  Iterable<DataWithId<LocalRoute>> get routes;
  Iterable<DataWithId<FavoriteStop>> get stops;
  Iterable<QuickActionsItem> get items;

  Future<void> save(List<QuickActionsItem> list);

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
  }
}

class FavoritesDatabase
    extends LocalDatabase<int, Map<dynamic, dynamic>, QuickActionsItem> {
  FavoritesDatabase() : this._();

  FavoritesDatabase._()
      : super(
          boxKey: 'favorites',
          maxSize: 0,
          decode: (d) => QuickActionsItem.fromJson(d.cast<String, dynamic>()),
          encode: (d) => d.toJson(),
        );

  static final i = FavoritesDatabase();

  List<QuickActionsItem> get items => values.toList(growable: false);

  /// Do nothing.
  @override
  void onDatabaseExceededMaxSize() {}
}
