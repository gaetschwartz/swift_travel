import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_free/tabs/favoritesTab.dart';
import 'package:travel_free/tabs/routeTab.dart';
import 'package:travel_free/tabs/stationsTab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel free',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(
          primarySwatch: Colors.teal,
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.lato().fontFamily),
      home: MyHomePage(),
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Travel Free"),
          actions: const <Widget>[
            // IconButton(icon: Icon(Icons.refresh), onPressed: () => _reload())
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: FaIcon(FontAwesomeIcons.search)),
              Tab(icon: FaIcon(FontAwesomeIcons.route)),
              Tab(icon: Icon(Icons.favorite)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SearchByName(),
            SearchRoute(),
            SearchFavorite(),
          ],
        ),
      ),
    );
  }
}
