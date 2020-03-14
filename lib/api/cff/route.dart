import 'package:travel_free/api/cff/connectionRoute.dart';

class Itinerary {
  final int count;
  final int minDuration;
  final int maxDuration;
  final List<ConnectionRoute> connections;

  Itinerary({this.count, this.minDuration, this.maxDuration, this.connections});

  Itinerary.fromMap(Map m)
      : this(
            count: m["count"] as int,
            minDuration: m["minDuration"] as int,
            maxDuration: m["maxDuration"] as int,
            connections: (m["connections"] as List)
                .map((f) => ConnectionRoute.fromMap(f as Map))
                .toList());
}
