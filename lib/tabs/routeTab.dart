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
import 'package:travel_free/widget/icon.dart';

class SearchRoute extends StatefulWidget {
  @override
  _SearchRouteState createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final FocusNode fnFrom = FocusNode();
  final FocusNode fnTo = FocusNode();

  CffRoute data;
  DateTime date = DateTime.now();
  String typeTime = "departure";
  bool switchDepart = false;

  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();

  @override
  void dispose() {
    fnFrom.dispose();
    fnTo.dispose();
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TypeAheadField<Completion>(
            debounceDuration: const Duration(milliseconds: 500),
            textFieldConfiguration: TextFieldConfiguration(
                controller: fromController,
                style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.normal),
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "From")),
            suggestionsCallback: (pattern) => CFF().complete(pattern),
            itemBuilder: (context, suggestion) => ListTile(
              leading: CffIcon(suggestion.iconclass),
              title: Text(suggestion.label),
              dense: true,
            ),
            onSuggestionSelected: (suggestion) => fromController.text = suggestion.label,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TypeAheadField<Completion>(
            debounceDuration: const Duration(milliseconds: 500),
            textFieldConfiguration: TextFieldConfiguration(
                controller: toController,
                style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.normal),
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "To")),
            suggestionsCallback: (pattern) => CFF().complete(pattern),
            itemBuilder: (context, suggestion) => ListTile(
              leading: CffIcon(suggestion.iconclass),
              title: Text(suggestion.label),
              dense: true,
            ),
            onSuggestionSelected: (suggestion) => toController.text = suggestion.label,
          ),
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
                      onChanged: (value) {
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
                },
                icon: const FaIcon(FontAwesomeIcons.calendar),
                label: Text(
                    "${date.day}/${date.month}/${date.year}  ${date.hour}:${date.minute.toString().padLeft(2, "0")} "),
              ),
            ],
          ),
        ),
        RaisedButton.icon(
          icon: const FaIcon(FontAwesomeIcons.search),
          onPressed: () async {
            fnFrom.unfocus();
            fnTo.unfocus();
            _refreshKey.currentState.show();
          },
          shape: const StadiumBorder(),
          label: const Text("Search"),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await searchData();
            },
            key: _refreshKey,
            child: ListView.separated(
                separatorBuilder: (c, i) => const Divider(),
                shrinkWrap: true,
                itemCount: data == null ? 0 : data.connections.length,
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
      setState(() => data = it);
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
      listWidget.add(CffIcon(l.type, size: 20));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(spacing: 8, children: listWidget),
        const SizedBox(height: 4),
        Text("${Format.dateToHour(c.departure)} - ${Format.dateToHour(c.arrival)}")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${c.from} > ${c.to}"),
      subtitle: rowIcon(c),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(Format.intToSeconds(c.duration)),
            const SizedBox(width: 5),
            const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
          ],
        ),
      ),
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsRoute(c: c))),
    );
  }
}
