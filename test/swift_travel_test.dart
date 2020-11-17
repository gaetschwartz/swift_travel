// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:swift_travel/apis/cff/cff.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:test/test.dart';
import 'package:utils/utils/levenshtein.dart';

void main() {
  final Random r = Random();
  test("levenshtein", () {
    expect(levenshtein("hello", "hello"), 0);
    expect(levenshtein("hello!", "hello"), 1);
    expect(levenshtein("hello!!!", "hello"), 3);
  });
  test("query builder", () {
    final builder = QueryBuilder("https://example.com", (s) => "$s.json");
    expect(builder("compute", {}), "https://example.com/compute.json");
    expect(builder("delete", {"test1": true, "test2": false}),
        "https://example.com/delete.json?test1=true&test2=false");
  });

  const count = 50;
  test("colorFromString", () {
    for (var i = 0; i < count; i++) {
      final nextInt = r.nextInt(1 << 12);
      final s = nextInt.toRadixString(16).padLeft(3, "0");
      expect(s.length, 3);
      expect(colorFromString(s).toRadixString(16), "ff${s[0]}0${s[1]}0${s[2]}0");
    }
    for (var i = 0; i < count; i++) {
      final nextInt = r.nextInt(1 << 24);
      final s = nextInt.toRadixString(16).padLeft(6, "0");
      expect(s.length, 6);
      expect(colorFromString(s).toRadixString(16), "ff$s");
    }
  });
}
