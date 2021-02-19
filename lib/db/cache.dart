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

  List<LineCacheEntry> get entries => values.toList(growable: false);

  @override
  Future<void> clean() async {
    if (kDebugMode) print('Total size exceeded max size, cleaning');
    await deleteAll(keys.take(20));
  }

  @override
  Future<void> open({String? path}) async {
    await super.open(path: path);
    await deleteOutdatedEntries();
  }

  Future<void> deleteOutdatedEntries() async {
    final toDelete = map.entries
        .where((e) => MockableDateTime.now().difference(e.value.timestamp).inMinutes > e.value.ttl)
        .map((e) => e.key);
    if (toDelete.isNotEmpty) print('Found these outdated cache entries: $toDelete');
    await deleteAll(toDelete);
  }
}
