import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/connectionRoute.dart';
import 'package:travel_free/api/cff/legs.dart';
import 'package:travel_free/api/cff/route.dart';
import 'package:travel_free/api/cff/stop.dart';
import 'package:travel_free/pages/detailsRoute.dart';
import 'package:travel_free/utils/format.dart';

class SearchRoute extends StatefulWidget {
  @override
  _SearchRouteState createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  Itinerary data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: fromController,
              decoration: const InputDecoration(hintText: "From")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: toController,
              decoration: const InputDecoration(hintText: "To")),
        ),
        RaisedButton(
          onPressed: () async {
            if (fromController.text.length > 2 &&
                toController.text.length > 2) {
              final Itinerary it = await CFF()
                  .route(Stop(fromController.text), Stop(toController.text));
              setState(() {
                data = it;
              });
            }
          },
          child: const Text("Search"),
        ),
        if (data != null)
          ListView.separated(
              separatorBuilder: (c, i) => const Divider(),
              shrinkWrap: true,
              itemCount: data.connections.length,
              itemBuilder: (context, i) {
                final ConnectionRoute c = data.connections[i];
                return ListTile(
                  title: Text("${c.from} -> ${c.to}"),
                  subtitle: rowIcon(c.legs),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(Format.intToSeconds(c.duration)),
                        const SizedBox(
                          width: 5,
                        ),
                        FaIcon(FontAwesomeIcons.chevronRight)
                      ],
                    ),
                  ),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => DetailsRoute(c: c))),
                );
              })
      ],
    );
  }

  Widget rowIcon(List<Legs> legs) {
    final List<Widget> listWidget = [];

    for (final Legs l in legs) {
      print(l.type);
      if (l.type == "bus") {
        listWidget.add(FaIcon(FontAwesomeIcons.bus));
      }
      if (l.type == "tram") {
        listWidget.add(FaIcon(FontAwesomeIcons.subway));
      }
      if (l.type == "walk") {
        listWidget.add(FaIcon(FontAwesomeIcons.walking));
      }
      if (l.type == "express_train") {
        listWidget.add(FaIcon(FontAwesomeIcons.train));
      }
      listWidget.add(const SizedBox(width: 10));
    }
    return Row(
      children: listWidget,
    );
  }
}
