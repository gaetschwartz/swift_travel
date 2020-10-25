import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/pages/settings.dart';
import 'package:swift_travel/tabs/favorites/favorites_tab.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stations_tab.dart';

final _tabProvider = StateProvider<int>((ref) => 0);

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    final StateController<int> _tab = context.read(_tabProvider);

    _pageController.addListener(() {
      final round = _pageController.page.round();
      if (round != _tab.state) _tab.state = round;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("home-scaffold"),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Consumer(builder: (context, w, c) {
        return BottomNavigationBar(
          onTap: (i) => _pageController.animateToPage(i,
              curve: Curves.fastOutSlowIn, duration: const Duration(milliseconds: 250)),
          currentIndex: w(_tabProvider).state,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.route),
              label: "Route",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidStar),
              label: "Favorites",
            ),
          ],
        );
      }),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Swift Travel",
          key: Key("scaffold-title"),
        ),
        actions: [
          IconButton(
              key: const Key("settings"),
              tooltip: "Settings",
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Settings()));
              }),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          SearchByName(),
          SearchRoute(),
          SearchFavorite(),
        ],
      ),
    );
  }
}
