import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/settings/settings.dart';
import 'package:swift_travel/tabs/favorites/favorites_tab.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/stations_tab.dart';
import 'package:swift_travel/utils/colors.dart';
import 'package:swift_travel/utils/page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

class CombinedPageController extends ChangeNotifier {
  CombinedPageController() : cupertinoTabController = CupertinoTabController() {
    cupertinoTabController.addListener(() {
      _page = cupertinoTabController.index;
      notifyListeners();
    });
  }

  final CupertinoTabController cupertinoTabController;

  int _page = 0;
  int get page => _page;

  void setPage(int page, {required bool isDarwin}) {
    if (isDarwin) {
      cupertinoTabController.index = page;
    } else {
      _page = page;
      notifyListeners();
    }
  }

  void animateTo(
    int page, {
    required bool isDarwin,
    Curve curve = Curves.fastOutSlowIn,
    Duration duration = const Duration(milliseconds: 250),
  }) {
    if (isDarwin) {
      cupertinoTabController.index = page;
    } else {
      _page = page;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    cupertinoTabController.dispose();
    super.dispose();
  }
}

final tabProvider = ChangeNotifierProvider.autoDispose<CombinedPageController>((ref) {
  final combinedPageController = CombinedPageController();
  ref.onDispose(() => combinedPageController.dispose());
  ref.maintainState = true;
  return combinedPageController;
});

bool showSidebar(BuildContext context) {
  final mq = MediaQuery.of(context);
  final s = mq.size.longestSide / mq.devicePixelRatio;
  return s > 400 && mq.orientation == Orientation.landscape;
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();

  static const iosTabs = [StationsTab(), RouteTab(), FavoritesTab(), SettingsPage()];
  static const androidTabs = [StationsTab(), RouteTab(), FavoritesTab()];
}

final sideTabBarProvider = StateProvider<WidgetBuilder?>((_) => null);

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  late final CombinedPageController combinedPageController = context.read(tabProvider);
  int oldI = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read(navigationAPIProvider).locale = Localizations.localeOf(context);
  }

  @override
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);

    return IfWrapper(
      condition: showSidebar(context),
      builder: (context, child) {
        return Row(children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: child,
          ),
          const SafeArea(child: VerticalDivider(width: 0)),
          Expanded(
              child: ClipRect(
            child: Material(
              child: Navigator(
                key: sideBarNavigatorKey,
                pages: const [SingleWidgetPage<void>(_SideBar(), title: 'Home')],
                onGenerateRoute: (s) => onGenerateRoute(s, isDarwin: isDarwin),
                onPopPage: (_, dynamic __) => true,
              ),
            ),
          )),
        ]);
      },
      child: isDarwin ? buildCupertinoTabScaffold(context) : buildScaffold(context),
    );
  }

  Widget buildCupertinoTabScaffold(BuildContext context) {
    final items = [
      BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.search),
        label: AppLoc.of(context).timetable,
      ),
      BottomNavigationBarItem(
        icon: const FaIcon(CupertinoIcons.train_style_one),
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CupertinoTabScaffold(
        controller: combinedPageController.cupertinoTabController,
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          onTap: (i) {
            Vibration.selectSoft();
            if (i == oldI) {
              navigatorKeys[i].currentState!.popUntil((route) => route.isFirst);
              context.read(sideTabBarProvider).state = null;
            }
            oldI = i;
          },
          backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.5),
          items: items,
        ),
        tabBuilder: (context, i) => Navigator(
          key: navigatorKeys[i],
          pages: [SingleWidgetPage<void>(MainApp.iosTabs[i], title: items[i].label)],
          onPopPage: (_, dynamic __) => true,
          onUnknownRoute: (settings) => onUnknownRoute(settings, isDarwin: true),
          onGenerateRoute: (settings) => onGenerateRoute(settings, isDarwin: true),
        ),
      ),
    );
  }

  List<Color> gradient(Color c) => [
        augment(c),
        c,
      ];

  Widget buildScaffold(BuildContext context) {
    final titles = [
      AppLoc.of(context).timetable,
      AppLoc.of(context).tabs_route,
      AppLoc.of(context).tabs_favourites,
    ];
    final items = [
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
    return Consumer(builder: (context, w, _) {
      final controllers = w(tabProvider);
      final page = controllers.page % MainApp.androidTabs.length;

      return Scaffold(
        key: const Key('home-scaffold'),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SwiftNavigationBar(controllers: controllers, page: page, items: items),
        body: PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) => child,
          duration: Duration.zero,
          child: Navigator(
            key: navigatorKeys[controllers.page],
            pages: [SingleWidgetPage<void>(MainApp.androidTabs[page], name: titles[page])],
            onPopPage: (_, dynamic __) => true,
            onUnknownRoute: (settings) => onUnknownRoute(settings, isDarwin: false),
            onGenerateRoute: (settings) => onGenerateRoute(settings, isDarwin: false),
          ),
        ),
      );
    });
  }
}

class SwiftNavigationBar extends StatelessWidget {
  const SwiftNavigationBar({
    Key? key,
    required this.controllers,
    required this.page,
    required this.items,
    this.activeColor,
  }) : super(key: key);

  final CombinedPageController controllers;
  final int page;
  final List<BottomNavigationBarItem> items;
  final Color? activeColor;

  static const height = 64.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
          height: height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: (ShadowTheme.of(context).buttonShadow?.color ?? Colors.grey).withAlpha(24),
                  blurRadius: 32,
                )
              ],
            ),
            child: Row(
              children: [
                for (var i = 0; i < items.length; i++) buildInkWell(i, context),
              ],
            ),
          )),
    );
  }

  Expanded buildInkWell(int i, BuildContext context) {
    final item = items[i];
    return Expanded(
        child: IfWrapper(
      builder: (context, child) => IconTheme(
        data: IconThemeData(color: activeColor ?? Theme.of(context).primaryColor),
        child: child!,
      ),
      condition: i == page,
      child: InkWell(
        onTap: () => onTap(i, context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (i != page) item.icon else item.activeIcon,
            if (item.label != null) Text(item.label!),
          ],
        ),
      ),
    ));
  }

  void onTap(int i, BuildContext context) {
    Vibration.selectSoft();
    if (controllers.page != i) {
      controllers.animateTo(i, isDarwin: false);
    } else {
      navigatorKeys[i].currentState!.popUntil((route) => route.isFirst);
      context.read(sideTabBarProvider).state = null;
    }
  }
}

class _SideBar extends StatelessWidget {
  const _SideBar({
    Key? key,
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
}

extension BuildContextX on BuildContext {
  void push(
    WidgetBuilder builder, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String? title,
    bool rootNavigator = false,
  }) {
    final isDarwin = Responsive.isDarwin(this);
    if (showSidebar(this)) {
      read(sideTabBarProvider).state = builder;
      sideBarNavigatorKey.currentState!.popUntil((route) => route.isFirst);
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
  Nav._();

  static void push(
    BuildContext context,
    WidgetBuilder builder, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String? title,
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
    {List<Widget> actions = const [], bool addSettings = true, Widget? title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: title,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ...actions,
      if (addSettings)
        IconButton(
            key: const Key('settings-button'),
            tooltip: AppLoc.of(context).settings,
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
  Key? key,
  Widget? leading,
  bool automaticallyImplyLeading = true,
  bool automaticallyImplyMiddle = true,
  String? previousPageTitle,
  Widget? middle,
  Widget? trailing,
  Brightness? brightness,
  EdgeInsetsDirectional? padding,
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
