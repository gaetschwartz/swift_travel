import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/api/cff/models/cff_route.dart';
import 'package:swiss_travel/api/cff/models/stop.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/widget/input.dart';
import 'package:utils/dialogs/confirmation_alert.dart';
import 'package:utils/dialogs/loading_dialog.dart';

class FavStopsTab extends StatelessWidget {
  const FavStopsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          itemBuilder: (context, i) => _FavoriteTile(c.completions[i]),
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
              content: Text.rich(TextSpan(text: 'Do you really want to delete ', children: [
                TextSpan(text: stop.label, style: const TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: "?"),
              ])),
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
