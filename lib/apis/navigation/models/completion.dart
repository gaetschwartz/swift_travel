import 'package:flutter/material.dart';

mixin Completion {
  String get label;
  double? get dist;
  String? get id;
  DataOrigin get origin;
  Widget get icon;

  void test();
}

enum DataOrigin {
  favorites,
  history,
  data,
  currentLocation,
  prediction,
}
