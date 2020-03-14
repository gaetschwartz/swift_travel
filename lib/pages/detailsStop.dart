import 'package:flutter/material.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/connection.dart';
import 'package:travel_free/api/cff/stop.dart';
import 'package:travel_free/api/cff/timetable.dart';
import 'package:intl/intl.dart' as intl;
import 'package:travel_free/utils/format.dart';

class DetailsStop extends StatelessWidget {
  final String stop;

  const DetailsStop({Key key, this.stop}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stop),
      ),
      body: FutureBuilder<TimeTable>(
        future: CFF().timetable(Stop(stop)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            List<Connection> c = snapshot.data.connections;
            return ListView.builder(
              itemCount: c.length,
              itemBuilder: (context, i) {
                return ConnectionTile(
                  connection: c[i],
                );
              },
            );
          } else {
            return Center(child:CircularProgressIndicator());
          }
        },
      ),
    );
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
      trailing: Format.duration(diff),
    );
  }
}
