import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/pages/loading.dart';
import 'package:swiss_travel/pages/settings.dart';
import 'package:swiss_travel/tabs/favorites_tab.dart';
import 'package:swiss_travel/tabs/route_tab.dart';
import 'package:swiss_travel/tabs/stations_tab.dart';
import 'package:utils/blocs/theme_riverpod.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runZonedGuarded<Future<void>>(
      () async => runApp(MyApp()), FirebaseCrashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(builder: (context, w, _) {
        final theme = w(dynamicTheme);
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Swiss Travel',
          builder: (context, child) => _Unfocus(
            child: child,
          ),
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: theme.mode,
          home: LoadingPage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
            Tab(icon: FaIcon(FontAwesomeIcons.search)),
            Tab(icon: FaIcon(FontAwesomeIcons.route)),
            Tab(icon: FaIcon(FontAwesomeIcons.solidStar)),
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
        children: [
          SearchByName(),
          const SearchRoute(),
          SearchFavorite(),
        ],
      ),
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
