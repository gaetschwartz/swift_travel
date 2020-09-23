import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/pages/settings.dart';
import 'package:swiss_travel/tabs/favorites/favorites_tab.dart';
import 'package:swiss_travel/tabs/routes/route_tab.dart';
import 'package:swiss_travel/tabs/stations/stations_tab.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();

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
        automaticallyImplyLeading: false,
        title: const Text("Swiss Travel"),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(
              icon: FaIcon(FontAwesomeIcons.search),
              key: ValueKey("search-tab-key"),
            ),
            Tab(
              icon: FaIcon(FontAwesomeIcons.route),
              key: ValueKey("route-tab-key"),
            ),
            Tab(
              icon: FaIcon(FontAwesomeIcons.solidStar),
              key: ValueKey("favs-tab-key"),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Settings()));
              }),
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          SearchByName(),
          SearchRoute(),
          SearchFavorite(),
        ],
      ),
    );
  }
}
