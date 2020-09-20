import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/tabs/favorites/fav_stops.dart';

import 'favorites/fav_routes.dart';

final _tabProvider = StateProvider<int>((ref) => 0);

class SearchFavorite extends StatefulWidget {
  const SearchFavorite();

  @override
  _SearchFavoriteState createState() => _SearchFavoriteState();
}

class _SearchFavoriteState extends State<SearchFavorite>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  static const List<Widget> tabs = [
    FavRoutesTab(),
    FavStopsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: Consumer(
        builder: (context, w, child) {
          final i = w(_tabProvider).state;
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  label: "Routes", icon: FaIcon(FontAwesomeIcons.route)),
              BottomNavigationBarItem(
                  label: "Stops", icon: FaIcon(FontAwesomeIcons.train)),
            ],
            onTap: (i) => context.read(_tabProvider).state = i,
            currentIndex: i,
          );
        },
      ),
      body: Consumer(builder: (context, w, _) {
        final i = w(_tabProvider).state;
        return PageTransitionSwitcher(
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
                SharedAxisTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                  child: child,
                ),
            child: SizedBox(key: ValueKey(i), child: tabs[i]));
      }),
    );
  }
}
