import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/cff_route.dart';
import 'package:travel_free/api/cff/completion.dart';
import 'package:travel_free/api/cff/leg.dart';
import 'package:travel_free/api/cff/route_connection.dart';
import 'package:travel_free/api/cff/stop.dart';
import 'package:travel_free/pages/detailsRoute.dart';
import 'package:travel_free/utils/format.dart';
import 'package:travel_free/utils/icon.dart';

class SearchRoute extends StatefulWidget {
  @override
  _SearchRouteState createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  CffRoute data;
  DateTime date = DateTime.now();
  String typeTime = "departure";
  bool switchDepart = false;

  FocusNode fnFrom = FocusNode();
  FocusNode fnTo = FocusNode();

  @override
  void dispose() {
    fnFrom.dispose();
    fnTo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
              controller: fromController,
              autofocus: true,
              style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.normal),
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "From")),
          suggestionsCallback: (pattern) async {
            final l = await CFF().complete(pattern);
            return l;
          },
          itemBuilder: (context, Completion suggestion) {
            print(suggestion);
            return ListTile(
              leading: CffIcon(suggestion.iconclass),
              title: Text(suggestion.label),
              subtitle: Text(suggestion.iconclass.split("-").last),
            );
          },
          onSuggestionSelected: (Completion suggestion) {
            setState(() {
              fromController.text = suggestion.label;
            });
          },
        ),
        const SizedBox(height: 3),
        TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
              controller: toController,
              autofocus: true,
              style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.normal),
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "To")),
          suggestionsCallback: (pattern) async {
            final l = await CFF().complete(pattern);
            return l;
          },
          itemBuilder: (context, Completion suggestion) {
            print(suggestion);
            return ListTile(
              leading: CffIcon(suggestion.iconclass),
              title: Text(suggestion.label),
              subtitle:
                  suggestion.iconclass != null ? Text(suggestion.iconclass.split("-").last) : null,
            );
          },
          onSuggestionSelected: (Completion suggestion) {
            setState(() {
              toController.text = suggestion.label;
            });
          },
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
              RaisedButton.icon(
                shape: const StadiumBorder(),
                onPressed: () async {
                  await showCupertinoModalPopup(
                      context: context,
                      builder: (context) => Container(
                            height: 300,
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (d) => setState(() => date = d),
                            ),
                          ));
                  print("date : $date");
                },
                icon: const FaIcon(FontAwesomeIcons.calendar),
                label: Text(
                    "${date.day}/${date.month}/${date.year}  ${date.hour}:${date.minute.toString().padLeft(2, "0")} "),
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
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await searchData();
              },
              child: ListView.separated(
                  separatorBuilder: (c, i) => const Divider(),
                  shrinkWrap: true,
                  itemCount: data.connections.length,
                  itemBuilder: (context, i) {
                    final RouteConnection c = data.connections[i];
                    return RouteTile(c: c);
                  }),
            ),
          )
      ],
    );
  }

  Future<void> searchData() async {
    if (fromController.text.length > 2 && toController.text.length > 2) {
      final CffRoute it = await CFF().route(
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

class RouteTile extends StatelessWidget {
  const RouteTile({
    Key key,
    @required this.c,
  }) : super(key: key);

  final RouteConnection c;

  Widget rowIcon(RouteConnection c) {
    final List<Widget> listWidget = [];

    for (int i = 0; i < c.legs.length - 1; i++) {
      final Leg l = c.legs[i];
      listWidget.add(CffIcon(l.type));
    }
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
        Text(
            "${c.departure.hour}h${c.departure.minute.toString().padLeft(2, "0")} - ${c.arrival.hour}h${c.arrival.minute.toString().padLeft(2, "0")}")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${c.from} ➡ ${c.to}"),
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
            const FaIcon(FontAwesomeIcons.chevronRight),
          ],
        ),
      ),
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsRoute(c: c))),
    );
  }
}
