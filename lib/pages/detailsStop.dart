import 'package:flutter/material.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/connection.dart';
import 'package:travel_free/api/cff/stop.dart';
import 'package:travel_free/utils/format.dart';

class DetailsStop extends StatefulWidget {
  final String stop;

  const DetailsStop({Key key, this.stop}) : super(key: key);

  @override
  _DetailsStopState createState() => _DetailsStopState();
}

class _DetailsStopState extends State<DetailsStop> {
  List<Connection> data = [];

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
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) {
              return ConnectionTile(
                connection: data[i],
              );
            },
          ),
        ));
  }

  Future<void> searchData() async {
    final l = await CFF().timetable(Stop(widget.stop));
    setState(() {
      data = l.connections;
    });
  }
}

class ConnectionTile extends StatelessWidget {
  final Connection connection;

  const ConnectionTile({Key key, this.connection}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final diff = connection.time.difference(DateTime.now());
    return ListTile(
      title:
          /* Align(
        alignment: Alignment.centerLeft,
              child: Container(
          alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF000000 +
                    int.parse("0x${connection.color.split("~").first}"))),
            child: Text(connection.l)), */
          Text(connection.l),
      trailing: Text(Format.duration(diff)),
    );
  }
}
