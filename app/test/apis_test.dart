import 'dart:ui';

import 'package:flutter/src/material/time.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:swift_travel/apis/navigation/france/france.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/completion.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/route.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/switzerland/switzerland.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/mocking/mocking.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('navigation api >', () {
    setUpAll(() async {
      SharedPreferencesStorePlatform.instance =
          InMemorySharedPreferencesStore.empty();
    });

    tearDown(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    });

    test('returns the right instance', () async {
      final container = ProviderContainer();
      final store = container.read(preferencesProvider);
      await store.loadFromPreferences();

      await store.api.setValue(searchChApi.id);
      var navApi = container.read(navigationAPIProvider);
      expect(navApi, isA<SearchChApi>());

      await store.api.setValue(sncfFactory.id);
      navApi = container.read(navigationAPIProvider);
      expect(navApi, isA<SncfApi>());

      for (final a in NavigationApiFactory.factories) {
        expect(a.shortDesc, isNotEmpty);
      }
    });
  });
}

// ignore: unreachable_from_main
class MockNavigationApi extends BaseNavigationApi {
  MockNavigationApi({this.mockCompletions});

  final List<NavigationCompletion>? mockCompletions;

  @override
  Future<List<NavigationCompletion>> complete(
    String? string, {
    bool? showCoordinates,
    bool? showIds,
    LocationType? locationType,
  }) async =>
      mockCompletions ??
      [SchCompletion(label: 'Genève'), SchCompletion(label: 'Genève Cornavin')];

  @override
  void dispose() {}

  @override
  Future<List<SchCompletion>> find(double lat, double lon,
          {int? accuracy, bool? showCoordinates, bool? showIds}) =>
      Future.value([
        SchCompletion(label: 'Genève'),
        SchCompletion(label: 'Genève Cornavin'),
      ]);

  final rawQueries = <Uri>[];
  @override
  Future<SchRoute> rawRoute(Uri query) {
    rawQueries.add(query);
    return Future.value(
        SchRoute.fromJson(mockRoute).copyWith(requestUrl: query.toString()));
  }

  @override
  Future<SchStationboard> stationboard(
    Stop stop, {
    DateTime? when,
    SearchChMode? mode,
    List<TransportationTypes>? transportationTypes,
  }) =>
      Future.value(SchStationboard.fromJson(mockStationboard));

  @override
  Future<SchRoute> route(String departure, String arrival,
          {required DateTime date,
          required TimeOfDay time,
          SearchChMode? timeType,
          bool? showDelays,
          int? previous}) =>
      Future.value(SchRoute.fromJson(mockRoute));

  @override
  Locale locale = const Locale('fr', 'CH');
}
