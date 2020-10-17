import 'dart:async';

import 'package:flutter/material.dart';
import 'package:swiss_travel/api/cff/models/stationboard_connection.dart';
import 'package:swiss_travel/api/cff/models/subsequent_stop.dart';
import 'package:swiss_travel/utils/format.dart';

class NextStopsPage extends StatefulWidget {
  final StationboardConnection connection;

  const NextStopsPage({Key key, @required this.connection}) : super(key: key);

  @override
  _NextStopsPageState createState() => _NextStopsPageState();
}

class _NextStopsPageState extends State<NextStopsPage> {
  StationboardConnection connection;

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 15), (_) => setState(() {}));
    connection = widget.connection;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(connection.terminal.name),
        ),
        body: RefreshIndicator(
          onRefresh: () => reloadData(),
          child: connection != null
              ? ListView.separated(
                  separatorBuilder: (c, i) => const Divider(height: 0),
                  itemCount: connection.subsequentStops.length,
                  itemBuilder: (context, i) => StopTile(stop: connection.subsequentStops[i]),
                )
              : const Center(child: CircularProgressIndicator()),
        ));
  }

  Future<void> reloadData() async {}
}

class StopTile extends StatelessWidget {
  final SubsequentStop stop;

  const StopTile({Key key, @required this.stop}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  stop.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        subtitle: Text(
          Format.time(stop.arr),
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
