import 'package:flutter/material.dart';
import 'package:travel_free/api/cff/leg.dart';
import 'package:travel_free/api/cff/route_connection.dart';
import 'package:travel_free/api/cff/stop.dart';
import 'package:travel_free/utils/format.dart';
import 'package:travel_free/widget/icon.dart';

class DetailsRoute extends StatelessWidget {
  final RouteConnection c;

  const DetailsRoute({Key key, this.c}) : super(key: key);

  @override
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
          customWay(context, c.legs),
        ],
      ),
    );
  }

  Widget customRow(String key, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key),
          const SizedBox(width: 8),
          Expanded(child: Align(alignment: Alignment.centerRight, child: Text(text)))
        ],
      ),
    );
  }

  Widget customWay(BuildContext context, List<Leg> legs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildLegs(context, legs),
    );
  }

  List<Widget> buildLegs(BuildContext context, List<Leg> legs) {
    final List<Widget> list = [];

    for (var i = 0; i < legs.length; i++) {
      final Leg l = legs[i];
      final Leg nextLeg = i == legs.length - 1 ? legs[i] : legs[i + 1];
      if (l.type != null) {
        if (i == 0) print(l.stopid);

        list.add(ExpansionTile(
          backgroundColor: Theme.of(context).backgroundColor.withAlpha(100),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CffIcon(l.type),
                  const SizedBox(width: 8),
                  Text(l.terminal),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(Format.duration(nextLeg.arrival.difference(l.departure),
                          showExactTime: true)),
                    ),
                  ),
                ],
              ),
              Text("${l.name} - ${nextLeg.name}"),
              Text("${Format.dateToHour(l.departure)} - ${Format.dateToHour(nextLeg.arrival)}"),
            ],
          ),
          children: <Widget>[
            ...buildStopTitle(l, nextLeg),
          ],
        ));
        list.add(const Divider());
      }
    }
    return list;
  }

  List<Widget> buildStopTitle(Leg l, Leg nl) {
    final List<Widget> list = [];
    list.add(_buildStop(Stop(l.name, departure: l.departure), bold: true));

    for (final stop in l.stops) {
      list.add(_buildStop(stop));
    }
    list.add(_buildStop(Stop(nl.name, departure: nl.arrival), bold: true));

    return list;
  }

  Padding _buildStop(Stop stop, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            stop.name,
            style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
          ),
          Text(Format.dateToHour(stop.departure)),
        ],
      ),
    );
  }
}
