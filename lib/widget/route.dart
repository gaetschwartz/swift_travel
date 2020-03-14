import 'package:flutter/cupertino.dart';
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
  DateTime date = DateTime.now();
  String typeTime = "departure";
  bool switchDepart = false;

  FocusNode fnFrom = FocusNode();
  FocusNode fnTo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: fromController,
              focusNode: fnFrom,
              decoration: const InputDecoration(hintText: "From")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: toController,
              focusNode: fnTo,
              decoration: const InputDecoration(hintText: "To")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text("Depart"),
                  Container(
                    width: 60,
                    height: 30,
                    child: Switch(
                      value: switchDepart,
                      onChanged: (bool value) {
                        setState(() => switchDepart = value);
                      },
                    ),
                  ),
                  const Text("Arrivée"),
                ],
              ),
              RaisedButton(
                child: Text(
                    "${date.hour}:${date.minute} ${date.day}/${date.month}/${date.year}"),
                onPressed: () async {
                  await showCupertinoModalPopup(
                      context: context,
                      builder: (context) => Container(
                            height: 300,
                            child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.dateAndTime,
                                onDateTimeChanged: (d) =>
                                    setState(() => date = d)),
                          ));
                  print("date : $date");
                },
              ),
            ],
          ),
        ),
        RaisedButton(
          onPressed: () async {
            fnFrom.unfocus();
            fnTo.unfocus();
            await searchData();
          },
          child: const Text("Search"),
        ),
        if (data != null)
          RefreshIndicator(
            onRefresh: () async {
              await searchData();
            },
            child: ListView.separated(
                separatorBuilder: (c, i) => const Divider(),
                shrinkWrap: true,
                itemCount: data.connections.length,
                itemBuilder: (context, i) {
                  final ConnectionRoute c = data.connections[i];
                  return ListTile(
                    title: Text("${c.from} -> ${c.to}"),
                    subtitle: rowIcon(c),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(Format.intToSeconds(c.duration)),
                          const SizedBox(
                            width: 5,
                          ),
                          FaIcon(FontAwesomeIcons.chevronRight),
                        ],
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => DetailsRoute(c: c))),
                  );
                }),
          )
      ],
    );
  }

  Widget rowIcon(ConnectionRoute c) {
    final List<Widget> listWidget = [];

    for (int i = 0; i < c.legs.length; i++) {
      final Legs l = c.legs[i];
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
    }
    String min = c.arrival.minute < 10
        ? "0${c.arrival.minute}"
        : c.arrival.minute.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          spacing: 5,
          children: listWidget,
        ),
        const SizedBox(
          height: 3,
        ),
        Text("arrivée à ${c.arrival.hour}h$min")
      ],
    );
  }

  Future<void> searchData() async {
    if (fromController.text.length > 2 && toController.text.length > 2) {
      final Itinerary it = await CFF().route(
        Stop(fromController.text),
        Stop(toController.text),
        when: date,
        typeTime: switchDepart ? "arrival" : "depart",
      );
      setState(() {
        data = it;
      });
    }
  }
}
