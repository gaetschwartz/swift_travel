import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/api/cff/models/cff_route.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/tabs/favorites/fav_stops.dart';
import 'package:swiss_travel/widget/input.dart';
import 'package:utils/dialogs/input_dialog.dart';
import 'package:utils/dialogs/loading_dialog.dart';

import 'fav_routes.dart';

class SearchFavorite extends StatefulWidget {
  const SearchFavorite();

  @override
  _SearchFavoriteState createState() => _SearchFavoriteState();
}

class _SearchFavoriteState extends State<SearchFavorite>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _store = context.read(storeProvider) as FavoritesSharedPreferencesStore;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: () async {
          final String s = await Navigator.of(context).push<String>(MaterialPageRoute(
            builder: (_) => const StopInputDialog(title: "Add a favorite"),
            fullscreenDialog: true,
          ));
          if (s == null) return;

          await load(context, future: () async {
            final cff = context.read(cffProvider);
            List<CffCompletion> completions = await cff.complete(s, showIds: true);

            if (completions.isEmpty) {
              log("Didn't find a station, will try using routes as a hack...");
              final CffRoute cffRoute =
                  await cff.route(s, "Geneva", date: DateTime.now(), time: TimeOfDay.now());
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
            final name = await input(context, title: const Text("What is the name of this stop"));
            if (name == null) return;
            await _store.addFavorite(completion.toFavoriteStop(name: name));
          });
        },
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Consumer(builder: (context, w, _) {
          final favs = w(favoritesStatesProvider);
          final favRoutes = w(favoritesRoutesStatesProvider);
          return favs.state.maybeWhen<bool>(data: (d) => d.isEmpty, orElse: () => false) &&
                  favRoutes.state.maybeWhen<bool>(data: (d) => d.isEmpty, orElse: () => false)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "⭐",
                      style: TextStyle(fontSize: 64),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "You have no favorites !",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "You can add one by tapping the ➕ button.",
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Column(
                  children: [
                    favs.state.map(
                      data: (c) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: c.favorites.length,
                        itemBuilder: (context, i) => FavoriteStationTile(c.favorites[i]),
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
                    ),
                    favRoutes.state.map(
                      data: (c) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: c.routes.length,
                        itemBuilder: (context, i) => FavoriteRoutTile(route: c.routes[i]),
                      ),
                      loading: (_) => const CustomScrollView(
                        slivers: [
                          SliverFillRemaining(child: Center(child: CircularProgressIndicator()))
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
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
