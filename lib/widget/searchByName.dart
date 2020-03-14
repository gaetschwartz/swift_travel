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
  void initState() {
    super.initState();
    searchData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: false,
          expandedHeight: 50,
          flexibleSpace: FlexibleSpaceBar(
            title: TextField(
              controller: searchController,
              autocorrect: false,
              onChanged: (_) async {
                await searchData();
              },
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, i) {
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
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => DetailsStop(stop: t.label))),
          );
        }, childCount: data.length))
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
