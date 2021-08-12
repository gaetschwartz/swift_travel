import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octo_image/octo_image.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/settings/settings.dart';
import 'package:swift_travel/tabs/favorites/favorites_tab.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stations_tab.dart';
import 'package:swift_travel/utils/colors.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/page.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:vibration/vibration.dart';

final tabProvider = ChangeNotifierProvider<CupertinoTabController>((ref) {
  final cupertinoPageController = CupertinoTabController();

  return cupertinoPageController;
});

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();

  static const iosTabs = [StationsTab(), RouteTab(), FavoritesTab(), SettingsPage()];
  static const androidTabs = [StationsTab(), RouteTab(), FavoritesTab()];
  static const sideBarWidth = 350.0;
}

final sideTabBarProvider = StateProvider<WidgetBuilder?>((_) => null);

bool shouldShowSidebar(BuildContext context) {
  final mq = MediaQuery.of(context);
  final s = mq.size.longestSide / mq.devicePixelRatio;
  return s > TabView.sideBarWidth && mq.orientation == Orientation.landscape;
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  int oldI = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read(navigationAPIProvider).locale = Localizations.localeOf(context);
  }

  late final cupertinoItems = [
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.search),
      label: AppLoc.of(context).timetable,
    ),
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.train_style_one),
      label: AppLoc.of(context).tabs_route,
    ),
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.square_favorites_alt),
      activeIcon: const Icon(CupertinoIcons.square_favorites_alt_fill),
      label: AppLoc.of(context).tabs_favourites,
    ),
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.settings),
      activeIcon: const Icon(CupertinoIcons.settings_solid),
      label: AppLoc.of(context).settings,
    )
  ];

  late final titles = [
    AppLoc.of(context).timetable,
    AppLoc.of(context).tabs_route,
    AppLoc.of(context).tabs_favourites,
  ];
  late final materialItems = [
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.search),
      label: titles[0],
    ),
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.list_dash),
      label: titles[1],
    ),
    BottomNavigationBarItem(
      icon: const Icon(CupertinoIcons.star),
      activeIcon: const Icon(CupertinoIcons.star_fill),
      label: titles[2],
    ),
  ];

  @override
  Widget build(BuildContext context) => IfWrapper(
        condition: shouldShowSidebar(context),
        builder: (context, child) => Row(children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: TabView.sideBarWidth),
            child: child,
          ),
          const SafeArea(child: VerticalDivider(width: 0)),
          Expanded(
              child: ClipRect(
            child: Material(
              child: Navigator(
                key: sideBarNavigatorKey,
                pages: const [SingleWidgetPage<void>(_SideBar())],
                onPopPage: (_, dynamic __) => false,
              ),
            ),
          )),
        ]),
        child: PlatformBuilder(
          cupertinoBuilder: (context, _) => buildCupertinoTabScaffold(context),
          materialBuilder: (context, _) => buildScaffold(context),
        ),
      );

  Widget buildCupertinoTabScaffold(BuildContext context) => Consumer(builder: (context, w, _) {
        final tabController = w(tabProvider.notifier);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: CupertinoTabScaffold(
            controller: tabController,
            resizeToAvoidBottomInset: false,
            tabBar: CupertinoTabBar(
              onTap: (i) {
                Vibration.instance.selectSoft();
                if (i == oldI) {
                  navigatorKeys[i].currentState!.popUntil((route) => route.isFirst);
                  context.read(sideTabBarProvider).state = null;
                }
                oldI = i;
              },
              backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.5),
              items: cupertinoItems,
            ),
            tabBuilder: (context, i) => Navigator(
              key: navigatorKeys[i],
              pages: [SingleWidgetPage<void>(TabView.iosTabs[i], title: cupertinoItems[i].label)],
              onPopPage: (_, dynamic __) => true,
              onUnknownRoute: (settings) => onUnknownRoute(settings, isDarwin: true),
              onGenerateRoute: (settings) => onGenerateRoute(settings, isDarwin: true),
            ),
          ),
        );
      });

  List<Color> gradient(Color c) => [
        augment(c),
        c,
      ];

  Widget buildScaffold(BuildContext context) => Consumer(builder: (context, w, _) {
        final controllers = w(tabProvider);
        final page = controllers.index % TabView.androidTabs.length;

        return Scaffold(
          key: const Key('home-scaffold'),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar:
              SwiftNavigationBar(controllers: controllers, page: page, items: materialItems),
          body: PageTransitionSwitcher(
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) => child,
            duration: Duration.zero,
            child: Navigator(
              key: navigatorKeys[page],
              pages: [SingleWidgetPage<void>(TabView.androidTabs[page], name: titles[page])],
              onPopPage: (_, dynamic __) => true,
              onUnknownRoute: (settings) => onUnknownRoute(settings, isDarwin: false),
              onGenerateRoute: (settings) => onGenerateRoute(settings, isDarwin: false),
            ),
          ),
        );
      });
}

