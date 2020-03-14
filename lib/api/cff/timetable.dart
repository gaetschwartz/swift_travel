import 'package:flutter/material.dart';
import 'package:travel_free/api/cff/connection.dart';
import 'package:travel_free/api/cff/stop.dart';

@immutable
class TimeTable {
  final Stop stop;
  final List<Connection> connections;

  const TimeTable._(this.stop, this.connections);

  TimeTable.fromMap(Map m)
      : this._(
            Stop.fromMap(m["stop"] as Map),
            (m["connections"] as List)
                .map<Connection>((f) => Connection.fromMap(f as Map))
                .toList());

  @override
  String toString() => "label : ${stop.name}";
}
