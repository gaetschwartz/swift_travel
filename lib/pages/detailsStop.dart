import 'package:flutter/material.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/cff_stationboard.dart';
import 'package:travel_free/api/cff/stationboard_connection.dart';
import 'package:travel_free/utils/format.dart';
import 'package:travel_free/widget/icon.dart';

class DetailsStop extends StatefulWidget {
  final String stop;

  const DetailsStop({Key key, this.stop}) : super(key: key);

  @override
  _DetailsStopState createState() => _DetailsStopState();
}

class _DetailsStopState extends State<DetailsStop> {
  List<StationboardConnection> data = [];

  @override
  void initState() {
    super.initState();
    searchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.stop),
        ),
        body: RefreshIndicator(
          onRefresh: () => searchData(),
          child: data.length > 1
              ? ListView.separated(
                  separatorBuilder: (c, i) => const Divider(),
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return ConnectionTile(
                      connection: data[i],
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator()),
        ));
  }

  Future<void> searchData() async {
    final CffStationboard l = await CFF().timetable(widget.stop);
    setState(() {
      data = l.connections;
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
          DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(colorFromString(connection.color.split("~").first))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                child: Text(
                  connection.line,
                  style: TextStyle(color: Color(colorFromString(connection.color.split("~")[1]))),
                ),
              )),
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
            CffIcon(connection.type, size: 12),
            const SizedBox(width: 8),
            Text(
              connection.number ?? "???",
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      trailing: Text(Format.duration(diff)),
    );
  }
}
