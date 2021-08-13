import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/prediction/predict.dart';
import 'package:swift_travel/widgets/route_widget.dart';

class RouteHistoryPage extends StatefulWidget {
  const RouteHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  _RouteHistoryPageState createState() => _RouteHistoryPageState();
}

const _days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

class _RouteHistoryPageState extends State<RouteHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final routes = RouteHistoryRepository.i.history;
    final pred =
        predictRouteSync(routes, PredictionArguments.empty(dateTime: FakeableDateTime.now()));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push<void>(
                    MaterialPageRoute(builder: (context) => _RoutesJson(routes: routes)));
              },
              icon: const Icon(Icons.print)),
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await RouteHistoryRepository.i.clear();
                setState(() {});
              }),
        ],
      ),
      body: Column(
        children: [
          if (pred.prediction != null) ...[
            const Text('Predicted route :'),
            ListTile(
                title: Text('Confidence : ${(pred.confidence * 100).toStringAsFixed(2)} %'),
                subtitle: Text(pred.arguments.toString())),
            ListTile(
              title: Text(pred.prediction!.fromAsString),
              subtitle: Text(pred.prediction!.toAsString),
            ),
            const Divider(height: 0),
          ],
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, i) => RouteWidget(
                from: Text(routes[i].fromAsString),
                to: Text(routes[i].toAsString),
                trailing: Text(
                    '${TimeOfDay.fromDateTime(routes[i].timestamp!).format(context)}, ${_days[routes[i].timestamp!.weekday - 1]}'),
              ),
              itemCount: routes.length,
              separatorBuilder: (context, index) => const Divider(height: 4),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoutesJson extends StatelessWidget {
  const _RoutesJson({
    required this.routes,
    Key? key,
  }) : super(key: key);

  final List<LocalRoute> routes;

  @override
  Widget build(BuildContext context) {
    const encoder = JsonEncoder.withIndent(' ');
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, i) => ListTile(
          title: Text(
            encoder.convert(routes[i].toJson()),
          ),
        ),
        itemCount: routes.length,
        separatorBuilder: (context, index) => const Divider(height: 4),
      ),
    );
  }
}
