import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:swift_travel/models/favorites.dart';

import 'db.dart';

class RouteHistoryRepository extends LocalDatabase<int, String, LocalRoute>
    with IndexedDatabaseMixin {
  @visibleForTesting
  RouteHistoryRepository({int maxSize = 512})
      : super(
          boxKey: 'route_history',
          maxSize: maxSize,
          decode: (d) =>
              LocalRoute.fromJson(jsonDecode(d) as Map<String, dynamic>),
          encode: (d) => jsonEncode(d.toJson()),
        );

  static final instance = RouteHistoryRepository();

  List<LocalRoute> get history => values.toList(growable: false);

  Iterable<int> invalidKeys() sync* {
    for (final k in keys) {
      try {
        decode(box.get(k)!);
        // ignore: avoid_catches_without_on_clauses
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
