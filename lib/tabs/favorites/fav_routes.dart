import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/api/cff/models/local_route.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/tabs/routes/route_tab.dart';
import 'package:utils/dialogs/choice.dart';
import 'package:utils/dialogs/confirmation_alert.dart';

class FavRoutesTab extends StatelessWidget {
  const FavRoutesTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = context.read(storeProvider) as FavoritesSharedPreferencesStore;
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
                        itemBuilder: (context, i) => _RouteTile(route: c.routes[i]),
                      ),
                loading: (_) => const CustomScrollView(
                  slivers: [SliverFillRemaining(child: Center(child: CircularProgressIndicator()))],
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
          icon: const FaIcon(FontAwesomeIcons.edit),
          onPressed: () {
            choose<String>(
              context,
              choices: [
                Choice(
                  value: "Delete",
                  isDestructive: true,
                  onTap: () => deleteRoute(context),
                  child: null,
                )
              ],
              cancel: const Choice.cancel(child: Text("Cancel")),
              title: const Text("What to do ?"),
            );
          }),
      onTap: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SearchRoute(localRoute: route)));
      },
    );
  }

  Future<void> deleteRoute(BuildContext context) async {
    final b = await confirm(
      context,
      title: Text.rich(TextSpan(text: "Delete ", children: [
        TextSpan(text: route.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
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
