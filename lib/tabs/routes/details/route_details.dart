import 'package:flutter/material.dart';
import 'package:swiss_travel/api/cff/models/leg.dart';
import 'package:swiss_travel/api/cff/models/route_connection.dart';
import 'package:swiss_travel/api/cff/models/types_enum.dart';
import 'package:swiss_travel/tabs/routes/details/arrived_tile.dart';
import 'package:swiss_travel/tabs/routes/details/regular_leg_tile.dart';
import 'package:swiss_travel/tabs/routes/details/walking_tile.dart';
import 'package:swiss_travel/utils/format.dart';

class RouteDetails extends StatelessWidget {
  final RouteConnection c;

  const RouteDetails({Key key, this.c}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(c.to),
      ),
      body: Column(
        children: <Widget>[
          _dataRow("Departure", c.from),
          _dataRow("Arrival", c.to),
          _dataRow("Travel duration", Format.intToDuration(c.duration.round())),
          const Divider(thickness: 2, height: 4),
          Expanded(
            child: ListView.builder(
              itemCount: c.legs.length,
              itemBuilder: (context, i) {
                final Leg l = c.legs[i];
                return LegTile(l: l);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _dataRow(String key, String text) {
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

  @override
  Widget build(BuildContext context) => l.exit == null
      ? ArrivedTile(l: l)
      : l.type == Vehicle.walk
          ? WalkingTile(l: l)
          : RegularLegTile(l: l);
}
