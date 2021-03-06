import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:swift_travel/db/models/cache.dart';
import 'package:swift_travel/mocking/mocking.dart';

import 'db.dart';

class LineCache extends LocalDatabase<String, Map, LineCacheEntry> with KeyedDatabaseMixin {
  @visibleForTesting
  LineCache()
      : super(
          boxKey: 'line_cache',
          maxSize: 250,
          decode: (d) => LineCacheEntry.fromJson(d.cast<String, dynamic>()),
          encode: (d) => d.toJson(),
        );

  static late final i = LineCache();

  List<LineCacheEntry> get entries => values.toList(growable: false);

  @override
  Future<void> onDatabaseExceededMaxSize() async {
    if (kDebugMode) {
      log('Total size exceeded max size, cleaning');
    }
    await deleteAll(keys.take(20));
  }

  @override
  Future<void> open({String? path, bool doLog = true}) async {
    await super.open(path: path, doLog: doLog);
    await deleteOutdatedEntries();
  }

  Future<void> deleteOutdatedEntries() async {
    final toDelete = map.entries
        .where((e) => FakeableDateTime.now().difference(e.value.timestamp).inMinutes > e.value.ttl)
        .map((e) => e.key);
    if (kDebugMode && toDelete.isNotEmpty) {
      log('Found these outdated cache entries: $toDelete');
    }
    await deleteAll(toDelete);
  }
}
