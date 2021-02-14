import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swift_travel/apis/search.ch/search_ch.dart';
import 'package:swift_travel/utils/string_utils/format.dart';
import 'package:swift_travel/utils/string_utils/string_utils.dart';
import 'package:utils/levenshtein.dart';

void main() {
  final r = Random();

  TestWidgetsFlutterBinding.ensureInitialized();
  group('format >', () {
    test('distance', () {
      expect(Format.distance(0), '0 m');
      expect(Format.distance(10), '10 m');
      expect(Format.distance(1000), '1.0 km');
      expect(Format.distance(1234), '1.2 km');
      expect(Format.distance(null), '');
    });

    test('duration - en', () {
      expect(Format.duration(const Duration(hours: 2, minutes: 3)), '2:03');
      expect(Format.duration(const Duration(hours: 2)), '2:00');
      expect(Format.duration(const Duration(minutes: 3)), '3 mins');
      expect(Format.duration(Duration.zero), 'Now');
    });

    test('duration - fr', () {
      const locale = Locale('fr');
      expect(Format.duration(const Duration(hours: 2, minutes: 3), locale: locale), '2h03');
      expect(Format.duration(const Duration(hours: 2), locale: locale), '2h00');
      expect(Format.duration(const Duration(minutes: 3), locale: locale), '3 mins');
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
    expect(builder('compute', {}), Uri.parse('https://example.com/compute.json'));
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
        expect(parseColorInt(s)!.toRadixString(16), 'ff${s[0]}0${s[1]}0${s[2]}0');
      }
      for (var i = 0; i < iterCount; i++) {
        final nextInt = r.nextInt(1 << 24);
        final s = nextInt.toRadixString(16).padLeft(6, '0');
        expect(s.length, 6);
        expect(parseColorInt(s)!.toRadixString(16), 'ff$s');
      }
    });

    test('defaultColor', () {
      expect(parseColor(null, Colors.red), isSameColorAs(Colors.red));
      expect(parseColor('', Colors.blue), isSameColorAs(Colors.blue));
    });
    test('handles malformed data correctly', () {
      expect(() => parseColorInt('hell'), throwsArgumentError);
      expect(() => parseColorInt('1234'), throwsArgumentError);

      expect(() => parseColorInt('zzz'), throwsFormatException);
      expect(() => parseColorInt('------'), throwsFormatException);

      expect(parseColorInt(''), null);
      expect(parseColorInt(null), null);
    });
  });

  test('ellipsis', () {
    expect('Hello World this is a String qwertzuiop'.ellipsis(16), 'Hello World t...');
    expect('Hello World this is a String'.ellipsis(16), 'Hello World t...');
    expect('Hello World'.ellipsis(16), 'Hello World');
  });

  test('markdown', () {
    final textSpan = parseDecoratedText('Text in *bold*, text in _italic_, and _*bold-italic*_.');
    expect(textSpan.children, [
      const TextSpan(text: 'Text in ', style: TextStyle()),
      const TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
      const TextSpan(text: ', text in ', style: TextStyle()),
      const TextSpan(text: 'italic', style: TextStyle(fontStyle: FontStyle.italic)),
      const TextSpan(text: ', and ', style: TextStyle()),
      const TextSpan(
        text: 'bold-italic',
        style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
      ),
      const TextSpan(text: '.', style: TextStyle()),
    ]);
  });
}
