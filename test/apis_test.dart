import 'package:flutter/src/material/time.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/completion.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/apis/navigation/sncf/sncf.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/mocking/mocking.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('navigation api >', () {
    setUpAll(() async {
      SharedPreferencesStorePlatform.instance = InMemorySharedPreferencesStore.empty();
    });

    tearDown(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    });
    test('returns the right instance', () async {
      final container = ProviderContainer();
      final store = container.read(preferencesProvider);
      await store.loadFromPreferences();

      store.api = NavigationApiType.cff;
      var navApi = container.read(navigationAPIProvider);
      expect(navApi, isA<SearchChApi>());

      store.api = NavigationApiType.sncf;
      navApi = container.read(navigationAPIProvider);
      expect(navApi, isA<SncfApi>());

      for (final a in NavigationApiType.values) {
        final f = NavigationApi.getFactory(a);
        expect(f.shortDesc, isNotEmpty);
      }
    });
  });
}

class MockNavigationApi extends NavigationApi {
  @override
  Future<List<SbbCompletion>> complete(String? string,
      {bool? showCoordinates, bool? showIds, bool? noFavorites, bool? filterNull}) {
    return Future.value([
      SbbCompletion(label: 'Genève'),
      SbbCompletion(label: 'Genève Cornavin'),
    ]);
  }

  @override
  void dispose() {}

  @override
  Future<List<SbbCompletion>> findStation(double lat, double lon,
          {int? accuracy, bool? showCoordinates, bool? showIds}) =>
      Future.value([
        SbbCompletion(label: 'Genève'),
        SbbCompletion(label: 'Genève Cornavin'),
      ]);

  @override
  Future<CffRoute> rawRoute(Uri query) =>
      Future.value(CffRoute.fromJson(mockRoute!).copyWith(requestUrl: query.toString()));

  @override
  Future<SbbStationboard> stationboard(String stopName,
          {DateTime? when,
          bool? arrival,
          int? limit,
          bool? showTracks,
          bool? showSubsequentStops,
          bool? showDelays,
          bool? showTrackchanges,
          List<TransportationTypes>? transportationTypes}) =>
      Future.value(SbbStationboard.parse(mockStationboard!));

  @override
  Future<CffRoute> route(String departure, String arrival,
          {required DateTime date,
          required TimeOfDay time,
          TimeType? typeTime,
          bool? showDelays,
          int? previous}) =>
      Future.value(CffRoute.fromJson(mockRoute!));
}
