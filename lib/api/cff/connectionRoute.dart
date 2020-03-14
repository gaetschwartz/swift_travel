import 'package:travel_free/api/cff/connection.dart';
import 'package:travel_free/api/cff/legs.dart';

class ConnectionRoute {
  final String from;
  final DateTime arrival;
  final disruption;
  final List<Legs> legs;
  final int duration;
  final String to;
  final DateTime departure;

  ConnectionRoute({
    this.from,
    this.arrival,
    this.disruption,
    this.legs,
    this.duration,
    this.to,
    this.departure,
  });

  ConnectionRoute.fromMap(Map m)
      : this(
          from: m["from"] as String,
          arrival: DateTime.parse(m["arrival"] as String),
          disruption: m["disruptions"],
          legs: (m["legs"] as List).map((f) => Legs.fromMap(f as Map)).toList(),
          duration: m["duration"] as int,
          to: m["to"] as String,
          departure: m["departure"] != null
              ? DateTime.parse(m["departure"] as String)
              : null,
        );
}
