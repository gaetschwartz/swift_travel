import 'package:flutter/material.dart';
import 'package:travel_free/api/cff/connectionRoute.dart';
import 'package:travel_free/api/cff/legs.dart';
import 'package:travel_free/utils/format.dart';

class DetailsRoute extends StatelessWidget {
  final ConnectionRoute c;

  const DetailsRoute({Key key, this.c}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          c.to,
        ),
      ),
      body: ListView(
        children: <Widget>[
          customRow("Départ", c.from),
          customRow("Arrivée", c.to),
          customRow("Durée", Format.intToSeconds(c.duration)),
          const Divider(),
          customWay(c.legs),
        ],
      ),
    );
  }

  Widget customRow(String key, dynamic value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(key), Text(value.toString())],
      ),
    );
  }

  Widget customWay(List<Legs> legs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildLegs(legs),
    );
  }

  List<Widget> buildLegs(List<Legs> legs) {
    List<Widget> list = [];
    for (var i = 0; i < legs.length; i++) {
      Legs l = legs[i];
      Legs nextLegs = i == legs.length-1 ? legs[i] : legs[i+1];
      print("type: ${l.type}");
      if (l.type != null) {
        list.add(Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Format.buildIcon(l),
                Text(l.name),
                Text(nextLegs.name),
                if (l.arrival != null)
                  Format.duration(l.arrival.difference(DateTime.now())),
              ],
            )));
        list.add(Divider());
      }
    }
    return list;
  }
}
