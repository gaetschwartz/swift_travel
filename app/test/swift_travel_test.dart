// ignore_for_file: unnecessary_await_in_return

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/completion.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route_connection.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/db.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/utils/predict/complete.dart';
import 'package:swift_travel/utils/route_uri.dart';

import 'apis_test.dart';
import 'blocs_test.dart';

final timestamp = DateTime(2021);
const geneva = 'Genève';
final route1 = LocalRoute.v1(geneva, 'Lausanne', timestamp: timestamp);
final route2 = LocalRoute.v1('Lausanne', geneva, timestamp: timestamp);
final route3 = LocalRoute.v1('Zürich', 'Bern', timestamp: timestamp);

String _byteSizeOf(int bytes, {int fixed = 0}) {
  const sizes = ['b', 'Kb', 'Mb', 'Gb'];
  var i = 0;
  var b = bytes;
  while (b > 1024 && i < sizes.length - 1) {
    b >>= 10;
    i++;
  }
  return '${b.toStringAsFixed(fixed)} ${sizes[i]}';
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('route history >', () {
    late RouteHistoryRepository hist;
    setUpAll(() async {
      final temp = await getTempDirForTests();
      final dir = path.join(temp.path, 'swift_travel', 'test_results', 'route_history');
      Hive.init(dir);
    });

    setUp(() async {
      hist = RouteHistoryRepository();
      await hist.open();
    });

    tearDown(() async {
      await Hive.deleteBoxFromDisk(RouteHistoryRepository.i.boxKey);
    });

    test('size is smaller than 1 Mb for maxSize', () async {
      for (var i = 0; i < hist.maxSize; i++) {
        await hist.add(LocalRoute.v1('from-$i', 'to-$i'));
      }

      final f = File(hist.box.path!);

      final size = f.lengthSync();
      print('History of ${hist.maxSize} items is of size ${_byteSizeOf(size)}');
      expect(size, lessThan(1 << 20));
    });

    test("doesn't go above maxSize", () async {
      for (var i = 0; i < hist.maxSize + 50; i++) {
        await hist.add(LocalRoute.v1('from-$i', 'to-$i'));
      }
      expect(hist.size, lessThanOrEqualTo(hist.maxSize));
    });

    test('add route', () async {
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
      () => expect(RouteHistoryRepository.i, isNot(RouteHistoryRepository())),
    );

    test('throws when not accessed properly', () {
      final hist = RouteHistoryRepository();
      expect(() async => await hist.add(route1), throwsAssertionError);
    });
    test('safe add works', () async {
      final hist = RouteHistoryRepository();
      await hist.safeAdd(route1);
      expect(hist.history, [route1]);
    });

    test('completion', () async {
      final container = ProviderContainer(overrides: [
        completionEngineProvider.overrideWithProvider(
          Provider(
            (ref) => CompletionEngine(
              ref,
              routeHistoryRepository: MockRouteHistory(
                mockedHistory: [
                  route1,
                  route3,
                  route1,
                  route3,
                ],
              ),
            ),
          ),
        ),
        navigationAPIProvider.overrideWithValue(MockNavigationApi(mockCompletions: []))
      ]);

      final c = await container.read(completionEngineProvider).complete(query: 'query').last;

      expect(
        c,
        [
          SbbCompletion(label: route1.fromAsString, origin: DataOrigin.history),
          SbbCompletion(label: route1.toAsString, origin: DataOrigin.history),
          SbbCompletion(label: route3.fromAsString, origin: DataOrigin.history),
        ],
      );
    });
  });

  group('models >', () {
    setUp(() {
      FakeableDateTime.fakeDate = DateTime(2021);
    });
    test('localRoute', () {
      final route1 = LocalRoute.v2(const SbbStop('from'), const SbbStop('to'),
          displayName: 'name', timestamp: FakeableDateTime.now());
      final route2 = LocalRoute.fromRouteConnection(
        SbbRouteConnection(from: 'from', to: 'to', depDelay: 0, departure: FakeableDateTime.now()),
        displayName: 'name',
      );
      final json = {
        'from': const SbbStop('from').toJson(),
        'to': const SbbStop('to').toJson(),
        'displayName': 'name',
        'timestamp': FakeableDateTime.now().toIso8601String(),
        'runtimeType': 'v2',
      };
      final route3 = LocalRoute.fromJson(json);
      expect(route1, equals(route2));
      expect(route2, equals(route3));
    });

    test('favoriteStop', () {
      final stop1 = FavoriteStop(stop: geneva, name: geneva, api: searchChApi.id.id);
      final stop2 = FavoriteStop.fromStop(geneva, api: searchChApi.id);
      final stop3 = FavoriteStop.fromCompletion(SbbCompletion(label: geneva), api: searchChApi.id);
      final stop4 =
          FavoriteStop.fromJson(<String, Object>{'stop': geneva, 'name': geneva, 'api': 'sbb'});

      expect(stop1, equals(stop2));
      expect(stop2, equals(stop3));
      expect(stop3, equals(stop4));
    });
  });

  test('env', () {
    expect(Env.env.keys, isNotEmpty);
    expect(Env.summary, isNotEmpty);
  });

  test('completion', () async {
    const currentLocation = 'Current location';

    final container = ProviderContainer(
      overrides: [
        storeProvider.overrideWithProvider(Provider((ref) => MockFavoriteStore(stops: [
              FavoriteStop.fromStop(geneva, api: searchChApi.id),
              FavoriteStop.fromStop('Genève gare', api: searchChApi.id),
              FavoriteStop.fromStop('Genève nord', api: searchChApi.id),
              FavoriteStop.fromStop('Lausanne Aéroport', api: searchChApi.id),
            ]))),
        navigationAPIProvider.overrideWithProvider(
          Provider.autoDispose(
            (ref) => MockNavigationApi(mockCompletions: [SbbCompletion(label: geneva)]),
          ),
        ),
        completionEngineProvider.overrideWithProvider(
          Provider(
            (ref) => CompletionEngine(
              ref,
              routeHistoryRepository: MockRouteHistory(mockedHistory: [route1]),
            ),
          ),
        )
      ],
    );

    final c = await container
        .read(completionEngineProvider)
        .complete(
          query: geneva,
          currentLocationString: currentLocation,
        )
        .last;

    final expected = [
      SbbCompletion(label: currentLocation, origin: DataOrigin.currentLocation),
      SbbCompletion(label: route1.fromAsString, origin: DataOrigin.history),
      SbbCompletion(label: route1.toAsString, origin: DataOrigin.history),
      SbbCompletion.fromFavorite(FavoriteStop.fromStop(geneva, api: searchChApi.id)),
      SbbCompletion.fromFavorite(FavoriteStop.fromStop('Genève gare', api: searchChApi.id)),
      SbbCompletion.fromFavorite(FavoriteStop.fromStop('Genève nord', api: searchChApi.id)),
      SbbCompletion(label: 'Genève'),
    ];

    expect(c, expected);
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

class MockFavoriteStore implements BaseFavoritesStore {
  MockFavoriteStore({this.routes = const [], this.stops = const []});

  @override
  final Iterable<LocalRoute> routes;
  @override
  final Iterable<FavoriteStop> stops;

  @override
  void addListener(VoidCallback listener) {}

  @override
  Future<void> addRoute(LocalRoute route) {
    throw UnimplementedError();
  }

  @override
  Future<void> addStop(FavoriteStop stop) {
    throw UnimplementedError();
  }

  @override
  void dispose() {}

  @override
  bool get hasListeners => throw UnimplementedError();

  @override
  Future<void> init({SharedPreferences? prefs, bool doNotify = true}) {
    throw UnimplementedError();
  }

  @override
  void notifyListeners() {}

  @override
  void removeListener(VoidCallback listener) {}

  @override
  Future<void> removeRoute(LocalRoute route) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeStop(FavoriteStop favoriteStop) {
    throw UnimplementedError();
  }
}

class MockRouteHistory implements RouteHistoryRepository {
  MockRouteHistory({List<LocalRoute> mockedHistory = const <LocalRoute>[]})
      : history = mockedHistory;

  @override
  final List<LocalRoute> history;

  @override
  // ignore: must_call_super
  Future<void> open({String? path, bool doLog = false}) async {}
  @override
  // ignore: must_call_super
  Future<void> close() async {}

  @override
  Future<int> add(LocalRoute data) {
    throw UnimplementedError();
  }

  @override
  Box<String> get box => throw UnimplementedError();

  @override
  String get boxKey => throw UnimplementedError();

  @override
  Future<int> clear() {
    throw UnimplementedError();
  }

  @override
  bool containsKey(int key) {
    throw UnimplementedError();
  }

  @override
  DataConverter<String, LocalRoute> get decode => throw UnimplementedError();

  @override
  Future<void> delete(int key) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll(Iterable<int?> keys) {
    throw UnimplementedError();
  }

  @override
  DataConverter<LocalRoute, String> get encode => throw UnimplementedError();

  @override
  LocalRoute get first => throw UnimplementedError();

  @override
  LocalRoute get(int key) {
    throw UnimplementedError();
  }

  @override
  Future<void> hashAdd(LocalRoute data) {
    throw UnimplementedError();
  }

  @override
  Future<void> hashDelete(LocalRoute data) {
    throw UnimplementedError();
  }

  @override
  Iterable<int> get keys => throw UnimplementedError();

  @override
  LocalRoute get last => throw UnimplementedError();

  @override
  Map<int, LocalRoute> get map => throw UnimplementedError();

  @override
  int get maxSize => throw UnimplementedError();

  @override
  FutureOr<void> onDatabaseExceededMaxSize() {
    throw UnimplementedError();
  }

  @override
  Future<void> put(int key, LocalRoute value) {
    throw UnimplementedError();
  }

  @override
  Future<int> safeAdd(LocalRoute data) {
    throw UnimplementedError();
  }

  @override
  int get size => throw UnimplementedError();

  @override
  Iterable<LocalRoute> get values => throw UnimplementedError();

  @override
  Stream<BoxEvent> watch({dynamic key}) {
    throw UnimplementedError();
  }

  @override
  Iterable<int> invalidKeys() {
    throw UnimplementedError();
  }

  @override
  int sanitizeKey(int key) {
    throw UnimplementedError();
  }
}
