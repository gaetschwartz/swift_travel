import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/api/cff/cff_completion.dart';
import 'package:travel_free/widget/input.dart';

class SearchFavorite extends StatefulWidget {
  @override
  _SearchFavoriteState createState() => _SearchFavoriteState();
}

class _SearchFavoriteState extends State<SearchFavorite> with AutomaticKeepAliveClientMixin {
  List<CffCompletion> favoritesStop = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> list = prefs.getStringList("favoritesStop") ?? [];
    final List<CffCompletion> lComp = [];
    for (final l in list) {
      final List<CffCompletion> c = await context.read(cffProvider).complete(l);
      lComp.add(c[0]);
    }
    setState(() {
      favoritesStop = lComp;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async => loadFavorites(),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () async {
              final String s =
                  await showDialog(context: context, builder: (_) => TextInputDialog());
              if (s == null) return;

              final List<CffCompletion> list = await context.read(cffProvider).complete(s);
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              final List<String> listPrefs = prefs.getStringList("favoritesStop") ?? [];
              listPrefs.add(list[0].label);
              prefs.setStringList("favoritesStop", listPrefs);
              await loadFavorites();
            },
            child: const Text("Add Fav"),
          ),
          if (favoritesStop != null)
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(
                  favoritesStop.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(favoritesStop[index].label),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
