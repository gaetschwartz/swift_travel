import 'package:flutter/material.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/utils/predict/predict.dart';
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
    final pred = predictRoute(routes, PredictionArguments(MockableDateTime.now()));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await RouteHistoryRepository.i.clear();
                setState(() {});
              })
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
              title: Text(pred.prediction!.from),
              subtitle: Text(pred.prediction!.to),
            ),
            const Divider(height: 0),
          ],
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, i) => RouteWidget(
                from: Text(routes[i].from),
                to: Text(routes[i].to),
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
