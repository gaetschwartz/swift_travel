import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:live_route/live_route.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/utils/definitions.dart';
import 'package:swift_travel/utils/strings/format.dart';

final AutoDisposeStreamProvider<Position> positionProvider =
    StreamProvider.autoDispose((_) => Geolocator.getPositionStream());

class LiveRoutePage extends StatefulWidget {
  const LiveRoutePage({
    required this.connection,
    Key? key,
  }) : super(key: key);

  final RouteConnection connection;

  @override
  _LiveRoutePageState createState() => _LiveRoutePageState();
}

class _LiveRoutePageState extends State<LiveRoutePage> {
  late final LiveRouteController _controller = context.read(liveRouteControllerProvider);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((timeStamp) => _controller.startRoute(widget.connection));
  }

  @override
  void deactivate() {
    _controller.stopCurrentRoute();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Live route')),
      body: Consumer(builder: (context, w, _) {
        final controller = w(liveRouteControllerProvider);
        if (!controller.isRunning || !controller.isReady) {
          log.log('Running : ${controller.isRunning}, read : ${controller.isReady}');
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Expanded(
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(TextSpan(
                          text: 'Get off at ',
                          children: [
                            TextSpan(
                                text: controller.currentLeg?.exit?.name,
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            const TextSpan(text: ' in '),
                            TextSpan(
                                text: Format.duration(controller.routeData.timeUntilNextLeg),
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: ' (${Format.distance(controller.routeData.distUntilExit)})'),
                          ],
                          style: Theme.of(context).textTheme.headline6!.apply(fontSizeFactor: 0.8),
                        )),
                        Text(
                          controller.routeData.currentStopIndex == 2
                              ? 'Get off next stop'
                              : '${controller.routeData.currentStopIndex} stops left',
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
                children: [
                  for (var i = 0; i < widget.connection.legs.length; i++)
                    _LegCard(
                      controller: controller,
                      i: i,
                      leg: widget.connection.legs[i],
                    )
                ],
              ),
            ),
            ExpansionTile(
              title: const Text('Debug info'),
              children: [
                Text(controller.position.toString()),
                Text(
                  'Closest stop : ${controller.closestStop?.name}\n'
                  'Current stop : ${controller.currentStop?.name}\n'
                  'Closest leg : ${controller.closestLeg!.name}\n'
                  'Current leg : ${controller.currentLeg!.name}\n'
                  '---\n'
                  'Stops until ${controller.currentLeg!.exit!.name} : ${controller.routeData.currentStopIndex}\n'
                  'Distance from ${controller.currentStop?.name} to ${controller.currentLeg!.exit!.name} : ${Format.distance(controller.routeData.distFromCurrToNext)}\n'
                  'Distance until ${controller.currentLeg!.exit!.name} : ${Format.distance(controller.routeData.distUntilExit)} (${controller.currentStop == null || controller.routeData.portionOfLegDone == null ? null : (100 * controller.routeData.portionOfLegDone!).toStringAsFixed(1)}%)\n'
                  'Time until ${controller.currentLeg!.exit!.name} : ${controller.routeData.timeUntilNextLeg} min\n'
                  'Portion of trip complete (${controller.currentStop == null || controller.routeData.portionFromCurrentToExit == null ? null : (100 * controller.routeData.portionFromCurrentToExit!).toStringAsFixed(1)}%)',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        );
      }));
}

class _LegCard extends StatelessWidget {
  const _LegCard({
    Key? key,
    required this.controller,
    required this.i,
    required this.leg,
  }) : super(key: key);

  final LiveRouteController controller;
  final int i;
  final Leg leg;

  @override
  Widget build(BuildContext context) {
    final selected = controller.currentStop == null && leg.name == controller.currentLeg?.name;
    final legDistance = controller.legDistances[i];
    final dist = legDistance == null ? .0 : legDistance[-1];
    return Card(
      child: Column(
        children: [
          ListTile(
            selected: selected,
            title: Text(
              leg.name,
              style: TextStyle(fontWeight: selected ? FontWeight.bold : null),
            ),
            subtitle: dist != null ? Text(Format.distance(dist)) : null,
          ),
          for (var j = 0; j < leg.stops.length; j++) _buildStop(controller, i, j, leg.stops[j]),
        ],
      ),
    );
  }

  @allowReturningWidgets
  Widget _buildStop(LiveRouteController controller, int i, int j, Stop s) {
    final selected = s.name == controller.currentStop?.name;
    final dist = controller.legDistances[i]?[j];
    return ListTile(
      selected: selected,
      dense: true,
      title: Text(
        s.name,
        style: TextStyle(fontWeight: selected ? FontWeight.bold : null),
      ),
      subtitle: dist != null ? Text(Format.distance(dist)) : const Text('No location data'),
    );
  }
}
