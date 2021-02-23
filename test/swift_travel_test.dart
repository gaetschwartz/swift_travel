// ignore_for_file: unnecessary_await_in_return

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/completion.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route_connection.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/models/state_models.dart';
import 'package:swift_travel/utils/complete.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/route_uri.dart';

final timestamp = DateTime(2021);
const geneva = 'Genève';
final route1 = LocalRoute(geneva, 'Lausanne', timestamp: timestamp);
final route2 = LocalRoute('Lausanne', geneva, timestamp: timestamp);
final route3 = LocalRoute('Zürich', 'Bern', timestamp: timestamp);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('route history >', () {
    late RouteHistoryRepository hist;
    setUpAll(() async {
      final temp = await getTemporaryDirectory();
      final dir = path.join(temp.path, 'swift_travel', 'test_results', 'route_history');
      Hive.init(dir);
    });

    setUp(() {
      hist = RouteHistoryRepository();
    });

    tearDown(() async {
      await Hive.deleteBoxFromDisk(RouteHistoryRepository.i.boxKey);
    });

    test('add route', () async {
      await hist.open();

      await hist.clear();
      expect(hist.history, isEmpty);

      await hist.add(route1);
      expect(hist.history, [route1]);

      await hist.add(route2);
      expect(hist.history, [route1, route2]);

      await hist.add(route3);
      expect(hist.history, [route1, route2, route3]);

      expect(hist.first, route1);
      expect(hist.last, route3);

      await hist.box.deleteAt(0);
      expect(hist.history, [route2, route3]);

      await hist.box.deleteAt(hist.size - 1);
      expect(hist.history, [route2]);

      await hist.clear();
      expect(hist.history, isEmpty);

      expect(hist.watch(), emitsDone);

      await hist.box.close();
    });

    test(
      'instance is a singleton',
      () => expect(RouteHistoryRepository.i, RouteHistoryRepository.i),
    );

    test(
      'singleton != new instance',
      () => expect(RouteHistoryRepository.i, isNot(hist)),
    );

    test('throws when not accessed properly', () {
      expect(() async => await hist.add(route1), throwsAssertionError);
    });
    test('safe add works', () async {
      await hist.safeAdd(route1);
      expect(hist.history, [route1]);
    });

    test('completion', () async {
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
          SbbCompletion(label: route1.from, origin: DataOrigin.history),
          SbbCompletion(label: route1.to, origin: DataOrigin.history),
          SbbCompletion(label: route3.from, origin: DataOrigin.history),
        ],
      );
    });
  });

  group('models >', () {
    setUp(() {
      MockableDateTime.mocked = DateTime(2021);
    });
    test('localRoute', () {
      final route1 =
          LocalRoute('from', 'to', displayName: 'name', timestamp: MockableDateTime.now());
      final route2 = LocalRoute.fromRouteConnection(
          const SbbRouteConnection(from: 'from', to: 'to', depDelay: 0),
          displayName: 'name',
          timestamp: MockableDateTime.now());
      final route3 = LocalRoute.now('from', 'to', displayName: 'name');
      final json = {
        'from': 'from',
        'to': 'to',
        'displayName': 'name',
        'timestamp': '2021-01-01T00:00:00.000'
      };
      final route4 = LocalRoute.fromJson(json);
      expect(route1, equals(route2));
      expect(route2, equals(route3));
      expect(route3, equals(route4));
    });

    test('favoriteStop', () {
      const stop1 = FavoriteStop(stop: geneva, name: geneva, api: NavigationApi.sbb);
      final stop2 = FavoriteStop.fromStop(geneva, api: NavigationApi.sbb);
      final stop3 =
          FavoriteStop.fromCompletion(SbbCompletion(label: geneva), api: NavigationApi.sbb);
      final stop4 =
          FavoriteStop.fromJson(<String, Object>{'stop': geneva, 'name': geneva, 'api': 'sbb'});

      expect(stop1, equals(stop2));
      expect(stop2, equals(stop3));
      expect(stop3, equals(stop4));
    });
  });

  test('env', () {
    expect(Env.map.keys.length, 6);
    expect(Env.summary, isNotEmpty);
  });

  test('completion', () {
    const currentLocation = 'Current location';

    final c = completeWithFavorites(
      favorites: [
        FavoriteStop.fromStop(geneva, api: NavigationApi.sbb),
        FavoriteStop.fromStop('Genève gare', api: NavigationApi.sbb),
        FavoriteStop.fromStop('Genève nord', api: NavigationApi.sbb),
        FavoriteStop.fromStop('Lausanne Aéroport', api: NavigationApi.sbb),
      ],
      completions: [
        SbbCompletion(label: geneva),
      ],
      query: geneva,
      currentLocationString: currentLocation,
      history: [
        route1,
      ],
    );

    expect(c, [
      SbbCompletion(label: currentLocation, origin: DataOrigin.currentLocation),
      SbbCompletion(label: route1.from, origin: DataOrigin.history),
      SbbCompletion(label: route1.to, origin: DataOrigin.history),
      SbbCompletion.fromFavorite(FavoriteStop.fromStop(geneva, api: NavigationApi.sbb)),
      SbbCompletion.fromFavorite(FavoriteStop.fromStop('Genève gare', api: NavigationApi.sbb)),
      SbbCompletion.fromFavorite(FavoriteStop.fromStop('Genève nord', api: NavigationApi.sbb)),
      SbbCompletion(label: 'Genève')
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

      for (final params in paramList) {
        final uri = SearchChApi.queryBuilder('route', params);
        expect(() => encodeRouteUri(uri, 0), throwsFormatException);
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
      const builder = SearchChApi.queryBuilder;

      for (final params in paramList) {
        final url = builder('route', params);

        final encoded = encodeRouteUri(url, 0);
        final decoded = decodeRouteUri(builder('route', encoded));

        expect(decoded, params);
      }
    });
  });
}
