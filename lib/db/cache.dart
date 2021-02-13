import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:swift_travel/db/models/cache.dart';
import 'package:swift_travel/mocking/mocking.dart';

import 'db.dart';

class LineCache extends LocalDatabase<String, Map, LineCacheEntry> with KeyedDatabaseMixin {
  LineCache._()
      : super(
          boxKey: 'line_cache',
          maxSize: 250,
          decoder: (d) => LineCacheEntry.fromJson(d.cast<String, dynamic>()),
          encoder: (d) => d.toJson(),
        );

  static late final i = LineCache._();

  @visibleForTesting
  factory LineCache() => LineCache._();

  List<LineCacheEntry> get entries => values.toList();

  @override
  Future<void> clean() async {
    if (kDebugMode) print('Total size exceeded max size, cleaning');
    await deleteAll(keys.take(20));
  }

  @override
  Future<void> open({String? path}) async {
    await super.open(path: path);
    final toDelete = <String>[];
    for (final e in map.entries) {
      if (CustomizableDateTime.current.difference(e.value.timestamp).inMinutes > e.value.ttl) {
        toDelete.add(e.key);
      }
    }
    print('Found these outdated cache entries: $toDelete');
    await deleteAll(toDelete);
  }
}
