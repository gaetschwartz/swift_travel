import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/favorites/fav_stops.dart';
import 'package:swift_travel/widgets/input.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/dialogs/loading_dialog.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

import 'fav_routes.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab();

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  FavoritesSharedPreferencesStore store;
  bool isDarwin = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = context.read(storeProvider) as FavoritesSharedPreferencesStore;
    isDarwin = Responsive.isDarwin(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: swiftTravelAppBar(context,
          actions: [
            if (isDarwin) IconButton(icon: const Icon(CupertinoIcons.add), onPressed: addFav)
          ],
          title: Text(Strings.of(context).tabs_favourites)),
      floatingActionButton: isDarwin
          ? null
          : FloatingActionButton(
              tooltip: 'Add a favorite',
              shape: const StadiumBorder(),
              onPressed: addFav,
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
                      '⭐',
                      style: TextStyle(fontSize: 64),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'You have no favorites !',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You can add one by tapping the ➕ button.',
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : Column(
                  children: [
                    favs.state.when(
                      data: (c) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: c.length,
                        itemBuilder: (context, i) => FavoriteStationTile(c[i]),
                      ),
                      loading: () => const Center(
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
                        itemBuilder: (context, i) => FavoriteRouteTile(route: c.routes[i]),
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

  Future<void> addFav() async {
    Vibration.select();
    final String s = await Navigator.of(context).push<String>(MaterialPageRoute(
      builder: (_) => const StopInputDialog(title: 'Add a favorite'),
      fullscreenDialog: true,
    ));
    if (s == null) return;

    await load(context, future: () async {
      final cff = context.read(navigationAPIProvider);
      List<CffCompletion> completions = await cff.complete(s, showIds: true);

      if (completions.isEmpty) {
        log("Didn't find a station, will try using routes as a hack...");
        final CffRoute cffRoute =
            await cff.route(s, 'Geneva', date: DateTime.now(), time: TimeOfDay.now());
        if (cffRoute.connections.isNotEmpty) {
          final from = cffRoute.connections.first.from;
          log('Found $from');
          completions = await cff.complete(from, showIds: true);
          log(completions.toString());
        }
      }

      if (completions.isEmpty) {
        log("Didn't find anything for string $s");
        return;
      }

      final CffCompletion completion = completions.first;
      final name = await input(context, title: const Text('What is the name of this stop'));
      if (name == null) return;
      await store.addStop(completion.toFavoriteStop(name: name));
    });
  }
}
