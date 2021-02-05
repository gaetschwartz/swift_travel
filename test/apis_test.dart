import 'package:flutter/src/material/time.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/search.ch/cff.dart';
import 'package:swift_travel/apis/search.ch/models/cff_completion.dart';
import 'package:swift_travel/apis/search.ch/models/cff_route.dart';
import 'package:swift_travel/apis/search.ch/models/cff_stationboard.dart';
import 'package:swift_travel/apis/sncf/sncf.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/mocking/mocking.dart';

class MockNavigationApi extends NavigationApi {
  @override
  Future<List<CffCompletion>> complete(String string,
      {bool showCoordinates, bool showIds, bool noFavorites, bool filterNull}) {
    throw UnimplementedError();
  }

  @override
  void dispose() {}

  @override
  Future<List<CffCompletion>> findStation(double lat, double lon,
          {int accuracy, bool showCoordinates, bool showIds}) =>
      Future.value([
        const CffCompletion(label: 'Genève'),
        const CffCompletion(label: 'Genève Cornavin'),
      ]);

  @override
  Future<CffRoute> rawRoute(String query) => Future.value(CffRoute.fromJson(mockRoute));

  @override
  Future<CffRoute> route(String departure, String arrival,
          {DateTime date, TimeOfDay time, TimeType typeTime}) =>
      Future.value(CffRoute.fromJson(mockRoute));

  @override
  Future<CffStationboard> stationboard(String stopName,
          {DateTime when,
          bool arrival,
          int limit,
          bool showTracks,
          bool showSubsequentStops,
          bool showDelays,
          bool showTrackchanges,
          List<TransportationTypes> transportationTypes}) =>
      Future.value(CffStationboard.fromJson(mockStationboard));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('navigation api', () {
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
      expect(navApi, isA<CffApi>());

      store.api = NavigationApiType.sncf;
      navApi = container.read(navigationAPIProvider);
      expect(navApi, isA<SncfApi>());
    });
  });
}
