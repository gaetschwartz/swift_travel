import 'package:flutter/material.dart';

@immutable
class Completion {
  final String label;
  final String iconClass;

  const Completion._(this.label, this.iconClass);

  Completion.fromMap(Map m)
      : this._(m["label"] as String, m["iconclass"] as String);
      
  @override
  String toString() => "label : $label, icon : $iconClass";
}

@immutable
class StationCompletion {
  final String label;
  final String iconClass;
  final int distance;

  const StationCompletion._(this.label, this.distance, this.iconClass);

  StationCompletion.fromMap(Map m)
      : this._(
            m["label"] as String, m["dist"] as int, m["iconclass"] as String);
}
