import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/exit.dart';
import 'package:swift_travel/apis/navigation/switzerland/switzerland.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/utils/models/coordinates.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/utils/strings/strings.dart';
import 'package:swift_travel/widgets/line_icon.dart';

void main() {
  final r = Random();
  final localRoute = LocalRoute.simple('Geneva', 'Paris');
  final localRoute2 = LocalRoute.simple('London', 'New York');

  test('double flipped RouteTransformer', () {
    final routes = [localRoute, localRoute2];
    final doubled =
        const DoubleFlippedRouteTransformer().apply(routes).toList();
    expect(doubled, hasLength(routes.length * 2));
    expect(
        doubled,
        orderedEquals(<LocalRoute>[
          localRoute,
          localRoute.flipped,
          localRoute2,
          localRoute2.flipped,
        ]));
  });

  test('unchanged RouteTransformer', () {
    final routes = [localRoute, localRoute2];
    final tranformed = const UnchangedRouteTransformer().apply(routes).toList();
    expect(tranformed, hasLength(routes.length));
    expect(tranformed, containsAll(routes));
  });

  test('LV03 to WGS84', () {
    final out = const LV03ToWGS84Converter()
        .convert(const LV03Coordinates(100000, 700000));

    final lonMatcher = closeTo(8 + 43 / 60 + 49.80 / 3600, 1 / 3600);
    final latMatcher = closeTo(46 + 02 / 60 + 38.86 / 3600, 1 / 3600);

    expect(out.lon, lonMatcher);
    expect(out.lat, latMatcher);

    final pos = SchExit(name: 'test @700000, 100000').position;
    expect(pos, isNotNull);
    expect(pos!.lon, lonMatcher);
    expect(pos.lat, latMatcher);
  });

  TestWidgetsFlutterBinding.ensureInitialized();
  group('format >', () {
    test('distance', () {
      expect(Format.distance(0), '0 m');
      expect(Format.distance(10), '10 m');
      expect(Format.distance(1000), '1.0 km');
      expect(Format.distance(1234), '1.2 km');
      expect(Format.distance(null), '?');
    });

    test('duration - en', () {
      expect(Format.duration(const Duration(hours: 2, minutes: 3)), '2:03');
      expect(Format.duration(const Duration(hours: 2)), '2:00');
      expect(Format.duration(const Duration(minutes: 3)), '3 mins');
      expect(Format.duration(Duration.zero), 'Now');
    });

    test('duration - fr', () {
      const locale = Locale('fr');
      expect(
          Format.duration(const Duration(hours: 2, minutes: 3), locale: locale),
          '2h03');
      expect(Format.duration(const Duration(hours: 2), locale: locale), '2h00');
      expect(Format.duration(const Duration(minutes: 3), locale: locale),
          '3 mins');
      expect(Format.duration(Duration.zero, locale: locale), 'Maint.');
    });

    test('delay', () {
      expect(Format.delay(1), '+1');
      expect(Format.delay(0), '+0');
      expect(Format.delay(-1), '-1');
    });
  });
  test('levenshtein', () {
    expect(levenshtein('hello', 'hello'), 0);
    expect(levenshtein('hello!', 'hello'), 1);
    expect(levenshtein('hello!!!', 'hello'), 3);
  });
  test('query builder', () {
    final builder = QueryBuilder<String>('example.com', (s) => '$s.json');
    expect(
        builder('compute', {}), Uri.parse('https://example.com/compute.json'));
    expect(builder('delete', {'test1': true, 'test2': false}),
        Uri.parse('https://example.com/delete.json?test1=true&test2=false'));
    expect(
        builder('encode', {'f1': '¦@#°§', 'f2': '¬|¢´', 'f3': '&?'}),
        Uri.parse('https://example.com/encode.json?'
            'f1=%C2%A6%40%23%C2%B0%C2%A7'
            '&f2=%C2%AC%7C%C2%A2%C2%B4'
            '&f3=%26%3F'));
  });

  group('parse color >', () {
    const iterCount = 50;
    test('works correctly ', () {
      for (var i = 0; i < iterCount; i++) {
        final nextInt = r.nextInt(1 << 12);
        final s = nextInt.toRadixString(16).padLeft(3, '0');
        expect(s.length, 3);
        expect(tryParseColorInt(s)!.toRadixString(16),
            'ff${s[0]}0${s[1]}0${s[2]}0');
      }
      for (var i = 0; i < iterCount; i++) {
        final nextInt = r.nextInt(1 << 24);
        final s = nextInt.toRadixString(16).padLeft(6, '0');
        expect(s.length, 6);
        expect(tryParseColorInt(s)!.toRadixString(16), 'ff$s');
      }
    });

    test('defaultColor', () {
      expect(parseColor(null, Colors.red), isSameColorAs(Colors.red));
      expect(parseColor('', Colors.blue), isSameColorAs(Colors.blue));
    });
    test('handles malformed data correctly', () {
      expect(() => tryParseColorInt('hell'), throwsArgumentError);
      expect(() => tryParseColorInt('1234'), throwsArgumentError);

      expect(() => tryParseColorInt('zzz'), throwsFormatException);
      expect(() => tryParseColorInt('------'), throwsFormatException);

      expect(tryParseColorInt(''), null);
      expect(tryParseColorInt(null), null);
    });
  });

  test('ellipsis', () {
    expect('Hello World this is a String qwertzuiop'.ellipsis(16),
        'Hello World t...');
    expect('Hello World this is a String'.ellipsis(16), 'Hello World t...');
    expect('Hello World'.ellipsis(16), 'Hello World');
  });

  test('markdown', () {
    final textSpan = parseDecoratedText(
        'Text in *bold*, text in _italic_, and _*bold-italic*_.');
    expect(textSpan.children, [
      const TextSpan(text: 'Text in ', style: TextStyle()),
      const TextSpan(
          text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
      const TextSpan(text: ', text in ', style: TextStyle()),
      const TextSpan(
          text: 'italic', style: TextStyle(fontStyle: FontStyle.italic)),
      const TextSpan(text: ', and ', style: TextStyle()),
      const TextSpan(
        text: 'bold-italic',
        style:
            TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
      ),
      const TextSpan(text: '.', style: TextStyle()),
    ]);
  });
}
