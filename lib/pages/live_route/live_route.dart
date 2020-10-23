import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swift_travel/apis/cff/models/leg.dart';
import 'package:swift_travel/apis/cff/models/route_connection.dart';
import 'package:swift_travel/apis/cff/models/stop.dart';
import 'package:swift_travel/blocs/live_route_controller.dart';
import 'package:swift_travel/utils/format.dart';

final positionProvider = StreamProvider.autoDispose((_) => Geolocator.getPositionStream());

class LiveRoutePage extends StatefulWidget {
  final RouteConnection connection;

  const LiveRoutePage({Key key, @required this.connection}) : super(key: key);

  @override
  _LiveRoutePageState createState() => _LiveRoutePageState();
}

class _LiveRoutePageState extends State<LiveRoutePage> {
  LiveRouteController _controller;
  @override
  void initState() {
    super.initState();
    _controller = context.read(liveRouteControllerProvider);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.startRoute(widget.connection);
    });
  }

  @override
  void deactivate() {
    _controller.stopCurrentRoute();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Live route")),
        body: Consumer(builder: (context, w, _) {
          final controller = w(liveRouteControllerProvider);
          if (!controller.isRunning || !controller.isReady) {
            log("Running : ${controller.isRunning}, read : ${controller.isReady}");
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
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
                                  text: controller.currentLeg.exit.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              const TextSpan(text: " in "),
                              TextSpan(
                                  text: Format.duration(controller.routeData.timeUntilNextLeg),
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      " (${Format.distance(controller.routeData.distUntilExit)})"),
                            ],
                            style: Theme.of(context).textTheme.headline6.apply(fontSizeFactor: 0.8),
                          )),
                          Text(
                            controller.routeData.currentStopIndex == 2
                                ? "Get off next stop"
                                : "${controller.routeData.currentStopIndex} stops left",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ListView(
                  children: buildLegs(controller),
                ),
              ),
              ExpansionTile(
                title: const Text("Debug info"),
                children: [
                  Text(controller.position.toString()),
                  Text(
                    "Closest stop : ${controller.closestStop?.name}\n"
                    "Current stop : ${controller.currentStop?.name}\n"
                    "Closest leg : ${controller.closestLeg.name}\n"
                    "Current leg : ${controller.currentLeg.name}\n"
                    "---\n"
                    "Stops until ${controller.currentLeg.exit.name} : ${controller.routeData.currentStopIndex}\n"
                    "Distance from ${controller.currentStop?.name} to ${controller.currentLeg.exit.name} : ${Format.distance(controller.routeData.distFromCurrToNext)}\n"
                    "Distance until ${controller.currentLeg.exit.name} : ${Format.distance(controller.routeData.distUntilExit)} (${controller.currentStop == null || controller.routeData.portionOfLegDone == null ? null : (100 * controller.routeData.portionOfLegDone).toStringAsFixed(1)}%)\n"
                    "Time until ${controller.currentLeg.exit.name} : ${controller.routeData.timeUntilNextLeg} min\n"
                    "Portion of trip complete (${controller.currentStop == null || controller.routeData.portionFromCurrentToExit == null ? null : (100 * controller.routeData.portionFromCurrentToExit).toStringAsFixed(1)}%)",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          );
        }));
  }

  List<Widget> buildLegs(LiveRouteController controller) {
    return [
      for (var i = 0; i < widget.connection.legs.length; i++)
        _buildLeg(controller, i, widget.connection.legs[i])
    ];
  }

  Card _buildLeg(LiveRouteController controller, int i, Leg l) {
    final bool selected = controller.currentStop == null && l.name == controller.currentLeg?.name;
    final double dist = controller.legDistances[i][-1];
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
          for (var j = 0; j < l.stops.length; j++) _buildStop(controller, i, j, l.stops[j]),
        ],
      ),
    );
  }

  ListTile _buildStop(LiveRouteController controller, int i, int j, Stop s) {
    final bool selected = s.name == controller.currentStop?.name;
    final double dist = controller.legDistances[i][j];
    return ListTile(
      selected: selected,
      dense: true,
      title: Text(
        s.name,
        style: TextStyle(fontWeight: selected ? FontWeight.bold : null),
      ),
      subtitle: dist != null ? Text(Format.distance(dist)) : const Text("No location data"),
    );
  }
}
