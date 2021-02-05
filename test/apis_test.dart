import 'package:flutter/src/material/time.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/search.ch/cff.dart';
import 'package:swift_travel/apis/search.ch/models/cff_completion.dart';
import 'package:swift_travel/apis/search.ch/models/cff_route.dart';
import 'package:swift_travel/apis/search.ch/models/cff_stationboard.dart';
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

  test('always true', () {
    expect(true, isTrue);
  });
}
