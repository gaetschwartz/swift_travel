import 'package:flutter/material.dart';
import 'package:travel_free/api/cff/leg.dart';

class DetailsLegs extends StatelessWidget {
  final Leg legs;

  const DetailsLegs({Key key, this.legs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(legs.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...buildStopTitle(),
        ],
      ),
    );
  }

  List<Widget> buildStopTitle() {
    final List<Widget> list = [];
    for (final stop in legs.stops) {
      list.add(Text(stop.name));
    }
    return list;
  }
}
