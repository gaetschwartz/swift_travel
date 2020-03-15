import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchFavorite extends StatefulWidget {
  @override
  _SearchFavoriteState createState() => _SearchFavoriteState();
}

class _SearchFavoriteState extends State<SearchFavorite> {
  List<String> favoritesStop = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      favoritesStop = prefs.getStringList("favoritesStop");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text("Add Fav"),
          onPressed: (){
            print("add fav");
          },
        ),
        GridView.count(
            crossAxisCount: 3,
            children: List.generate(favoritesStop.length, (index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.red,
                ),
              );
            })),
      ],
    );
  }
}
