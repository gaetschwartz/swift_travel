import 'package:flutter/material.dart';
import 'package:travel_free/api/cff/connectionRoute.dart';
import 'package:travel_free/api/cff/legs.dart';
import 'package:travel_free/pages/detailsLegs.dart';
import 'package:travel_free/utils/format.dart';

class DetailsRoute extends StatelessWidget {
  final ConnectionRoute c;

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

  Widget customRow(String key, dynamic value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(key), Text(value.toString())],
      ),
    );
  }

  Widget customWay(BuildContext context, List<Legs> legs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildLegs(context, legs),
    );
  }

  List<Widget> buildLegs(BuildContext context, List<Legs> legs) {
    final List<Widget> list = [];

    for (var i = 0; i < legs.length; i++) {
      final Legs l = legs[i];
      final Legs nextLegs = i == legs.length - 1 ? legs[i] : legs[i + 1];
      if (l.type != null) {
        if (i == 0) print(l.stopid);

        list.add(InkWell(
          onTap: () {
            if (l.stops != null) {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsLegs(legs: l)));
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
                    Format.buildIconFromLegs(l),
                    Text(Format.duration(nextLegs.arrival.difference(l.departure),
                        showExactTime: true)),
                  ],
                ),
                Text("${l.name} -> ${nextLegs.name}"),
                Text("${Format.dateToHour(l.departure)} -> ${Format.dateToHour(nextLegs.arrival)}"),
                if (l.terminal != null) Text(l.terminal)
              ],
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (l.stops != null) ...buildStopTitle(l),
                  ],
                ),
              ),
            ],
          ),
        ));
        list.add(const Divider());
      }
    }
    return list;
  }

  List<Widget> buildStopTitle(Legs l) {
    final List<Widget> list = [];
    for (final stop in l.stops) {
      list.add(Text(stop.name));
    }
    return list;
  }
}
