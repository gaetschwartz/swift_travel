import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/completions.dart';
import 'package:travel_free/pages/detailsStop.dart';
import 'package:travel_free/utils/format.dart';

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
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
              controller: searchController,
              autofocus: true,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.normal),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Stop")),
          suggestionsCallback: (pattern) async {
            final l = await CFF().complete(pattern);
            return l;
          },
          itemBuilder: (context, Completion suggestion) {
            print(suggestion);
            return ListTile(
              leading: Format.completionToIcon(suggestion),
              title: Text(suggestion.label),
              subtitle: Text(suggestion.iconClass.split("-").last),
            );
          },
          onSuggestionSelected: (Completion suggestion) {
            setState(() {
              searchController.text = suggestion.label;
              searchData(suggestion.label);
            });
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(data[i].label),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DetailsStop(stop: data[i].label))),
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
