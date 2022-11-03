import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/ml_models.dart';
import 'package:swift_travel/prediction/models/models.dart';
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
    final routes = RouteHistoryRepository.instance.history;
    final pred = const KnnRouteModel().predict(FullArguments(
        routes, PredictionArguments.empty(dateTime: FakeableDateTime.now())));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                unawaited(Navigator.of(context).push<void>(MaterialPageRoute(
                    builder: (context) => _RoutesJson(routes: routes))));
              },
              icon: const Icon(Icons.print)),
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await RouteHistoryRepository.instance.clear();
                setState(() {});
              }),
        ],
      ),
      body: Column(
        children: [
          if (pred.prediction != null) ...[
            const Text('Predicted route :'),
            ListTile(
                title: Text(
                    'Confidence : ${(pred.confidence * 100).toStringAsFixed(2)} %'),
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
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final docs = await getTemporaryDirectory();
                final f = File(path.join(docs.path, 'routes.json'));
                final json = jsonEncode(routes.map((e) => e.toJson()).toList());
                await f.writeAsString(json);
                await Share.shareXFiles([XFile(f.path)]);
              },
              icon: const Icon(Icons.share))
        ],
      ),
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
