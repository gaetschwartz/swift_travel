import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/tabs/stations/stop_details.dart';
import 'package:swiss_travel/widget/cff_icon.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/choice.dart';

enum _Actions { favorite }

class CffCompletionTile extends StatelessWidget {
  const CffCompletionTile(
    this.sugg, {
    Key key,
    this.isFav = false,
  }) : super(key: key);

  final CffCompletion sugg;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    final isPrivate = CffIcon.isPrivate(sugg.iconclass);
    if (sugg.label == null) log(sugg.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CffIcon.fromIconClass(sugg.iconclass),
            title: Text(sugg.label ?? "???"),
            dense: true,
            subtitle: isFav || sugg.isFavorite
                ? const Text("Favorite")
                : sugg.dist != null
                    ? Text("${sugg.dist.round()}m")
                    : null,
            trailing: isPrivate
                ? IconButton(icon: const Icon(Icons.more_horiz), onPressed: () => more(context))
                : const Icon(Icons.arrow_forward_ios),
            onLongPress: () => more(context),
            onTap: isPrivate
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailsStop(stopName: sugg.label),
                      ),
                    );
                  },
          ),
        ),
      ),
    );
  }

  Future<void> more(BuildContext context) async {
    final store = context.read(storeProvider) as FavoritesSharedPreferencesStore;
    final isFav = store.favorites.contains(sugg);
    final c = await choose<_Actions>(context,
        choices: [
          Choice(
              value: _Actions.favorite,
              child: isFav ? const Text("Remove from favorites") : const Text("Add to favorites"))
        ],
        title: const Text("Choose an action"),
        cancel: const Choice.cancel(child: Text("Cancel")));
    switch (c.value) {
      case _Actions.favorite:
        if (isFav) {
          store.deleteFavorite(sugg);
        } else {
          store.addFavorite(sugg);
        }
        break;
    }
  }
}
