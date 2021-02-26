import 'package:flutter/cupertino.dart';
import 'package:swift_travel/models/favorites.dart';

import 'db.dart';

class RouteHistoryRepository extends LocalDatabase<int, Map, LocalRoute> with IndexedDatabaseMixin {
  @visibleForTesting
  RouteHistoryRepository()
      : super(
          boxKey: 'route_history',
          maxSize: 250,
          decoder: (d) => LocalRoute.fromJson(d.cast<String, dynamic>()),
          encoder: (d) => d.toJson(),
        );

  static late final i = RouteHistoryRepository();

  List<LocalRoute> get history => values.toList(growable: false);
}
