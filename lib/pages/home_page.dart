import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/pages/settings.dart';
import 'package:swiss_travel/tabs/favorites/favorites_tab.dart';
import 'package:swiss_travel/tabs/routes/route_tab.dart';
import 'package:swiss_travel/tabs/stations/stations_tab.dart';

final tabControllerProvider = StateProvider<TabController>((ref) => null);

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
    var state = context.read(tabControllerProvider).state;
    if (state == null) {
      state = _controller;
    } else {
      throw StateError("There is still a tabController in the provider, "
          "it means that either there still is a "
          "HomePage widget somewhere or it is a bug.");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    context.read(tabControllerProvider).state = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("home-scaffold"),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Swiss Travel",
          key: Key("scaffold-title"),
        ),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(
              icon: FaIcon(FontAwesomeIcons.search),
              key: Key("search-tab-key"),
            ),
            Tab(
              icon: FaIcon(FontAwesomeIcons.route),
              key: Key("route-tab-key"),
            ),
            Tab(
              icon: FaIcon(FontAwesomeIcons.solidStar),
              key: Key("favs-tab-key"),
            ),
          ],
        ),
        actions: [
          IconButton(
              key: const Key("settings"),
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
