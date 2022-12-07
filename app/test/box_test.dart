// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stop.dart';
import 'package:swift_travel/db/favorite_store.dart';
import 'package:swift_travel/models/favorites.dart';

void main() {
  setUpAll(() async {
    Hive.init('test/hive');
  });

  test('favRouteDb', () async {
    final db = FavRoutesDb();

    await db.open();
    await db.clear();

    expect(db.values, isEmpty);

    final dateTime = DateTime.now();
    const name2 = 'from';
    const name3 = 'to';
    const displayName2 = 'display';
    final id = await db.add(LocalRoute.v2(
      const SbbStop(name: name2),
      const SbbStop(name: name3),
      displayName: displayName2,
      timestamp: dateTime,
    ));

    expect(db.values, hasLength(1));
    expect(db.values.first, isA<LocalRouteV2>());
    expect(
        db.values.first,
        LocalRoute.v2(
          const SbbStop(name: name2),
          const SbbStop(name: name3),
          displayName: displayName2,
          timestamp: dateTime,
        ));
    // ignore: deprecated_member_use_from_same_package
    expect(db.values.first, isNot(const LocalRoute.v1(name2, name3)));

    for (final key in db.keys) {
      print('key: $key');
      print('value: ${db.get(key)}');
    }

    await db.delete(id);

    expect(db.values, isEmpty);
  });
}
