import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/api/cff/cff_completion.dart';
import 'package:swiss_travel/api/cff/local_route.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/tabs/route_tab.dart';
import 'package:swiss_travel/widget/input.dart';
import 'package:utils/dialogs/confirmation_alert.dart';

final _tabProvider = StateProvider<int>((ref) => 0);

class SearchFavorite extends StatefulWidget {
  @override
  _SearchFavoriteState createState() => _SearchFavoriteState();
}

class _SearchFavoriteState extends State<SearchFavorite> with AutomaticKeepAliveClientMixin {
  FavoritesSharedPreferencesStore _store;
  CffRepository _cff;

  @override
  void initState() {
    super.initState();
    _cff = context.read(cffProvider) as CffRepository;
    _store = context.read(favoritesProvider) as FavoritesSharedPreferencesStore;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _store.getFavorites();
    });
  }

  @override
  bool get wantKeepAlive => true;

  final List<Widget> tabs = [
    const FavRoutesTab(),
    const FavStopsTab(),
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
              BottomNavigationBarItem(label: "Routes", icon: FaIcon(FontAwesomeIcons.route)),
              BottomNavigationBarItem(label: "Stops", icon: FaIcon(FontAwesomeIcons.train)),
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

class FavRoutesTab extends StatelessWidget {
  const FavRoutesTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = context.read(favoritesProvider) as FavoritesSharedPreferencesStore;
    return RefreshIndicator(
        onRefresh: () => _store.getFavorites(notify: false),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Consumer(builder: (context, w, _) {
              final favs = w(favoritesRoutesStatesProvider);
              return favs.state.map(
                data: (c) => c.routes.isEmpty
                    ? CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.star,
                                size: 48,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "No favorites routes !",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Click on the ⭐ icon in the routes tab to add a route to your favorites !",
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ))
                        ],
                      )
                    : ListView.builder(
                        itemCount: c.routes.length,
                        itemBuilder: (context, i) => _RouteTile(route: c.routes[i]),
                      ),
                loading: (_) => const CustomScrollView(
                  slivers: [SliverFillRemaining(child: Center(child: CircularProgressIndicator()))],
                ),
                error: (e) => CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: Center(
                        child: Text(
                          e.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ));
  }
}

class _RouteTile extends StatelessWidget {
  const _RouteTile({
    Key key,
    @required this.route,
  }) : super(key: key);

  final LocalRoute route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${route.from} ➡ ${route.to}"),
      trailing: IconButton(
          icon: const FaIcon(FontAwesomeIcons.star),
          onPressed: () async {
            final b = await confirm(context,
                title: const Text("Delete favorite ?"),
                content: Text('Do you really want to delete "$route"'),
                confirm: const Text("Yes"),
                cancel: const Text("No"));
            if (!b) return;
            return context.read(favoritesProvider).removeRoute(route);
          }),
      onTap: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SearchRoute(localRoute: route)));
      },
    );
  }
}

class FavStopsTab extends StatelessWidget {
  const FavStopsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = context.read(favoritesProvider) as FavoritesSharedPreferencesStore;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: () async {
          final String s = await Navigator.of(context).push<String>(MaterialPageRoute(
            builder: (_) => const StopInputDialog(title: "Add a favorite"),
            fullscreenDialog: true,
          ));
          if (s == null) return;
          final CffCompletion completion =
              (await context.read(cffProvider).complete(s, showIds: true)).first;
          await _store.addFavorite(completion);
        },
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      body: RefreshIndicator(
          onRefresh: () => _store.getFavorites(notify: false),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Consumer(builder: (context, w, _) {
                final favs = w(favoritesStatesProvider);
                return favs.state.map(
                  data: (c) => c.completions.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.star,
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "No favorites !",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: c.completions.length,
                          itemBuilder: (context, i) => _FavoriteTile(c.completions[i]),
                        ),
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (e) => Center(
                    child: Text(
                      e.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              }),
            ),
          )),
    );
  }
}

class _FavoriteTile extends StatelessWidget {
  final CffCompletion stop;

  const _FavoriteTile(
    this.stop, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
          icon: const FaIcon(FontAwesomeIcons.star),
          onPressed: () async {
            final b = await confirm(context,
                title: const Text("Delete favorite ?"),
                content: Text('Do you really want to delete "${stop.label}"'),
                confirm: const Text("Yes"),
                cancel: const Text("No"));
            if (!b) return;
            return context.read(favoritesProvider).deleteFavorite(stop);
          }),
      title: Text(stop.label),
    );
  }
}
