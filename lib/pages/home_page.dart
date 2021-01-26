import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/settings.dart';
import 'package:swift_travel/tabs/favorites/favorites_tab.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stations_tab.dart';
import 'package:swift_travel/utils/page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
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

final sideTabBarProvider = StateProvider<WidgetBuilder>((_) => null);

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  final CupertinoTabController _controller = CupertinoTabController();
  int oldI = 0;
  StateController<int> tab;

  @override
  void initState() {
    super.initState();
    tab = context.read(tabProvider);

    _pageController.addListener(() => tab.state = _pageController.page.round());

    _controller.addListener(() => tab.state = _controller.index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  static const _ratio = 9 / 19.5;

  @override
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);
    return Material(
      child: IfWrapper(
        condition: Responsive.isTablet(context),
        builder: (context, child) {
          return LayoutBuilder(builder: (context, constraints) {
            return Row(children: [
              SizedBox(
                child: child,
                height: constraints.maxHeight,
                width: constraints.maxHeight * _ratio,
              ),
              const SafeArea(child: VerticalDivider(width: 0)),
              Expanded(
                  child: ClipRect(
                child: Navigator(
                  pages: const [SingleWidgetPage(_SideBar())],
                  onGenerateRoute: (s) => onGenerateRoute(s, isDarwin),
                  onPopPage: (_, __) => true,
                ),
              )),
            ]);
          });
        },
        child: isDarwin
            ? CupertinoTabScaffold(
                controller: _controller,
                resizeToAvoidBottomInset: false,
                tabBar: CupertinoTabBar(
                  onTap: (i) {
                    Vibration.selectSoft();
                    if (i == oldI) {
                      if (navigatorKeys[i] != null) {
                        navigatorKeys[i].currentState.popUntil((route) => route.isFirst);
                      }
                    }
                    oldI = i;
                  },
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
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(CupertinoIcons.settings),
                      activeIcon: const Icon(CupertinoIcons.settings_solid),
                      label: Strings.of(context).settings,
                    )
                  ],
                ),
                tabBuilder: (context, i) => Navigator(
                  key: navigatorKeys[i],
                  pages: [SingleWidgetPage(iosTabs[i])],
                  onPopPage: (_, __) => true,
                  onUnknownRoute: (settings) => onUnknownRoute(settings, isDarwin),
                  onGenerateRoute: (settings) => onGenerateRoute(settings, isDarwin),
                ),
              )
            : Scaffold(
                key: const Key('home-scaffold'),
                resizeToAvoidBottomInset: false,
                bottomNavigationBar: Consumer(builder: (context, w, c) {
                  return BottomNavigationBar(
                    onTap: (i) {
                      Vibration.selectSoft();
                      if (_pageController.page != i) {
                        _pageController.animateToPage(i,
                            curve: Curves.fastOutSlowIn,
                            duration: const Duration(milliseconds: 250));
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
                        pages: [SingleWidgetPage(tabs[i])],
                        onPopPage: (_, __) => true,
                        onUnknownRoute: (settings) => onUnknownRoute(settings, isDarwin),
                        onGenerateRoute: (settings) => onGenerateRoute(settings, isDarwin),
                      )
                  ],
                ),
              ),
      ),
    );
  }

  static const iosTabs = [StationsTab(), RouteTab(), FavoritesTab(), Settings()];
  static const tabs = [StationsTab(), RouteTab(), FavoritesTab()];
}

class _SideBar extends StatelessWidget {
  const _SideBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, w, _) =>
            w(sideTabBarProvider).state?.call(context) ??
            Stack(
              children: [
                Positioned.fill(
                  child: OctoImage(
                    image: const CachedNetworkImageProvider(
                        'https://images.unsplash.com/photo-1609920867613-054bfccf1829'),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      'qwJRdKRORjayoej[fja{_4Rjf5fQayj@fRj[%MkDaejtWCazj@j[%1tRfkWBj[f7azayWDj]ogayoejsayayoff5ogofWBWBayoe',
                    ),
                    errorBuilder: OctoError.icon(color: Colors.red),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                    child: Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: const Text(
                            'Start searching a station or an itinerary to start using the app'),
                      ),
                    ),
                  ),
                )),
              ],
            ));
  }
}

extension BuildContextX on BuildContext {
  void push(
    WidgetBuilder builder, {
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String title,
  }) {
    if (Responsive.isTablet(this)) {
      read(sideTabBarProvider).state = builder;
    } else {
      Navigator.of(this).push(platformRoute(builder: builder, isDarwin: Responsive.isDarwin(this)));
    }
  }
}

class Nav {
  static void push(
    BuildContext context,
    WidgetBuilder builder, {
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String title,
  }) =>
      context.push(builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          title: title);
}

final navigatorKeys = <GlobalKey<NavigatorState>>[
  GlobalKey(debugLabel: 'stations tab key'),
  GlobalKey(debugLabel: 'route tab key'),
  GlobalKey(debugLabel: 'favs tab key'),
  GlobalKey(debugLabel: 'settings key'),
];

AppBar swiftTravelAppBar(BuildContext context,
    {List<Widget> actions = const [],
    bool addSettings = true,
    bool isDarwinOverride,
    Widget title}) {
  final isDarwin = isDarwinOverride ?? Responsive.isDarwin(context);
  return AppBar(
    automaticallyImplyLeading: false,
    title: title ?? const Text('Swift Travel'),
    actions: [
      ...actions,
      if (!isDarwin && addSettings)
        IconButton(
            key: const Key('settings'),
            tooltip: Strings.of(context).settings,
            icon: isDarwin ? const Icon(CupertinoIcons.settings) : const Icon(Icons.settings),
            onPressed: () {
              Vibration.select();
              Nav.push(context, (context) => const Settings());
            }),
    ],
  );
}
