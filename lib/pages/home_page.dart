import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/tabs/favorites/favorites_tab.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stations_tab.dart';
import 'package:swift_travel/utils/page.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

final tabProvider = StateProvider((_) => 0);

class PageNotifier extends StateNotifier<int> {
  final CupertinoTabController controller;
  PageNotifier(int state, this.controller) : super(state);

  @override
  set state(int value) {
    super.state = value;
    controller.index = value;
  }

  @override
  int get state => super.state;
}

class MainApp extends StatefulWidget {
  const MainApp();

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  final CupertinoTabController _controller = CupertinoTabController();

  @override
  void initState() {
    super.initState();
    final _tab = context.read(tabProvider);

    _pageController.addListener(() => _tab.state = _pageController.page.round());

    _controller.addListener(() => _tab.state = _controller.index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);
    return isDarwin
        ? ProviderListener<StateController<int>>(
            onChange: (context, value) => _controller.index = value.state,
            provider: tabProvider,
            child: Material(
              child: CupertinoTabScaffold(
                controller: _controller,
                resizeToAvoidBottomInset: false,
                tabBar: CupertinoTabBar(
                  activeColor: CupertinoColors.activeBlue,
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(CupertinoIcons.search),
                      label: Strings.of(context).search,
                    ),
                    BottomNavigationBarItem(
                      icon: const FaIcon(CupertinoIcons.train_style_one),
                      label: Strings.of(context).tabs_route,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(CupertinoIcons.square_favorites_alt),
                      activeIcon: const Icon(CupertinoIcons.square_favorites_alt_fill),
                      label: Strings.of(context).tabs_favourites,
                    )
                  ],
                ),
                tabBuilder: (context, i) => Navigator(
                  key: navigatorKeys[i],
                  pages: [SinglePageNavigator(tabs[i])],
                  onPopPage: (_, __) => false,
                ),
              ),
            ),
          )
        : ProviderListener<StateController<int>>(
            onChange: (context, value) => _pageController.jumpToPage(value.state),
            provider: tabProvider,
            child: Scaffold(
              key: const Key('home-scaffold'),
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: Consumer(builder: (context, w, c) {
                return BottomNavigationBar(
                  onTap: (i) {
                    Vibration.selectSoft();
                    if (_pageController.page != i) {
                      _pageController.animateToPage(i,
                          curve: Curves.fastOutSlowIn, duration: const Duration(milliseconds: 250));
                    } else if (navigatorKeys[i] != null) {
                      navigatorKeys[i].currentState.popUntil((route) => route.isFirst);
                    }
                  },
                  currentIndex: w(tabProvider).state,
                  items: [
                    BottomNavigationBarItem(
                        icon: const Icon(FluentIcons.search_24_regular),
                        activeIcon: const Icon(FluentIcons.search_24_filled),
                        label: Strings.of(context).search),
                    BottomNavigationBarItem(
                      icon: const FaIcon(FontAwesomeIcons.route),
                      label: Strings.of(context).tabs_route,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(FluentIcons.star_24_regular),
                      activeIcon: const Icon(FluentIcons.star_24_filled),
                      label: Strings.of(context).tabs_favourites,
                    ),
                  ],
                );
              }),
              body: PageView(
                controller: _pageController,
                children: [
                  for (var i = 0; i < tabs.length; i++)
                    Navigator(
                      key: navigatorKeys[i],
                      pages: [SinglePageNavigator(tabs[i])],
                      onPopPage: (_, __) => false,
                    )
                ],
              ),
            ),
          );
  }

  static const tabs = [StationsTab(), RouteTab(), FavoritesTab()];
}

final navigatorKeys = <GlobalKey<NavigatorState>>[GlobalKey(), GlobalKey(), null];

AppBar swiftTravelAppBar(BuildContext context,
    {List<Widget> actions = const [], bool addSettings = true, bool isDarwinOverride}) {
  final isDarwin = isDarwinOverride ?? Responsive.isDarwin(context);
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text('Swift Travel'),
    actions: [
      ...actions,
      if (addSettings)
        IconButton(
            key: const Key('settings'),
            tooltip: Strings.of(context).settings,
            icon: isDarwin ? const Icon(CupertinoIcons.settings) : const Icon(Icons.settings),
            onPressed: () {
              Vibration.select();
              Navigator.of(context, rootNavigator: true).pushNamed("/settings");
            }),
    ],
  );
}
