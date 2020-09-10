// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:travel_free/utils/format.dart';

void main() {
  test("Test color", () {
    expect(colorFromString("fff").toRadixString(16), 0xfff0f0f0.toRadixString(16));
  });
}
