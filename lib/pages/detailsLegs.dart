import 'package:flutter/material.dart';
import 'package:travel_free/api/cff/legs.dart';

class DetailsLegs extends StatelessWidget {
  final Legs legs;

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
    for (var stop in legs.stops) {
      print("${stop.x}, ${stop.y}");
      list.add(Text(stop.name));
    }
    return list;
  }
}
