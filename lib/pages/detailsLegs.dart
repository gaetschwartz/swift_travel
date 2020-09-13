import 'package:flutter/material.dart';
import 'package:swiss_travel/api/cff/leg.dart';

class DetailsLegs extends StatelessWidget {
  final Leg leg;

  const DetailsLegs({Key key, this.leg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(leg.name)),
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
    for (final stop in leg.stops) {
      list.add(Text(stop.name));
    }
    return list;
  }
}
