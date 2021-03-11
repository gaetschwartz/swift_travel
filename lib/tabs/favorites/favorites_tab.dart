import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pedantic/pedantic.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/models/favorites.dart';
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
  const FavoritesTab({Key? key}) : super(key: key);

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final BaseFavoritesStore store = context.read(storeProvider);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: SwiftCupertinoBar(
          trailing: IconButton(icon: const Icon(CupertinoIcons.add), onPressed: addFav),
        ),
        child: child!,
      ),
      materialBuilder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: materialAppBar(context, title: Text(AppLoc.of(context).tabs_favourites)),
        floatingActionButton: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            shadowColor: ShadowTheme.of(context).buttonShadow!.color,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          onPressed: addFav,
          icon: const Icon(Icons.add),
          label: Text(AppLoc.of(context).add_to_favs),
        ),
        body: child,
      ),
      builder: (context, d) => Consumer(builder: (context, w, _) {
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
                  condition: d == PlatformDesign.cupertino,
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

    final s = Responsive.isDarwin(context)
        ? await showCupertinoModalBottomSheet<String>(
            context: context, builder: (context) => const StopInputDialog(title: 'Add a favorite'))
        : await showMaterialModalBottomSheet<String>(
            context: context,
            builder: (_) => const StopInputDialog(title: 'Add a favorite'),
          );

    if (s == null) {
      return;
    }

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
      if (name == null) {
        return;
      }
      await store.addStop(FavoriteStop.fromCompletion(
        completion,
        name: name,
        api: context.read(preferencesProvider).api.value,
      ));
    });
  }
}
