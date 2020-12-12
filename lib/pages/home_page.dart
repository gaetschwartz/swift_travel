import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/pages/settings.dart';
import 'package:swift_travel/tabs/favorites/favorites_tab.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stations_tab.dart';
import 'package:utils/widgets/responsive.dart';
import 'package:vibration/vibration.dart';

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
    final isDarwin = ResponsiveWidget.isDarwin(context);
    return Scaffold(
      key: const Key("home-scaffold"),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Consumer(builder: (context, w, c) {
        return BottomNavigationBar(
          onTap: (i) {
            Vibration.selectionHeavy();
            _pageController.animateToPage(i,
                curve: Curves.fastOutSlowIn, duration: const Duration(milliseconds: 250));
          },
          currentIndex: w(_tabProvider).state,
          items: [
            if (isDarwin)
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: "Search",
              )
            else
              const BottomNavigationBarItem(
                icon: Icon(Icons.search_sharp),
                activeIcon: Icon(Icons.search),
                label: "Search",
              ),
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.route),
              label: "Route",
            ),
            if (isDarwin)
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_favorites_alt),
                activeIcon: Icon(CupertinoIcons.square_favorites_alt_fill),
                label: "Favorites",
              )
            else
              const BottomNavigationBarItem(
                icon: Icon(Icons.star_border_sharp),
                activeIcon: Icon(Icons.star),
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
              icon: isDarwin ? const Icon(CupertinoIcons.gear_solid) : const Icon(Icons.settings),
              onPressed: () {
                Vibration.select();
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
