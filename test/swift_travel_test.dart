// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:swift_travel/apis/search.ch/cff.dart';
import 'package:swift_travel/apis/search.ch/models/cff_completion.dart';
import 'package:swift_travel/apis/search.ch/models/route_connection.dart';
import 'package:swift_travel/db/database.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/utils/complete.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/route_uri.dart';

const geneva = 'Genève';
const route1 = LocalRoute(geneva, 'Lausanne');
const route2 = LocalRoute('Lausanne', geneva);
const route3 = LocalRoute('Zürich', 'Bern');

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final dir = path.join('test', 'test_results', 'route_history');

  group('route history >', () {
    setUpAll(() async {
      await Hive.init(dir);
    });

    tearDown(() async {
      await Hive.close();
      await Hive.deleteBoxFromDisk(RouteHistoryRepository.boxKey);
    });
    test('add route', () async {
      final hist = RouteHistoryRepository.newInstance();

      await hist.open();

      await hist.clear();
      expect(hist.routes, isEmpty);

      await hist.add(route1);
      expect(hist.routes, [route1]);

      await hist.add(route2);
      expect(hist.routes, [route1, route2]);

      await hist.add(route3);
      expect(hist.routes, [route1, route2, route3]);

      expect(hist.first, route1);
      expect(hist.last, route3);

      await hist.box.deleteAt(0);
      expect(hist.routes, [route2, route3]);

      await hist.box.deleteAt(hist.size - 1);
      expect(hist.routes, [route2]);

      await hist.clear();
      expect(hist.routes, isEmpty);

      expect(hist.watch(), emitsDone);

      await hist.box.close();
    });

    test(
      'instance is a singleton',
      () {
        expect(RouteHistoryRepository.i, RouteHistoryRepository.i);
      },
    );

    test('throws when not accessed properly', () async {
      final hist = RouteHistoryRepository.newInstance();

      expect(() async => await hist.add(route1), throwsAssertionError);
    });
    test('safe add works', () async {
      final hist = RouteHistoryRepository.newInstance();

      await hist.safeAdd(route1);
      expect(hist.routes, [route1]);
    });

    test('completion', () async {
      final hist = RouteHistoryRepository.newInstance();

      await hist.open();

      final c = completeWithFavorites(
          favorites: [],
          completions: [],
          query: 'query',
          history: [
            route1,
            route3,
            route1,
            route3,
          ]);

      expect(
        c,
        [
          CffCompletion(label: route1.from, origin: DataOrigin.history),
          CffCompletion(label: route1.to, origin: DataOrigin.history),
          CffCompletion(label: route3.from, origin: DataOrigin.history),
        ],
      );
    });
  });

  group('models >', () {
    setUpAll(() {
      CustomizableDateTime.customTime = DateTime(2021);
    });
    test('localRoute', () {
      final route1 =
          LocalRoute('from', 'to', displayName: 'name', timestamp: CustomizableDateTime.current);
      final route2 = LocalRoute.fromRouteConnection(const RouteConnection(from: 'from', to: 'to'),
          displayName: 'name', timestamp: CustomizableDateTime.current);
      final route3 = LocalRoute.now('from', 'to', displayName: 'name');
      final route4 = LocalRoute.fromJson({
        'from': 'from',
        'to': 'to',
        'displayName': 'name',
        'timestamp': '2021-01-01T00:00:00.000'
      });
      expect(route1, equals(route2));
      expect(route2, equals(route3));
      expect(route3, equals(route4));
    });

    test('favoriteStop', () {
      const stop1 = FavoriteStop(geneva, name: geneva);
      final stop2 = FavoriteStop.fromStop(geneva);
      final stop3 = FavoriteStop.fromCompletion(const CffCompletion(label: geneva));
      final stop4 = FavoriteStop.fromJson({'stop': geneva, 'name': geneva});

      expect(stop1, equals(stop2));
      expect(stop2, equals(stop3));
      expect(stop3, equals(stop4));
    });
  });

  test('env', () {
    expect(Env.map.keys.length, 5);
    expect(Env.summary, isNotEmpty);
  });

  test('completion', () {
    const currentLocation = 'Current location';

    final c = completeWithFavorites(
      favorites: [
        FavoriteStop.fromStop(geneva),
        FavoriteStop.fromStop('Genève gare'),
        FavoriteStop.fromStop('Genève nord'),
        FavoriteStop.fromStop('Lausanne Aéroport'),
      ],
      completions: [
        const CffCompletion(label: geneva),
      ],
      query: geneva,
      currentLocationString: currentLocation,
      history: [
        route1,
      ],
    );

    expect(c, [
      const CffCompletion(label: currentLocation, origin: DataOrigin.currentLocation),
      CffCompletion(label: route1.from, origin: DataOrigin.history),
      CffCompletion(label: route1.to, origin: DataOrigin.history),
      CffCompletion.fromFavorite(FavoriteStop.fromStop(geneva)),
      CffCompletion.fromFavorite(FavoriteStop.fromStop('Genève gare')),
      CffCompletion.fromFavorite(FavoriteStop.fromStop('Genève nord')),
      const CffCompletion(label: 'Genève')
    ]);
  });

  group('route uri >', () {
    final r = Random();
    test('encode/decoded', () {
      for (var i = 0; i < 10000; i++) {
        final l = List.generate(r.nextInt(10), (_) => r.nextBool());
        final encoded = encodeArgsToInt(l);
        final decoded = decodeIntToArgs(encoded, l.length);

        expect(decoded, l);
      }
    });

    test("encode malformed data doesn't work", () {
      final paramList = [
        {
          'from': 'Genève Aéroport',
          'to': 'Berne',
          'date': '30/1/2021/',
          'time': '13:46',
          'time_type': describeEnum(TimeType.arrival),
          'show_trackchanges': 1,
          'show_delays': 1,
        },
        {
          'from': 'Genève Aéroport',
          'to': 'Berne',
          'date': '30/1/',
          'time': '13:46',
          'time_type': describeEnum(TimeType.arrival),
          'show_trackchanges': 1,
          'show_delays': 1,
        },
        {
          'from': 'Genève Aéroport',
          'to': 'Berne',
          'date': '30/1/2021',
          'time': '13::41',
          'time_type': describeEnum(TimeType.arrival),
          'show_trackchanges': 1,
          'show_delays': 1,
        },
        {
          'from': 'Genève Aéroport',
          'to': 'Berne',
          'date': '//',
          'time': ':',
          'time_type': describeEnum(TimeType.arrival),
          'show_trackchanges': 1,
          'show_delays': 1,
        },
      ].map((e) => e.map((key, value) => MapEntry(key, value.toString())));
      final builder = QueryBuilder('https://timetable.search.ch/api', (s) => '$s.json');

      for (final params in paramList) {
        final url = builder('route', params);
        expect(() => encodeRouteUri(Uri.parse(url), 0), throwsFormatException);
      }
    });
    test('encode(decode(x)) == x', () {
      final paramList = [
        {
          'from': 'Genève Aéroport',
          'to': 'Berne',
          'date': '1/30/2021',
          'time': '13:46',
          'time_type': describeEnum(TimeType.arrival),
          'show_trackchanges': 1,
          'show_delays': 1,
        },
        {
          'from': 'Université de Genève, Genève, Rue du Général-Dufour 24',
          'to': 'Badenerstrasse 549, 8048 Zürich',
          'date': '12/31/2021',
          'time': '0:0',
          'time_type': describeEnum(TimeType.depart),
          'show_trackchanges': 0,
          'show_delays': 0,
        },
      ].map((e) => e.map((key, value) => MapEntry(key, value.toString())));
      final builder = QueryBuilder('https://timetable.search.ch/api', (s) => '$s.json');

      for (final params in paramList) {
        final url = builder('route', params);

        final encoded = encodeRouteUri(Uri.parse(url), 0);
        final decoded = decodeRouteUri(Uri.parse(builder('route', encoded)));

        expect(decoded, params);
      }
    });
  });
}
