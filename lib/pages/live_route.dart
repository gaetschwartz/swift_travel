import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swiss_travel/api/cff/models/leg.dart';
import 'package:swiss_travel/api/cff/models/route_connection.dart';

final positionProvider = StreamProvider((_) => getPositionStream());

class LiveRoutePage extends StatelessWidget {
  final RouteConnection connection;

  const LiveRoutePage({Key key, @required this.connection}) : super(key: key);

  Leg getClosest(Position p) {
    double dist = double.infinity;
    Leg leg;
    for (final l in connection.legs) {
      if (l.lat == null || l.lon == null) continue;
      final double d = distanceBetween(l.lat, l.lon, p.latitude, p.longitude);
      if (d < dist) {
        leg = l;
        dist = d;
      }
    }
    return leg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Live route"),
        ),
        body: Consumer(builder: (context, w, _) {
          final p = w(positionProvider);
          return p.when(
            data: (data) {
              final closest = getClosest(data);
              return Column(
                children: [
                  Text(data.toString()),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (var l in connection.legs)
                          ListTile(
                            selected: l == closest,
                            dense: true,
                            title: Text(
                              l.name,
                              style: TextStyle(fontWeight: l == closest ? FontWeight.bold : null),
                            ),
                            subtitle: l.lat != null && l.lon != null
                                ? Text(
                                    "${(distanceBetween(l.lat, l.lon, data.latitude, data.longitude) / 1000).toStringAsFixed(1)} km")
                                : const Text("No location data"),
                          )
                      ],
                    ),
                  )
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, s) => Text("$e $s"),
          );
        }));
  }
}