class SwiftNavigationBar extends StatelessWidget {
  const SwiftNavigationBar({
    required this.controllers,
    required this.page,
    required this.items,
    this.activeColor,
    Key? key,
  }) : super(key: key);

  final CupertinoTabController controllers;
  final int page;
  final List<BottomNavigationBarItem> items;
  final Color? activeColor;

  static const height = 64.0;

  @override
  Widget build(BuildContext context) {
    final _activeColor = activeColor ?? Theme.of(context).colorScheme.secondary;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: (ShadowTheme.of(context).buttonShadow?.color ?? Colors.grey).withAlpha(24),
            blurRadius: 32,
          )
        ],
      ),
      child: Material(
        child: SafeArea(
          child: SizedBox(
            height: height,
            child: Row(
              children: [
                for (var i = 0; i < items.length; i++)
                  _TabWidget(
                    controllers: controllers,
                    page: page,
                    item: items[i],
                    i: i,
                    activeColor: _activeColor,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabWidget extends StatelessWidget {
  const _TabWidget({
    required this.page,
    required this.controllers,
    required this.item,
    required this.i,
    required this.activeColor,
    Key? key,
  }) : super(key: key);

  final int page;
  final CupertinoTabController controllers;
  final BottomNavigationBarItem item;
  final int i;
  final Color activeColor;

  @override
  Widget build(BuildContext context) => Expanded(
          child: DefaultTextStyle(
        style: page == i
            ? Theme.of(context).textTheme.bodyText2!.copyWith(color: activeColor)
            : Theme.of(context).textTheme.bodyText2!,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              onTap: () {
                Vibration.instance.selectSoft();
                if (controllers.index != i) {
                  controllers.index = i;
                } else {
                  navigatorKeys[i].currentState?.popUntil((route) => route.isFirst);
                  context.read(sideTabBarProvider).state = null;
                }
              },
              splashColor: Theme.of(context).primaryColor.withAlpha(32),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (i != page)
                        item.icon
                      else
                        GradientMask(
                          gradient: LinearGradient(
                            colors: [
                              activeColor,
                              augment2(activeColor, strength: 0.3),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          child: item.activeIcon,
                        ),
                      if (item.label != null) Text(item.label!),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ));
}

class _SideBar extends StatelessWidget {
  const _SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(
      builder: (context, w, _) =>
          w(sideTabBarProvider).state?.call(context) ??
          Stack(
            children: [
              Positioned.fill(
                child: OctoImage(
                  image: const AssetImage('assets/pictures/train.jfif'),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'qwJRdKRORjayoej[fja{_4Rjf5fQayj@fRj[%MkDaejtWCazj@j[%1tRfkWBj[f7azayWDj]ogayoejsayayoff5ogofWBWBayoe',
                  ),
                  errorBuilder: OctoError.icon(color: Colors.red),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
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
                ),
              )),
            ],
          ));
}

extension BuildContextX on BuildContext {
  void push<T>(
    WidgetBuilder builder, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String? title,
    bool useRootNavigator = false,
  }) {
    if (shouldShowSidebar(this)) {
      read(sideTabBarProvider).state = builder;
      sideBarNavigatorKey.currentState!.popUntil((route) => route.isFirst);
    } else {
      Navigator.of(this, rootNavigator: useRootNavigator).push(PlatformPageRoute<T>(
        builder: builder,
        fullscreenDialog: fullscreenDialog,
        maintainState: maintainState,
        title: title,
        settings: settings,
      ));
    }
  }
}

class Nav {
  const Nav._();

  static void push<T extends Object?>(
    BuildContext context,
    WidgetBuilder builder, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String? title,
    bool rootNavigator = false,
  }) =>
      context.push<T>(
        builder,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        title: title,
        useRootNavigator: rootNavigator,
      );
}

final navigatorKeys = <GlobalKey<NavigatorState>>[
  GlobalKey(debugLabel: 'stations tab key'),
  GlobalKey(debugLabel: 'route tab key'),
  GlobalKey(debugLabel: 'favs tab key'),
  GlobalKey(debugLabel: 'settings key'),
];

final sideBarNavigatorKey = GlobalKey<NavigatorState>();

AppBar materialAppBar(
  BuildContext context, {
  List<Widget> actions = const [],
  bool showSettingsButton = true,
  Widget? title,
  Widget? leading,
}) =>
    AppBar(
      automaticallyImplyLeading: false,
      title: title,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: leading,
      actions: [
        ...actions,
        if (showSettingsButton)
          IconButton(
              key: const Key('settings-button'),
              tooltip: AppLoc.of(context).settings,
              icon: const Icon(Icons.settings),
              onPressed: () {
                Vibration.instance.select();
                Nav.push(
                  context,
                  (context) => const SettingsPage(),
                  fullscreenDialog: true,
                  rootNavigator: true,
                );
              }),
      ],
    );

class SwiftCupertinoBar extends StatefulWidget implements ObstructingPreferredSizeWidget {
  const SwiftCupertinoBar({
    Key? key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.automaticallyImplyMiddle = true,
    this.previousPageTitle,
    this.middle,
    this.trailing,
    this.brightness,
    this.padding,
    this.transitionBetweenRoutes = true,
    this.opacity = 0.5,
  }) : super(key: key);

  final Widget? leading;
  final bool automaticallyImplyLeading;
  final bool automaticallyImplyMiddle;
  final String? previousPageTitle;
  final Widget? middle;
  final Widget? trailing;
  final Brightness? brightness;
  final EdgeInsetsDirectional? padding;
  final bool transitionBetweenRoutes;
  final double opacity;

  @override
  _SwiftCupertinoBarState createState() => _SwiftCupertinoBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimensionCupertino);

  @override
  bool shouldFullyObstruct(BuildContext context) => opacity == 1.0;
}

class _SwiftCupertinoBarState extends State<SwiftCupertinoBar> {
  String? get _previousPageTitle => PlatformRouteTitleMixin.getPreviousTitleOf(context);
  String? get _pageTitle => PlatformRouteTitleMixin.getPageTitleOf(context);
  Widget? get _pageTitleWidget {
    final title = _pageTitle;
    if (title == null) {
      return null;
    }
    return Text(title);
  }

  @override
  Widget build(BuildContext context) {
    final prevPageTitle = widget.automaticallyImplyLeading
        ? widget.previousPageTitle ?? _previousPageTitle
        : widget.previousPageTitle;
    // print('Previous page title is $prevPageTitle');

    return CupertinoNavigationBar(
      leading: widget.leading,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      automaticallyImplyMiddle: widget.automaticallyImplyMiddle,
      previousPageTitle: prevPageTitle,
      middle: widget.automaticallyImplyMiddle ? widget.middle ?? _pageTitleWidget : widget.middle,
      trailing: widget.trailing,
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(widget.opacity),
      brightness: widget.brightness,
      padding: widget.padding,
      transitionBetweenRoutes: widget.transitionBetweenRoutes,
    );
  }
}
