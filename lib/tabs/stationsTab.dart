import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/completion.dart';
import 'package:travel_free/pages/detailsStop.dart';
import 'package:travel_free/widget/icon.dart';

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
    searchData("");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TypeAheadField<Completion>(
          textFieldConfiguration: TextFieldConfiguration(
              controller: searchController,
              style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.normal),
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Stop")),
          suggestionsCallback: (pattern) async {
            final l = await CFF().complete(pattern);
            return l;
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              leading: CffIcon(suggestion.iconclass),
              title: Text(suggestion.label),
              dense: true,
            );
          },
          onSuggestionSelected: (suggestion) => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => DetailsStop(stop: suggestion.label))),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(data[i].label),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => DetailsStop(stop: data[i].label))),
            );
          },
        )
      ],
    );
  }

  Future<void> searchData(String p) async {
    final list = await CFF().complete(p);
    setState(() {
      data = list;
    });
  }
}
