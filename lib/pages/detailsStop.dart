import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/cff_stationboard.dart';
import 'package:travel_free/api/cff/stationboard_connection.dart';
import 'package:travel_free/utils/format.dart';
import 'package:travel_free/widget/icon.dart';
import 'package:travel_free/widget/lineWidget.dart';

class DetailsStop extends StatefulWidget {
  final String stopName;

  const DetailsStop({Key key, @required this.stopName}) : super(key: key);

  @override
  _DetailsStopState createState() => _DetailsStopState();
}

class _DetailsStopState extends State<DetailsStop> {
  CffStationboard data;

  @override
  void initState() {
    super.initState();
    reloadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.stopName),
        ),
        body: RefreshIndicator(
          onRefresh: () => reloadData(),
          child: data != null
              ? data.messages.isEmpty
                  ? ListView.separated(
                      separatorBuilder: (c, i) => const Divider(),
                      itemCount: data.connections.length,
                      itemBuilder: (context, i) {
                        return ConnectionTile(connection: data.connections[i]);
                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: data.messages
                            .map((e) => Center(
                                    child: Text(
                                  e,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline6,
                                )))
                            .toList(),
                      ),
                    )
              : const Center(child: CircularProgressIndicator()),
        ));
  }

  Future<void> reloadData() async {
    final CffStationboard l = await context.read(cffProvider).stationboard(widget.stopName);
    setState(() {
      data = l;
    });
  }
}

class ConnectionTile extends StatelessWidget {
  final StationboardConnection connection;

  const ConnectionTile({Key key, this.connection}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final diff = connection.time.difference(DateTime.now());
    return ListTile(
      title: Row(
        children: [
          LineWidget(
            background: connection.color.split("~").first,
            foreground: connection.color.split("~")[1],
            line: connection.line,
          ),
          const SizedBox(width: 8),
          Text(
            connection.terminal.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            CffIcon(connection.type, size: 16),
            const SizedBox(width: 8),
            Text(
              connection.number ?? "???",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      trailing: Text(Format.duration(diff)),
    );
  }
}
