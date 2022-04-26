import 'package:flutter/foundation.dart';
import 'package:gaets_logging/logging.dart';
import 'package:swift_travel/db/models/cache.dart';
import 'package:swift_travel/mocking/mocking.dart';

import 'db.dart';

class LineCache extends LocalDatabase<String, Map, LineCacheEntry>
    with KeyedDatabaseMixin {
  @visibleForTesting
  LineCache()
      : super(
          boxKey: 'line_cache',
          maxSize: 250,
          decode: (d) => LineCacheEntry.fromJson(d.cast<String, dynamic>()),
          encode: (d) => d.toJson(),
        );

  static final i = LineCache();

  List<LineCacheEntry> get entries => values.toList(growable: false);

  @override
  Future<void> onDatabaseExceededMaxSize() async {
    if (kDebugMode) {
      log.log('Total size exceeded max size, cleaning');
    }
    await deleteAll(keys.take(20));
  }

  @override
  Future<void> open({String? path, bool doLog = true}) async {
    await super.open(path: path, doLog: doLog);
    await deleteOutdatedEntries();
  }

  Future<void> deleteOutdatedEntries() async {
    final now = FakeableDateTime.now();
    final toDelete = map.entries
        .where((e) => now.difference(e.value.timestamp).inMinutes > e.value.ttl)
        .map((e) => e.key);
    if (kDebugMode && toDelete.isNotEmpty) {
      log.log(
        'Found these outdated cache entries: ${toDelete.map(Uri.decodeComponent)}',
      );
    }
    await deleteAll(toDelete);
  }
}
