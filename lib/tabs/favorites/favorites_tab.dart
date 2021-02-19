import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedantic/pedantic.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/stop_input.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/dialogs/loading_dialog.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

import 'fav_route_tile.dart';
import 'fav_stop_tile.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab();

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final FavoritesStoreBase store = context.read(storeProvider);
  bool isDarwin = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isDarwin = Responsive.isDarwin(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return IfWrapper(
      condition: isDarwin,
      builder: (context, child) => CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        child: child!,
        navigationBar: cupertinoBar(
          context,
          trailing: IconButton(icon: const Icon(CupertinoIcons.add), onPressed: addFav),
        ),
      ),
      elseBuilder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: materialAppBar(context, title: Text(AppLoc.of(context).tabs_favourites)),
        floatingActionButton: isDarwin
            ? null
            : ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 4,
                  shadowColor: DynamicTheme.shadowOf(context).buttonShadow!.color,
                ),
                onPressed: addFav,
                icon: const Icon(Icons.add),
                label: Text(AppLoc.of(context).tabs_favourites),
              ),
        body: child,
      ),
      child: Consumer(builder: (context, w, _) {
        final stops = w(favoritesStatesProvider)
            .state
            .maybeWhen<List<FavoriteStop>>(data: (d) => d, orElse: () => []);
        final routes = w(favoritesRoutesStatesProvider)
            .state
            .maybeWhen<List<LocalRoute>>(data: (d) => d, orElse: () => []);

        return stops.isEmpty && routes.isEmpty
            ? SizedBox.expand(
                child: Column(
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
                ),
              )
            : ListView.builder(
                itemCount: stops.length + routes.length,
                itemBuilder: (context, i) => IfWrapper(
                  condition: isDarwin,
                  builder: (context, child) => Column(
                    children: [
                      const Divider(height: 0),
                      child!,
                    ],
                  ),
                  child: i < stops.length
                      ? FavoriteStationTile(stops[i])
                      : FavoriteRouteTile(routes[i - stops.length]),
                ),
              );
      }),
    );
  }

  Future<void> addFav() async {
    unawaited(Vibration.select());
    final s = await Navigator.of(context, rootNavigator: true).push<String>(MaterialPageRoute(
      builder: (_) => const StopInputDialog(title: 'Add a favorite'),
      fullscreenDialog: true,
    ));
    if (s == null) return;

    await load(context, future: () async {
      final cff = context.read(navigationAPIProvider);
      var completions = await cff.complete(s, showIds: true);

      if (completions.isEmpty) {
        log("Didn't find a station, will try using routes as a hack...");
        final cffRoute = await cff.route(s, 'Bern', date: DateTime.now(), time: TimeOfDay.now());
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

      final completion = completions.first;
      final name = await input(context, title: const Text('What is the name of this stop'));
      if (name == null) return;
      await store.addStop(FavoriteStop.fromCompletion(
        completion,
        name: name,
        api: context.read(preferencesProvider).api,
      ));
    });
  }
}
