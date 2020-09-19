import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/api/cff/cff_completion.dart';
import 'package:swiss_travel/api/cff/cff_route.dart';
import 'package:swiss_travel/api/cff/local_route.dart';
import 'package:swiss_travel/api/cff/stop.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/tabs/route_tab.dart';
import 'package:swiss_travel/widget/input.dart';
import 'package:utils/dialogs/confirmation_alert.dart';
import 'package:utils/dialogs/loading_dialog.dart';

final _tabProvider = StateProvider<int>((ref) => 0);

class SearchFavorite extends StatefulWidget {
  @override
  _SearchFavoriteState createState() => _SearchFavoriteState();
}

class _SearchFavoriteState extends State<SearchFavorite>
    with AutomaticKeepAliveClientMixin {
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

class FavRoutesTab extends StatelessWidget {
  const FavRoutesTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store =
        context.read(storeProvider) as FavoritesSharedPreferencesStore;
    return RefreshIndicator(
        onRefresh: () => _store.loadFromPreferences(notify: false),
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
                        itemBuilder: (context, i) =>
                            _RouteTile(route: c.routes[i]),
                      ),
                loading: (_) => const CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()))
                  ],
                ),
                exception: (e) => CustomScrollView(
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
      title: Text(route.displayName),
      subtitle: Text("${route.from} ➡ ${route.to}"),
      trailing: IconButton(
          icon: const FaIcon(FontAwesomeIcons.times),
          onPressed: () => deleteRoute(context)),
      onTap: () async {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => SearchRoute(localRoute: route)));
      },
    );
  }

  Future<void> deleteRoute(BuildContext context) async {
    final b = await confirm(
      context,
      title: Text.rich(TextSpan(text: "Delete ", children: [
        TextSpan(
            text: route.displayName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(
          text: " ?",
        ),
      ])),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            route.from,
            textAlign: TextAlign.center,
          ),
          const Text("⬇"),
          Text(
            route.to,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      confirm: const Text("Yes"),
      cancel: const Text("No"),
      isConfirmDestructive: true,
    );
    if (!b) return;
    return context.read(storeProvider).removeRoute(route);
  }
}

class FavStopsTab extends StatelessWidget {
  const FavStopsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store =
        context.read(storeProvider) as FavoritesSharedPreferencesStore;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: () async {
          final String s =
              await Navigator.of(context).push<String>(MaterialPageRoute(
            builder: (_) => const StopInputDialog(title: "Add a favorite"),
            fullscreenDialog: true,
          ));
          if (s == null) return;

          await load(context, future: () async {
            final cff = context.read(cffProvider);
            List<CffCompletion> completions =
                await cff.complete(s, showIds: true);

            if (completions.isEmpty) {
              log("Didn't find a station, will try using routes as a hack...");
              final CffRoute cffRoute = await cff.route(Stop(s), Stop("Geneva"),
                  date: DateTime.now(), time: TimeOfDay.now());
              if (cffRoute.connections.isNotEmpty) {
                final from = cffRoute.connections.first.from;
                log("Found $from");
                completions = await cff.complete(from, showIds: true);
                log(completions.toString());
              }
            }

            if (completions.isEmpty) {
              log("Didn't find anything for string $s");
              return;
            }

            final CffCompletion completion = completions.first;
            await _store.addFavorite(completion);
          });
        },
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      body: RefreshIndicator(
          onRefresh: () => _store.loadFromPreferences(notify: false),
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
                          itemBuilder: (context, i) =>
                              _FavoriteTile(c.completions[i]),
                        ),
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  exception: (e) => Center(
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
          icon: const FaIcon(FontAwesomeIcons.times),
          onPressed: () async {
            final b = await confirm(
              context,
              title: const Text("Delete favorite ?"),
              content: Text('Do you really want to delete "${stop.label}"'),
              confirm: const Text("Yes"),
              cancel: const Text("No"),
              isConfirmDestructive: true,
            );
            if (!b) return;
            return context.read(storeProvider).deleteFavorite(stop);
          }),
      title: Text(stop.label),
    );
  }
}
