import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swiss_travel/api/cff/models/leg.dart';
import 'package:swiss_travel/api/cff/models/route_connection.dart';
import 'package:swiss_travel/api/cff/models/stop.dart';
import 'package:swiss_travel/utils/format.dart';

@immutable
class Distances {
  final Stop closestStop;
  final Leg closestLeg;
  final Map<Leg, double> legDistances;
  final Map<Stop, double> stopDistances;

  const Distances(this.closestStop, this.closestLeg, this.stopDistances, this.legDistances);
}

final positionProvider = StreamProvider.autoDispose((_) => getPositionStream());

class LiveRoutePage extends StatelessWidget {
  final RouteConnection connection;

  const LiveRoutePage({Key key, @required this.connection}) : super(key: key);

  Distances computeDistances(Position p) {
    final Map<Leg, double> legDistances = {};
    final Map<Stop, double> stopDistances = {};
    Stop closestStop;
    Leg closestLeg;
    double dist = double.infinity;
    for (var j = 0; j < connection.legs.length; j++) {
      final l = connection.legs[j];
      if (l.stops.isNotEmpty) {
        for (final s in l.stops) {
          if (s.lat == null || s.lon == null) continue;
          final double d = distanceBetween(s.lat, s.lon, p.latitude, p.longitude);

          stopDistances[s] = d;
          if (d < dist) {
            closestStop = s;
            closestLeg = l;
            dist = d;
          }
        }
      } else {
        if (l.lat == null || l.lon == null) continue;
        final double d = distanceBetween(l.lat, l.lon, p.latitude, p.longitude);
        legDistances[l] = d;
        if (d < dist) {
          closestLeg = l;
          closestStop = null;
          dist = d;
        }
      }
    }

    return Distances(closestStop, closestLeg, stopDistances, legDistances);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Live route")),
        body: Consumer(builder: (context, w, _) {
          final p = w(positionProvider);
          return p.when(
            data: (data) {
              final distances = computeDistances(data);
              final currentStopIndex = distances.closestLeg.stops.length -
                  distances.closestLeg.stops.indexOf(distances.closestStop);
              final distFromCurrToNext = distances.closestStop != null
                  ? distanceBetween(distances.closestStop.lat, distances.closestStop.lon,
                      distances.closestLeg.exit.lat, distances.closestLeg.exit.lon)
                  : null;
              final distUntilExit = distanceBetween(distances.closestLeg.exit.lat,
                  distances.closestLeg.exit.lon, data.latitude, data.longitude);

              final d = distUntilExit / distFromCurrToNext;
              final perc = (distances.closestLeg.stops.length - currentStopIndex * d) /
                  distances.closestLeg.stops.length;

              final timeUntilNextLeg = distances.closestStop == null
                  ? Duration.zero
                  : distances.closestLeg.exit.arrival.difference(distances.closestStop.departure) *
                      d;
              return Column(
                children: [
                  Text(data.toString()),
                  Text(
                    "Current stop : ${distances.closestStop?.name}\n"
                    "Current leg : ${distances.closestLeg.name}\n"
                    "Stops until ${distances.closestLeg.exit.name} : ${currentStopIndex - 1}\n"
                    "Distance from ${distances.closestStop?.name} to ${distances.closestLeg.exit.name} : ${Format.distance(distFromCurrToNext)}\n"
                    "Distance until ${distances.closestLeg.exit.name} : ${Format.distance(distUntilExit)} (${(100 * d).toStringAsFixed(1)}%)\n"
                    "Time until ${distances.closestLeg.exit.name} : $timeUntilNextLeg min\n"
                    "Portion of trip complete (${(100 * perc).toStringAsFixed(1)}%)",
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Center(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text.rich(TextSpan(
                                text: "Get off at ",
                                children: [
                                  TextSpan(
                                      text: distances.closestLeg.exit.name,
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                  const TextSpan(text: " in "),
                                  TextSpan(
                                      text: Format.duration(timeUntilNextLeg),
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: " (${Format.distance(distUntilExit)})"),
                                ],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .apply(fontSizeFactor: 0.8),
                              )),
                              Text(
                                currentStopIndex == 2
                                    ? "Get off next stop"
                                    : "${currentStopIndex - 1} stops left",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: buildLegs(distances, data),
                    ),
                  ),
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, s) => Text("$e $s"),
          );
        }));
  }

  List<Widget> buildLegs(Distances distances, Position data) {
    return connection.legs.map((l) {
      final bool selected = distances.closestLeg == l;
      final double dist = distances.legDistances[l];
      return Card(
        child: Column(
          children: [
            ListTile(
              selected: selected,
              title: Text(
                l.name,
                style: TextStyle(fontWeight: selected ? FontWeight.bold : null),
              ),
              subtitle: dist != null ? Text(Format.distance(dist)) : const Text("No location data"),
            ),
            ...l.stops.map((s) {
              final bool selected = distances.closestStop == s;
              final double dist = distances.stopDistances[s];
              return ListTile(
                selected: selected,
                dense: true,
                title: Text(
                  s.name,
                  style: TextStyle(fontWeight: selected ? FontWeight.bold : null),
                ),
                subtitle:
                    dist != null ? Text(Format.distance(dist)) : const Text("No location data"),
              );
            }),
          ],
        ),
      );
    }).toList();
  }
}
