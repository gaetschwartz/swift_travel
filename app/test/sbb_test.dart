// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/exit.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/leg.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/route.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/route_connection.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stop.dart';
import 'package:swift_travel/mocking/mocking.dart';

typedef JSON = Map<String, Object?>;

void main() {
  test(
    'test parsing SbbStationBoard and SbbRoute',
    () {
      expect(() => SbbStationboard.fromJson(mockStationboard), returnsNormally);
      expect(() => SbbRoute.fromJson(mockRoute), returnsNormally);
      print(SbbRoute.fromJson(mockRoute).connections.first);
    },
  );

  test('Stop formatting', () {
    expect(const SbbStop(name: 'Genève@34534535,345345').displayName, 'Genève');
    expect(
        const SbbStop(name: 'Genève @34534535,345345').displayName, 'Genève');
    expect(
        const SbbStop(name: 'Genève  @34534535,345345').displayName, 'Genève');
  });

  test(
    'SbbRoute parsing is correct',
    () {
      final json = JSON.from(mockRoute);
      json['count'] = 1;
      json['connections'] = [
        (mockRoute['connections'] as List?)!.first as JSON
      ];
      final route = SbbRoute.fromJson(json);

      expect(sbbRoute.toJson(), route.toJson());
    },
  );
}

final sbbRoute = SbbRoute(
  count: 1,
  minDuration: 11880,
  maxDuration: 18840,
  sbbConnections: [
    SbbRouteConnection(
      from: 'Université de Genève, Genève, Rue du Général-Dufour 24',
      to: 'Sundlauenen, Staatsstr. 43 @626241,170246',
      departure: DateTime.parse(
        '2021-02-15T14:23:00.000',
      ),
      arrival: DateTime.parse(
        '2021-02-15T17:41:00.000',
      ),
      durationInSeconds: 11880,
      sbbLegs: [
        SbbLeg(
          name: 'Université de Genève, Genève, Rue du Général-Dufour 24',
          sbbExit: SbbExit(
            name: 'Genève, Plainpalais',
            arrival: DateTime.parse(
              '2021-02-15 14:28:00.000',
            ),
            lat: 46.198163,
            lon: 6.143149,
            stopid: '8587907',
            waittime: 0,
            isaddress: false,
            x: 500002,
            y: 117126,
          ),
          type: PlaceType.walk,
          terminal: 'Genève, Plainpalais',
          runningTime: 300,
          sbbStops: [],
          departure: DateTime.parse(
            '2021-02-15 14:23:00.000',
          ),
          waitTime: 0,
          isAddress: true,
          attributes: {},
        ),
        SbbLeg(
          name: 'Genève, Plainpalais',
          sbbExit: SbbExit(
            name: 'Genève, Cornavin',
            arrival: DateTime.parse(
              '2021-02-15 14:36:00.000',
            ),
            lat: 46.209751,
            lon: 6.14242,
            stopid: '8587057',
            waittime: 0,
            isaddress: false,
            x: 499967,
            y: 118415,
          ),
          type: PlaceType.tram,
          terminal: 'Genève, Nations',
          fgcolor: 'fff',
          bgcolor: '996633',
          tripid: 'T2021_094969_000881_001_f77366a_0',
          stopid: '8587907',
          runningTime: 480,
          line: '15',
          sbbStops: [
            SbbStop(
              name: 'Genève, Cirque',
              departure: DateTime.parse(
                '2021-02-15 14:29:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 14:29:00.000',
              ),
              lat: 46.200669,
              lon: 6.140472,
              x: 499800,
              y: 117408,
            ),
            SbbStop(
              name: 'Genève, Stand',
              departure: DateTime.parse(
                '2021-02-15 14:31:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 14:31:00.000',
              ),
              lat: 46.203703,
              lon: 6.139869,
              x: 499759,
              y: 117746,
            ),
            SbbStop(
              name: 'Genève, Goulart',
              departure: DateTime.parse(
                '2021-02-15 14:33:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 14:33:00.000',
              ),
              lat: 46.207554,
              lon: 6.141436,
              x: 499887,
              y: 118172,
            )
          ],
          departure: DateTime.parse(
            '2021-02-15 14:28:00.000',
          ),
          arrival: DateTime.parse(
            '2021-02-15 14:28:00.000',
          ),
          waitTime: 0,
          isAddress: false,
          lat: 46.198163,
          lon: 6.143149,
          x: 500002,
          y: 117126,
          attributes: {},
        ),
        SbbLeg(
          name: 'Genève, Cornavin',
          sbbExit: SbbExit(
            name: 'Genève',
            arrival: DateTime.parse(
              '2021-02-15 14:41:00.000',
            ),
            lat: 46.210228,
            lon: 6.142435,
            stopid: '8501008',
            waittime: 60,
            isaddress: false,
            x: 499969,
            y: 118468,
          ),
          type: PlaceType.walk,
          stopid: '8587057',
          runningTime: 300,
          sbbStops: [],
          departure: DateTime.parse(
            '2021-02-15 14:36:00.000',
          ),
          arrival: DateTime.parse(
            '2021-02-15 14:36:00.000',
          ),
          normalTime: 300,
          waitTime: 0,
          isAddress: false,
          lat: 46.209751,
          lon: 6.14242,
          x: 499967,
          y: 118415,
          attributes: {},
        ),
        SbbLeg(
          name: 'Genève',
          sbbExit: SbbExit(
            name: 'Bern',
            arrival: DateTime.parse(
              '2021-02-15 16:27:00.000',
            ),
            lat: 46.948832,
            lon: 7.439136,
            stopid: '8507000',
            track: '7',
            waittime: 420,
            isaddress: false,
            x: 600038,
            y: 199750,
          ),
          type: PlaceType.expressTrain,
          track: '6',
          terminal: 'St. Gallen',
          fgcolor: 'fff',
          bgcolor: 'f00',
          tripid: 'T2021_000725_000011_102_d44cfff_0',
          stopid: '8501008',
          runningTime: 6300,
          line: 'IC 1',
          sbbStops: [
            SbbStop(
              name: 'Lausanne',
              departure: DateTime.parse(
                '2021-02-15 15:20:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 15:18:00.000',
              ),
              lat: 46.516795,
              lon: 6.629087,
              x: 537875,
              y: 152042,
            ),
            SbbStop(
              name: 'Fribourg/Freiburg',
              departure: DateTime.parse(
                '2021-02-15 16:04:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 16:03:00.000',
              ),
              lat: 46.803151,
              lon: 7.151052,
              x: 578047,
              y: 183595,
            )
          ],
          departure: DateTime.parse(
            '2021-02-15 14:42:00.000',
          ),
          arrival: DateTime.parse(
            '2021-02-15 14:41:00.000',
          ),
          waitTime: 60,
          isAddress: false,
          lat: 46.210228,
          lon: 6.142435,
          x: 499969,
          y: 118468,
          attributes: {
            '0_1.4_WR': 'Restaurant',
            '0_4.8_RZ': 'Quiet zone in 1st class',
            '0_8.1_R': 'Reservation possible',
            '1_1.1_OM': 'Masks mandatory for travellers aged 12 and over',
            '1_4.6_FA': 'Family Coach with play area',
            '1_4.7_BZ': 'Business zone in 1st class',
            '1_4.7_FS': 'Free Internet with the SBB FreeSurf app'
          },
        ),
        SbbLeg(
          name: 'Bern',
          sbbExit: SbbExit(
            name: 'Thun',
            arrival: DateTime.parse(
              '2021-02-15 16:52:00.000',
            ),
            lat: 46.75485,
            lon: 7.629608,
            stopid: '8507100',
            track: '1',
            waittime: 0,
            isaddress: false,
            x: 614591,
            y: 178203,
          ),
          type: PlaceType.expressTrain,
          track: '6',
          terminal: 'Interlaken Ost',
          fgcolor: 'fff',
          bgcolor: 'f00',
          tripid: 'T2021_001077_000011_101_47e40c8_0',
          stopid: '8507000',
          runningTime: 1080,
          line: 'IC 61',
          sbbStops: [],
          departure: DateTime.parse(
            '2021-02-15 16:34:00.000',
          ),
          arrival: DateTime.parse(
            '2021-02-15 16:27:00.000',
          ),
          normalTime: 360,
          waitTime: 420,
          isAddress: false,
          lat: 46.948832,
          lon: 7.439136,
          x: 600038,
          y: 199750,
          attributes: {
            '0_2.4_WS': 'Bistro',
            '0_4.8_RZ': 'Quiet zone in 1st class',
            '0_8.1_R': 'Reservation possible',
            '1_1.1_OM': 'Masks mandatory for travellers aged 12 and over',
            '1_4.6_FA': 'Family Coach with play area',
            '1_4.7_BZ': 'Business zone in 1st class',
            '1_4.7_FS': 'Free Internet with the SBB FreeSurf app'
          },
        ),
        SbbLeg(
          name: 'Thun',
          sbbExit: SbbExit(
            name: 'Thun, Bahnhof',
            arrival: DateTime.parse(
              '2021-02-15 16:56:00.000',
            ),
            lat: 46.755129,
            lon: 7.629897,
            stopid: '8507180',
            waittime: 360,
            isaddress: false,
            x: 614613,
            y: 178234,
          ),
          type: PlaceType.walk,
          stopid: '8507100',
          runningTime: 240,
          sbbStops: [],
          departure: DateTime.parse(
            '2021-02-15 16:52:00.000',
          ),
          arrival: DateTime.parse(
            '2021-02-15 16:52:00.000',
          ),
          normalTime: 240,
          waitTime: 0,
          isAddress: false,
          lat: 46.75485,
          lon: 7.629608,
          x: 614591,
          y: 178203,
          attributes: {},
        ),
        SbbLeg(
          name: 'Thun, Bahnhof',
          sbbExit: SbbExit(
            name: 'Beatushöhlen',
            arrival: DateTime.parse(
              '2021-02-15 17:37:00.000',
            ),
            lat: 46.683608,
            lon: 7.782079,
            stopid: '8507186',
            waittime: 0,
            isaddress: false,
            x: 626275,
            y: 170323,
          ),
          type: PlaceType.bus,
          track: 'A',
          terminal: 'Interlaken Ost, Bahnhof',
          fgcolor: 'fff',
          bgcolor: '00aeef',
          tripid: 'T2021_021130_000146_001_1219b3b_0',
          stopid: '8507180',
          runningTime: 2100,
          line: '21',
          sbbStops: [
            SbbStop(
              name: 'Thun, Freienhof',
              departure: DateTime.parse(
                '2021-02-15 17:03:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:03:00.000',
              ),
              lat: 46.757457,
              lon: 7.630927,
              x: 614691,
              y: 178493,
            ),
            SbbStop(
              name: 'Thun, Lauitor',
              departure: DateTime.parse(
                '2021-02-15 17:04:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:04:00.000',
              ),
              lat: 46.758102,
              lon: 7.632028,
              x: 614775,
              y: 178565,
            ),
            SbbStop(
              name: 'Thun, Thunerhof',
              departure: DateTime.parse(
                '2021-02-15 17:05:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:05:00.000',
              ),
              lat: 46.755967,
              lon: 7.634298,
              x: 614949,
              y: 178328,
            ),
            SbbStop(
              name: 'Thun, Hofstetten',
              departure: DateTime.parse(
                '2021-02-15 17:06:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:06:00.000',
              ),
              lat: 46.754371,
              lon: 7.636256,
              x: 615099,
              y: 178151,
            ),
            SbbStop(
              name: 'Thun, Bächimatt',
              departure: DateTime.parse(
                '2021-02-15 17:07:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:07:00.000',
              ),
              lat: 46.751599,
              lon: 7.637188,
              x: 615171,
              y: 177843,
            ),
            SbbStop(
              name: 'Hünibach, Seematte',
              departure: DateTime.parse(
                '2021-02-15 17:08:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:08:00.000',
              ),
              lat: 46.747879,
              lon: 7.639687,
              x: 615363,
              y: 177430,
            ),
            SbbStop(
              name: 'Hünibach, Chartreuse',
              departure: DateTime.parse(
                '2021-02-15 17:10:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:10:00.000',
              ),
              lat: 46.745334,
              lon: 7.64465,
              x: 615743,
              y: 177148,
            ),
            SbbStop(
              name: 'Hünibach, Stationsstrasse',
              departure: DateTime.parse(
                '2021-02-15 17:10:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:10:00.000',
              ),
              lat: 46.743962,
              lon: 7.647183,
              x: 615937,
              y: 176996,
            ),
            SbbStop(
              name: 'Hünibach, Eichbühl',
              departure: DateTime.parse(
                '2021-02-15 17:11:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:11:00.000',
              ),
              lat: 46.741651,
              lon: 7.651348,
              x: 616256,
              y: 176740,
            ),
            SbbStop(
              name: 'Hilterfingen, Post',
              departure: DateTime.parse(
                '2021-02-15 17:13:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:13:00.000',
              ),
              lat: 46.735504,
              lon: 7.658062,
              x: 616771,
              y: 176058,
            ),
            SbbStop(
              name: 'Hilterfingen, Kirche',
              departure: DateTime.parse(
                '2021-02-15 17:14:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:14:00.000',
              ),
              lat: 46.733743,
              lon: 7.661274,
              x: 617017,
              y: 175863,
            ),
            SbbStop(
              name: 'Oberhofen a. T., Dorf',
              departure: DateTime.parse(
                '2021-02-15 17:16:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:16:00.000',
              ),
              lat: 46.731228,
              lon: 7.66838,
              x: 617561,
              y: 175585,
            ),
            SbbStop(
              name: 'Oberhofen a. T., Wichterheer',
              departure: DateTime.parse(
                '2021-02-15 17:17:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:17:00.000',
              ),
              lat: 46.728749,
              lon: 7.671221,
              x: 617779,
              y: 175310,
            ),
            SbbStop(
              name: 'Oberhofen a. T., Längenschach.',
              departure: DateTime.parse(
                '2021-02-15 17:18:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:18:00.000',
              ),
              lat: 46.72589,
              lon: 7.67894,
              x: 618370,
              y: 174994,
            ),
            SbbStop(
              name: 'Oberhofen a.T., Örtlibach',
              departure: DateTime.parse(
                '2021-02-15 17:20:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:20:00.000',
              ),
              lat: 46.716721,
              lon: 7.688879,
              x: 619133,
              y: 173977,
            ),
            SbbStop(
              name: 'Gunten, Du Lac',
              departure: DateTime.parse(
                '2021-02-15 17:21:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:21:00.000',
              ),
              lat: 46.714558,
              lon: 7.694662,
              x: 619576,
              y: 173738,
            ),
            SbbStop(
              name: 'Gunten, Dorf',
              departure: DateTime.parse(
                '2021-02-15 17:22:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:22:00.000',
              ),
              lat: 46.712806,
              lon: 7.701612,
              x: 620108,
              y: 173545,
            ),
            SbbStop(
              name: 'Gunten, Stampbach',
              departure: DateTime.parse(
                '2021-02-15 17:24:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:24:00.000',
              ),
              lat: 46.709295,
              lon: 7.718033,
              x: 621365,
              y: 173159,
            ),
            SbbStop(
              name: 'Merligen, Ralligen',
              departure: DateTime.parse(
                '2021-02-15 17:25:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:25:00.000',
              ),
              lat: 46.706495,
              lon: 7.726257,
              x: 621995,
              y: 172850,
            ),
            SbbStop(
              name: 'Merligen, Bäregg',
              departure: DateTime.parse(
                '2021-02-15 17:25:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:25:00.000',
              ),
              lat: 46.704111,
              lon: 7.729853,
              x: 622271,
              y: 172586,
            ),
            SbbStop(
              name: 'Merligen, Vorderdorf',
              departure: DateTime.parse(
                '2021-02-15 17:26:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:26:00.000',
              ),
              lat: 46.701845,
              lon: 7.732913,
              x: 622506,
              y: 172335,
            ),
            SbbStop(
              name: 'Merligen, Kreuz',
              departure: DateTime.parse(
                '2021-02-15 17:26:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:26:00.000',
              ),
              lat: 46.700443,
              lon: 7.735678,
              x: 622718,
              y: 172180,
            ),
            SbbStop(
              name: 'Merligen, Beatus',
              departure: DateTime.parse(
                '2021-02-15 17:28:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:28:00.000',
              ),
              lat: 46.696245,
              lon: 7.73806,
              x: 622902,
              y: 171714,
            ),
            SbbStop(
              name: 'Beatenbucht',
              departure: DateTime.parse(
                '2021-02-15 17:32:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:31:00.000',
              ),
              lat: 46.686066,
              lon: 7.746749,
              x: 623571,
              y: 170585,
            ),
            SbbStop(
              name: 'Merligen, Nastel',
              departure: DateTime.parse(
                '2021-02-15 17:33:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:33:00.000',
              ),
              lat: 46.681265,
              lon: 7.755518,
              x: 624244,
              y: 170054,
            ),
            SbbStop(
              name: 'Sundlauenen, Geisskilche',
              departure: DateTime.parse(
                '2021-02-15 17:35:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:35:00.000',
              ),
              lat: 46.68281,
              lon: 7.762938,
              x: 624811,
              y: 170228,
            ),
            SbbStop(
              name: 'Sundlauenen, Balmholz',
              departure: DateTime.parse(
                '2021-02-15 17:36:00.000',
              ),
              arrival: DateTime.parse(
                '2021-02-15 17:36:00.000',
              ),
              lat: 46.682962,
              lon: 7.775709,
              x: 625788,
              y: 170249,
            )
          ],
          departure: DateTime.parse(
            '2021-02-15 17:02:00.000',
          ),
          arrival: DateTime.parse(
            '2021-02-15 16:56:00.000',
          ),
          waitTime: 360,
          isAddress: false,
          lat: 46.755129,
          lon: 7.629897,
          x: 614613,
          y: 178234,
          attributes: {
            '1_1.1_OM': 'Masks mandatory for travellers aged 12 and over'
          },
        ),
        SbbLeg(
          name: 'Beatushöhlen',
          sbbExit: SbbExit(
            name: 'Sundlauenen, Staatsstr. 43 @626241,170246',
            arrival: DateTime.parse(
              '2021-02-15 17:41:00.000',
            ),
            waittime: 0,
            isaddress: true,
          ),
          type: PlaceType.walk,
          stopid: '8507186',
          runningTime: 240,
          sbbStops: [],
          departure: DateTime.parse(
            '2021-02-15 17:37:00.000',
          ),
          arrival: DateTime.parse(
            '2021-02-15 17:37:00.000',
          ),
          normalTime: 0,
          waitTime: 0,
          isAddress: false,
          lat: 46.683608,
          lon: 7.782079,
          x: 626275,
          y: 170323,
          attributes: {},
        ),
        SbbLeg(
          name: 'Sundlauenen, Staatsstr. 43 @626241,170246',
          sbbStops: [],
          arrival: DateTime.parse(
            '2021-02-15 17:41:00.000',
          ),
          waitTime: 0,
          isAddress: true,
          attributes: {},
        )
      ],
    )
  ],
);
// ignore: unreachable_from_main
Matcher buildMatcher(
  SbbRoute actual,
  SbbRoute expected,
) {
  if (actual == expected) {
    return equals(
      expected,
    );
  } else {
    if (listEquals(
      actual.connections,
      expected.connections,
    )) {
      return ChildMatcher<SbbRoute>(
        'A SbbRoute with connections',
        'connections',
        orderedEquals(
          expected.connections,
        ),
        (
          data,
        ) =>
            data.connections,
      );
    } else {
      if (actual.connections.length != expected.connections.length) {
        return ChildMatcher<SbbRoute>(
          'Some connections with length',
          'length',
          expected.connections.length,
          (
            data,
          ) =>
              data.connections.length,
        );
      }
      for (var i = 0; i < actual.connections.length; i++,) {
        if (actual.connections[i] != expected.connections[i]) {
          return ChildMatcher<SbbRoute>(
            'A connection ',
            'connection',
            equals(
              expected.connections[i],
            ),
            (
              data,
            ) =>
                ChildMatcher<SbbRoute>(
              'A connection ',
              'connection',
              data.connections[i],
              (
                _,
              ) =>
                  _.connections[i],
            ),
          );
        }
      }
      throw FallThroughError();
    }
  }
}

// ignore: unreachable_from_main
class ChildMatcher<T> extends CustomMatcher {
  ChildMatcher(
    super.featureDescription,
    super.featureName,
    dynamic super.matcher,
    this.extractFeature,
  );

  final Object? Function(
    T data,
  ) extractFeature;

  @override
  Object? featureValueOf(
    dynamic actual,
  ) =>
      extractFeature(
        actual as T,
      );
}
