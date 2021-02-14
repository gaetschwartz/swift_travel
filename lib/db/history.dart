import 'package:flutter/cupertino.dart';
import 'package:swift_travel/models/local_route.dart';

import 'db.dart';

class RouteHistoryRepository extends LocalDatabase<int, Map, LocalRoute> with IndexedDatabaseMixin {
  RouteHistoryRepository._()
      : super(
          boxKey: 'route_history',
          maxSize: 250,
          decoder: (d) => LocalRoute.fromJson(d.cast<String, dynamic>()),
          encoder: (d) => d.toJson(),
        );

  static late final i = RouteHistoryRepository._();

  @visibleForTesting
  factory RouteHistoryRepository() => RouteHistoryRepository._();

  List<LocalRoute> get routes => values.toList();
}
