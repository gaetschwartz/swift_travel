import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:swift_travel/models/favorites.dart';

import 'db.dart';

class RouteHistoryRepository extends LocalDatabase<int, String, LocalRoute>
    with IndexedDatabaseMixin {
  @visibleForTesting
  RouteHistoryRepository()
      : super(
          boxKey: 'route_history',
          maxSize: 250,
          decoder: (d) => LocalRoute.fromJson(jsonDecode(d) as Map<String, dynamic>),
          encoder: (d) => jsonEncode(d.toJson()),
        );

  static late final i = RouteHistoryRepository();

  List<LocalRoute> get history => values.toList(growable: false);

  Iterable<int> invalidKeys() sync* {
    for (final k in keys) {
      try {
        decoder(box.get(k)!);
      } catch (_) {
        yield k;
      }
    }
  }

  @override
  Future<void> open({String? path, bool doLog = false}) async {
    await super.open(path: path, doLog: doLog);
    await deleteAll(invalidKeys());
  }
}
