import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/completions.dart';
import 'package:travel_free/api/cff/stop.dart';
import 'package:travel_free/widget/input.dart';

class SearchFavorite extends StatefulWidget {
  @override
  _SearchFavoriteState createState() => _SearchFavoriteState();
}

class _SearchFavoriteState extends State<SearchFavorite> {
  List<Completion> favoritesStop = [];
  

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList("favoritesStop");
    List<Completion> lComp = [];
    for (var l in list) {
      List<Completion> c = await CFF().complete(l);
      lComp.add(c[0]);
    }
    setState(() {
      favoritesStop = lComp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await loadFavorites();
      },
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          FlatButton(
            onPressed: () async {
              String s = await showDialog(
                  context: context, builder: (_) => TextInputDialog());

              final List<Completion> list = await CFF().complete(s);
              print(list[0].label);
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              final List<String> listPrefs =
                  prefs.getStringList("favoritesStop") ?? [];
              listPrefs.add(list[0].label);
              prefs.setStringList("favoritesStop", listPrefs);
              await loadFavorites();
            },
            child: const Text("Add Fav"),
          ),
          if (favoritesStop != null)
            GridView.count(
              shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(favoritesStop.length, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.red,
                      
                    ),
                    child: Text(favoritesStop[index].label),
                  );
                })),
        ],
      ),
    );
  }
}
