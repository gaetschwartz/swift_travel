import 'package:flutter/material.dart';
import 'package:travel_free/api/cff/leg.dart';
import 'package:travel_free/api/cff/route_connection.dart';
import 'package:travel_free/pages/detailsLegs.dart';
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
      final Leg nextLegs = i == legs.length - 1 ? legs[i] : legs[i + 1];
      if (l.type != null) {
        if (i == 0) print(l.stopid);

        list.add(InkWell(
          onTap: () {
            if (l.stops != null) {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsLegs(leg: l)));
            }
          },
          child: ExpansionTile(
            backgroundColor: Theme.of(context).backgroundColor.withAlpha(100),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CffIcon(l.type),
                    Text(Format.duration(nextLegs.arrival.difference(l.departure),
                        showExactTime: true)),
                  ],
                ),
                Text("${l.name} ➡ ${nextLegs.name}"),
                Text("${Format.dateToHour(l.departure)} ➡ ${Format.dateToHour(nextLegs.arrival)}"),
                if (l.terminal != null) Text(l.terminal)
              ],
            ),
            children: <Widget>[
              ...buildStopTitle(l),
            ],
          ),
        ));
        list.add(const Divider());
      }
    }
    return list;
  }

  List<Widget> buildStopTitle(Leg l) {
    final List<Widget> list = [];
    for (final stop in l.stops) {
      list.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(stop.name),
            Text(Format.dateToHour(stop.departure)),
          ],
        ),
      ));
    }
    return list;
  }
}
