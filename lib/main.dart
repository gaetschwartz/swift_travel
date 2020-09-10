import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_free/tabs/favoritesTab.dart';
import 'package:travel_free/tabs/routeTab.dart';
import 'package:travel_free/tabs/stationsTab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Travel free',
        theme: ThemeData(primarySwatch: Colors.teal, fontFamily: GoogleFonts.lato().fontFamily),
        darkTheme: ThemeData(
            primarySwatch: Colors.teal,
            brightness: Brightness.dark,
            fontFamily: GoogleFonts.lato().fontFamily),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Travel Free"),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(icon: FaIcon(FontAwesomeIcons.search)),
            Tab(icon: FaIcon(FontAwesomeIcons.route)),
            Tab(icon: Icon(Icons.favorite)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          SearchByName(),
          SearchRoute(),
          SearchFavorite(),
        ],
      ),
    );
  }
}
