import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/tabs/favorites/favorites_tab.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stations_tab.dart';
import 'package:utils/widgets/responsive.dart';
import 'package:vibration/vibration.dart';

final _tabProvider = StateProvider<int>((ref) => 0);

class MainApp extends StatefulWidget {
  const MainApp();

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
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
      key: const Key('home-scaffold'),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Consumer(builder: (context, w, c) {
        return BottomNavigationBar(
          onTap: (i) {
            Vibration.selectSoft();
            _pageController.animateToPage(i,
                curve: Curves.fastOutSlowIn, duration: const Duration(milliseconds: 250));
          },
          currentIndex: w(_tabProvider).state,
          items: [
            if (isDarwin)
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.search),
                label: Strings.of(context).search,
              )
            else
              BottomNavigationBarItem(
                  icon: const Icon(Icons.search_sharp),
                  activeIcon: const Icon(Icons.search),
                  label: Strings.of(context).search),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.route),
              label: Strings.of(context).tabs_route,
            ),
            if (isDarwin)
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.square_favorites_alt),
                activeIcon: const Icon(CupertinoIcons.square_favorites_alt_fill),
                label: Strings.of(context).tabs_favourites,
              )
            else
              BottomNavigationBarItem(
                icon: const Icon(Icons.star_border_sharp),
                activeIcon: const Icon(Icons.star),
                label: Strings.of(context).tabs_favourites,
              ),
          ],
        );
      }),
      body: PageView(
        controller: _pageController,
        children: const [
          StationsTab(),
          RouteSearchTab(),
          FavoritesTab(),
        ],
      ),
    );
  }
}

AppBar swiftTravelAppBar(BuildContext context, {bool isDarwin = true}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text(
      'Swift Travel',
      key: Key('scaffold-title'),
    ),
    actions: [
      IconButton(
          key: const Key('settings'),
          tooltip: Strings.of(context).settings,
          icon: isDarwin ? const Icon(CupertinoIcons.gear_solid) : const Icon(Icons.settings),
          onPressed: () {
            Vibration.select();
            Navigator.of(context, rootNavigator: true).pushNamed("/settings");
          }),
    ],
  );
}
