import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:travel_free/api/cff.dart';
import 'package:travel_free/models/model.dart';
import 'package:travel_free/widget/searchByName.dart';

import 'api/cff/completions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [Inject(() => Model())],
      builder: (_) => MaterialApp(
        title: 'Travel free',
        theme: ThemeData(
            primarySwatch: Colors.teal,
            fontFamily: GoogleFonts.lato().fontFamily),
        darkTheme: ThemeData(
            primarySwatch: Colors.teal,
            brightness: Brightness.dark,
            fontFamily: GoogleFonts.lato().fontFamily),
        themeMode: ThemeMode.system,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: () => _reload())
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SearchByName(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }

  Future<void> _reload() async {
    final List<Completion> list = await CFF().complete("lu");
    for (final c in list) {
      print(c.toString());
    }
  }
}
