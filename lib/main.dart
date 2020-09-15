import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/pages/loading.dart';
import 'package:swiss_travel/pages/settings.dart';
import 'package:swiss_travel/tabs/favorites_tab.dart';
import 'package:swiss_travel/tabs/route_tab.dart';
import 'package:swiss_travel/tabs/stations_tab.dart';
import 'package:utils/blocs/theme_riverpod.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(builder: (context, w, _) {
        final theme = w(dynamicTheme);
        return MaterialApp(
          title: 'Swiss Travel',
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
              })
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
