import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:swift_travel/blocs/navigation.dart';
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

bool isTablet(BuildContext context) {
  final mq = MediaQuery.of(context);
  return mq.size.longestSide > 640 / mq.devicePixelRatio && mq.orientation == Orientation.landscape;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    context.read(navigationAPIProvider).locale = locale;
  }

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

  @override
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IfWrapper(
        condition: isTablet(context),
        builder: (context, child) {
          return Row(children: [
            ConstrainedBox(
              child: child,
              constraints: const BoxConstraints(maxWidth: 320),
            ),
            const SafeArea(child: VerticalDivider(width: 0)),
            Expanded(
                child: ClipRect(
              child: Navigator(
                key: sideBarNavigatorKey,
                pages: const [SingleWidgetPage(_SideBar(), title: 'Home')],
                onGenerateRoute: (s) => onGenerateRoute(s, isDarwin),
                onPopPage: (_, __) => true,
              ),
            )),
          ]);
        },
        child: isDarwin ? buildCupertinoTabScaffold(context) : buildScaffold(context),
      ),
    );
  }

  CupertinoTabScaffold buildCupertinoTabScaffold(BuildContext context) {
    final items = [
      BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.search),
        label: S.of(context).timetable,
      ),
      BottomNavigationBarItem(
        icon: const FaIcon(CupertinoIcons.train_style_one),
        label: S.of(context).tabs_route,
      ),
      BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.square_favorites_alt),
        activeIcon: const Icon(CupertinoIcons.square_favorites_alt_fill),
        label: S.of(context).tabs_favourites,
      ),
      BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.settings),
        activeIcon: const Icon(CupertinoIcons.settings_solid),
        label: S.of(context).settings,
      )
    ];

    return CupertinoTabScaffold(
      controller: _controller,
      resizeToAvoidBottomInset: false,
      tabBar: CupertinoTabBar(
        onTap: (i) {
          Vibration.selectSoft();
          if (i == oldI) {
            if (navigatorKeys[i] != null) {
              navigatorKeys[i].currentState.popUntil((route) => route.isFirst);
            }
            context.read(sideTabBarProvider).state = null;
          }
          oldI = i;
        },
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.5),
        items: items,
      ),
      tabBuilder: (context, i) => Navigator(
        key: navigatorKeys[i],
        pages: [SingleWidgetPage(iosTabs[i], title: items[i].label)],
        onPopPage: (_, __) => true,
        onUnknownRoute: (settings) => onUnknownRoute(settings, true),
        onGenerateRoute: (settings) => onGenerateRoute(settings, true),
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    final items = [
      BottomNavigationBarItem(
          icon: const Icon(FluentIcons.search_24_regular),
          activeIcon: const Icon(FluentIcons.search_24_filled),
          label: S.of(context).timetable),
      BottomNavigationBarItem(
        icon: const FaIcon(FontAwesomeIcons.route),
        label: S.of(context).tabs_route,
      ),
      BottomNavigationBarItem(
        icon: const Icon(FluentIcons.star_24_regular),
        activeIcon: const Icon(FluentIcons.star_24_filled),
        label: S.of(context).tabs_favourites,
      ),
    ];
    return Scaffold(
      key: const Key('home-scaffold'),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Consumer(builder: (context, w, _) {
        final index = w(tabProvider).state;

        return BottomNavigationBar(
          onTap: (i) {
            Vibration.selectSoft();
            if (_pageController.page != i) {
              _pageController.animateToPage(i,
                  curve: Curves.fastOutSlowIn, duration: const Duration(milliseconds: 250));
            } else if (navigatorKeys[i] != null) {
              navigatorKeys[i].currentState.popUntil((route) => route.isFirst);
              context.read(sideTabBarProvider).state = null;
            }
          },
          currentIndex:
              index >= 0 && index < tabs.length ? index : _pageController.page?.round() ?? 0,
          items: items,
        );
      }),
      body: PageView(
        controller: _pageController,
        children: [
          for (var i = 0; i < tabs.length; i++)
            Navigator(
              key: navigatorKeys[i],
              pages: [SingleWidgetPage(tabs[i], name: items[i].label)],
              onPopPage: (_, __) => true,
              onUnknownRoute: (settings) => onUnknownRoute(settings, false),
              onGenerateRoute: (settings) => onGenerateRoute(settings, false),
            )
        ],
      ),
    );
  }

  static const iosTabs = [StationsTab(), RouteTab(), FavoritesTab(), SettingsPage()];
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
    bool rootNavigator = false,
  }) {
    final isDarwin = Responsive.isDarwin(this);
    if (isTablet(this)) {
      read(sideTabBarProvider).state = builder;
      sideBarNavigatorKey.currentState..popUntil((route) => route.isFirst);
    } else {
      Navigator.of(this, rootNavigator: rootNavigator).push(platformRoute(
        builder: builder,
        isDarwin: isDarwin,
        fullscreenDialog: fullscreenDialog,
        maintainState: maintainState,
        title: title,
        settings: settings,
      ));
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
    bool rootNavigator = false,
  }) =>
      context.push(
        builder,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        title: title,
        rootNavigator: rootNavigator,
      );
}

final navigatorKeys = <GlobalKey<NavigatorState>>[
  GlobalKey(debugLabel: 'stations tab key'),
  GlobalKey(debugLabel: 'route tab key'),
  GlobalKey(debugLabel: 'favs tab key'),
  GlobalKey(debugLabel: 'settings key'),
];

final sideBarNavigatorKey = GlobalKey<NavigatorState>();

AppBar materialAppBar(BuildContext context,
    {List<Widget> actions = const [], bool addSettings = true, Widget title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: title,
    actions: [
      ...actions,
      if (addSettings)
        IconButton(
            key: const Key('settings-button'),
            tooltip: S.of(context).settings,
            icon: const Icon(Icons.settings),
            onPressed: () {
              Vibration.select();
              Nav.push(
                context,
                (context) => const SettingsPage(),
                fullscreenDialog: true,
                rootNavigator: true,
              );
            }),
    ],
  );
}

CupertinoNavigationBar cupertinoBar(
  BuildContext context, {
  Key key,
  Widget leading,
  bool automaticallyImplyLeading = true,
  bool automaticallyImplyMiddle = true,
  String previousPageTitle,
  Widget middle,
  Widget trailing,
  Brightness brightness,
  EdgeInsetsDirectional padding,
  bool transitionBetweenRoutes = true,
  double opacity = 0.5,
}) {
  return CupertinoNavigationBar(
    key: key,
    leading: leading,
    automaticallyImplyLeading: automaticallyImplyLeading,
    automaticallyImplyMiddle: automaticallyImplyMiddle,
    previousPageTitle: previousPageTitle,
    middle: middle,
    trailing: trailing,
    backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(opacity),
    brightness: brightness,
    padding: padding,
    transitionBetweenRoutes: transitionBetweenRoutes,
  );
}
