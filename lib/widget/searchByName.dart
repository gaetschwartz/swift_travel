import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/completions.dart';
import 'package:travel_free/pages/detailsStop.dart';

class SearchByName extends StatefulWidget {
  @override
  _SearchByNameState createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> {
  TextEditingController searchController = TextEditingController();
  List<Completion> data = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            autocorrect: false,
            onChanged: (_) async {
              await searchData();
            },
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, i) {
              var t = data[i];
              var icon = FaIcon(FontAwesomeIcons.search);
              if (t.iconClass == "sl-icon-type-train") {
                icon = FaIcon(FontAwesomeIcons.train);
              } else if (t.iconClass == "sl-icon-type-bus") {
                icon = FaIcon(FontAwesomeIcons.bus);
              } else if (t.iconClass == "sl-icon-type-tram") {
                icon = FaIcon(FontAwesomeIcons.train);
              } else if (t.iconClass == "sl-icon-tel-private") {
                icon = FaIcon(FontAwesomeIcons.home);
              }
              return ListTile(
                leading: icon,
                title: Text(t.label),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => DetailsStop(stop: t.label))),
              );
            }),
      ],
    );
  }

  Future<void> searchData() async {
    var list = await CFF().complete(searchController.text);
    setState(() {
      data = list;
    });
  }
}
