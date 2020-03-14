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
          Divider(),
          customWay(c.legs[0]),
        ],
      ),
    );
  }

  Widget customRow(String key, dynamic value){
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text(key), Text(value.toString())],
            ),
          );
  }
  Widget customWay(Legs legs){
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text(legs.type), Text(legs.arrival.toString())],
            ),
          );
  }
}
