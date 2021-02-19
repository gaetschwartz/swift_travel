import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';
import 'package:swift_travel/widgets/cff_icon.dart';

mixin Completion {
  String get label;
  DataOrigin get origin;
  double? get dist;
  String? get id;
  Vehicle? get type;
  String? get favoriteName;

  Widget getIcon({double? size}) => CffIcon(type, size: size);
}

enum DataOrigin {
  favorites,
  history,
  data,
  currentLocation,
  prediction,
}
