import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:models/cff/cff_stationboard.dart';
import 'package:models/cff/stationboard_connection.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/tabs/stations/subsequent_stops.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/widget/cff_icon.dart';
import 'package:swift_travel/widget/line_icon.dart';

class DetailsStop extends StatefulWidget {
  final String stopName;

  const DetailsStop({Key key, @required this.stopName}) : super(key: key);

  @override
  _DetailsStopState createState() => _DetailsStopState();
}

class _DetailsStopState extends State<DetailsStop> {
  CffStationboard data;

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 15), (_) {
      setState(() {});
    });
    reloadData();
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
          title: Text(widget.stopName),
        ),
        body: RefreshIndicator(
          onRefresh: () => reloadData(),
          child: data != null
              ? data.messages.isEmpty
                  ? ListView.separated(
                      separatorBuilder: (c, i) => const Divider(height: 0, thickness: 1),
                      itemCount: data.connections.length,
                      itemBuilder: (context, i) => ConnectionTile(c: data.connections[i]),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '😕',
                              style: TextStyle(fontSize: 64),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "We couldn't find any departures from this location",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    )
              : const Center(child: CircularProgressIndicator()),
        ));
  }

  Future<void> reloadData() async {
    final CffStationboard l =
        await context.read(navigationAPIProvider).stationboard(widget.stopName);
    setState(() {
      data = l;
    });
  }
}

class ConnectionTile extends StatelessWidget {
  final StationboardConnection c;

  const ConnectionTile({Key key, @required this.c}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final diff = c.time.difference(DateTime.now());
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NextStopsPage(
          connection: c,
        ),
      )),
      title: Row(
        children: [
          LineIcon(
            background: c.color.split('~').first,
            foreground: c.color.split('~')[1],
            line: c.line,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                c.terminal.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            CffIcon(c.type, size: 16),
            const SizedBox(width: 8),
            Text(
              Format.time(c.time),
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
      trailing: Text(Format.duration(diff)),
    );
  }
}
