import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      body: Column(
        children: <Widget>[
          customRow("Départ", c.from),
          customRow("Arrivée", c.to),
          customRow("Durée", Format.intToSeconds(c.duration)),
          const Divider(thickness: 2),
          Expanded(
            child: ListView.separated(
              itemCount: c.legs.length,
              itemBuilder: (context, i) {
                final Leg l = c.legs[i];
                return LegTile(l: l);
              },
              separatorBuilder: (context, index) => const Divider(indent: 16, endIndent: 16),
            ),
          )
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
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}

class LegTile extends StatelessWidget {
  const LegTile({
    Key key,
    @required this.l,
  }) : super(key: key);

  final Leg l;

  List<Widget> _buildStopTitle(Leg l) {
    final List<Widget> list = [];
    list.add(_buildStop(Stop(l.name, departure: l.departure), bold: true));

    for (final stop in l.stops) {
      list.add(_buildStop(stop));
    }
    list.add(_buildStop(Stop(l.exit.name, departure: l.exit.arrival), bold: true));

    return list;
  }

  Padding _buildStop(Stop stop, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              stop.name,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
            ),
          ),
          if (stop.departure != null) ...[
            const SizedBox(width: 8),
            Text(Format.dateToHour(stop.departure))
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => l.exit == null
      ? ListTile(
          title: Row(
            children: [
              const FaIcon(FontAwesomeIcons.mapPin),
              const SizedBox(width: 8),
              Expanded(child: Text(l.name, style: const TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        )
      : ExpansionTile(
          backgroundColor: Theme.of(context).backgroundColor.withAlpha(100),
          title: Row(
            children: <Widget>[
              CffIcon(l.type),
              const SizedBox(width: 8),
              Expanded(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text(l.exit.name, style: const TextStyle(fontWeight: FontWeight.bold)))),
              if (l.track != null)
                Text(
                  "Tr. ${l.track}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.mapPin,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l.terminal ??
                          (l.type == "walk"
                              ? "Marcher ${Format.intToSeconds(l.runningtime, pad: false)}"
                              : ""),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
                if (l.exit != null)
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.subtitle2,
                    child: Row(
                      children: [
                        Text(
                          "${Format.dateToHour(l.departure)} - ${Format.dateToHour(l.exit.arrival)}",
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(Format.intToSeconds(
                              l.runningtime,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          children: _buildStopTitle(l));
}
