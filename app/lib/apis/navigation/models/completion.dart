import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';

mixin Completion {
  String get label;
  DataOrigin get origin;
  double? get dist;
  String? get id;
  Vehicle? get type;
  String? get favoriteName;

  Widget getIcon({double? size});
}

enum DataOrigin {
  favorites,
  history,
  data,
  currentLocation,
  prediction,
  loading,
}
