import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:travel_free/models/model.dart';

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
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () => _reload())
        ],
      ),
      body: ListView.builder(itemCount: null, itemBuilder: buildItems),
    );
  }

  Widget buildItems(BuildContext _, int i) {
    return const ListTile();
  }

  void _reload() {}
}
