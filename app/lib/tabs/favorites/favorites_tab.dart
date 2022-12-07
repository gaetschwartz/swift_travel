import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/db/favorite_store.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
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

class FavoritesTab extends ConsumerStatefulWidget {
  const FavoritesTab({super.key});

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends ConsumerState<FavoritesTab>
    with AutomaticKeepAliveClientMixin {
  final log = Logger.of('FavoritesTab');

  @override
  bool get wantKeepAlive => true;

  late final BaseFavoritesStore store = ref.read(favoritesStoreProvider);

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
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: addFav,
            child: Icon(
              CupertinoIcons.add,
              color: CupertinoTheme.of(context).primaryColor,
              size: 32,
            ),
          ),
          middle: Text(AppLocalizations.of(context).tabs_favourites),
        ),
        child: child!,
      ),
      materialBuilder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MaterialAppBar(
            title: Text(AppLocalizations.of(context).tabs_favourites)),
        floatingActionButton: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            shadowColor: ShadowTheme.of(context).buttonShadow!.color,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
          onPressed: addFav,
          icon: const Icon(Icons.add),
          label: Text(AppLocalizations.of(context).new_fav),
        ),
        body: child,
      ),
      builder: (context, d) => Consumer(builder: (context, ref, _) {
        final store = ref.watch(favoritesStoreProvider);
        final stops = store.stops.toList(growable: false);
        final routes = store.routes.toList(growable: false);

        if (stops.isEmpty && routes.isEmpty) {
          return SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '⭐',
                  style: TextStyle(fontSize: 64),
                ),
                const Gap(32),
                Text(
                  AppLocalizations.of(context).no_favorites,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const Gap(8),
                Text(
                  AppLocalizations.of(context).how_to_add_favorite,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else {
          // return ListView.builder(
          //       itemCount: stops.length + routes.length,
          //       itemBuilder: (context, i) => IfWrapper(
          //         condition: d == PlatformDesign.cupertino,
          //         builder: (context, child) => Column(
          //           children: [
          //             const Divider(height: 0),
          //             child!,
          //           ],
          //         ),
          //         child: i < stops.length
          //             ? FavoriteStationTile(stops[i])
          //             : FavoriteRouteTile(routes[i - stops.length]),
          //       ),
          //     );
          return CustomScrollView(
            slivers: [
              SliverSafeArea(
                bottom: false,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => IfWrapper(
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
                    childCount: stops.length + routes.length,
                  ),
                ),
              ),
              // tile to order
            ],
          );
        }
      }),
    );
  }

  Future<void> addFav() async {
    Vibration.instance.select();

    final s = isThemeDarwin(context)
        ? await showCupertinoModalBottomSheet<String>(
            context: context,
            builder: (context) =>
                const StopInputDialog(title: 'Add a favorite'))
        : await showMaterialModalBottomSheet<String>(
            context: context,
            builder: (_) => const StopInputDialog(title: 'Add a favorite'),
          );

    if (s == null) return;
    if (!mounted) return;

    await load(context, future: () async {
      final api = ref.read(navigationAPIProvider);
      // ignore: prefer_final_locals
      var completions = await api.complete(s, showIds: true);

      // if (completions.isEmpty) {
      //   log.log("Didn't find a station, will try using routes as a hack...");
      //   final sbbRoute = await api.route(
      //     s,
      //     'Bern',
      //     date: DateTime.now(),
      //     time: TimeOfDay(hour:12),
      //     timeType: SearchChMode.departure,
      //   );
      //   if (sbbRoute.connections.isNotEmpty) {
      //     final from = sbbRoute.connections.first.from;
      //     log.log('Found $from');
      //     completions = await api.complete(from, showIds: true);
      //     log.log(completions.toString());
      //   }
      // }

      if (completions.isEmpty) {
        log.log("Didn't find anything for string $s");
        return;
      }

      if (!mounted) return;

      final name = await input(
        context,
        title: Text(AppLocalizations.of(context).how_call_this_fav),
      );
      if (name == null) return;
      if (!mounted) return;

      await store.addStop(FavoriteStop.fromCompletion(
        completions.first,
        name: name,
        api: ref.read(preferencesProvider).api.value,
      ));
    });
  }
}
