import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:utils/dialogs/choice.dart';
import 'package:utils/dialogs/confirmation_alert.dart';
import 'package:utils/dialogs/input_dialog.dart';

class FavoriteStationTile extends StatelessWidget {
  final FavoriteStop stop;

  const FavoriteStationTile(
    this.stop, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(FontAwesomeIcons.solidStar),
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => SearchRoute(destination: stop.stop))),
      trailing: IconButton(
          icon: const FaIcon(FontAwesomeIcons.edit),
          onPressed: () async {
            choose<void>(
              context,
              choices: [
                Choice(
                  child: const Text("Rename"),
                  onTap: () => rename(context),
                  value: null,
                ),
                Choice(
                  isDestructive: true,
                  onTap: () => delete(context),
                  child: const Text("Delete"),
                  value: null,
                ),
              ],
              cancel: const Choice.cancel(child: Text("Cancel")),
              title: const Text("What to do ?"),
            );
          }),
      title: Text(stop.name),
      subtitle: Text(stop.stop),
    );
  }

  Future<void> rename(BuildContext context) async {
    final s = await input(context, title: Text('How to rename "${stop.name}" ?'));
    if (s == null) return;
    final store = context.read(storeProvider);
    await store.deleteFavorite(stop);
    return store.addFavorite(stop.copyWith(name: s));
  }

  Future<void> delete(BuildContext context) async {
    final b = await confirm(
      context,
      title: const Text("Delete favorite ?"),
      content: Text.rich(TextSpan(text: 'Do you really want to delete ', children: [
        TextSpan(
            text: "${stop.name} (${stop.stop})",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: "?"),
      ])),
      confirm: const Text("Yes"),
      cancel: const Text("No"),
      isConfirmDestructive: true,
    );
    if (!b) return;
    return context.read(storeProvider).deleteFavorite(stop);
  }
}
