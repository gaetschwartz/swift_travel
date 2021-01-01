import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:models/cff/favorite_stop.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/generated/l10n.dart';
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
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchRoute(favStop: stop))),
      trailing: IconButton(
          icon: const Icon(CupertinoIcons.pencil),
          onPressed: () async {
            choose<void>(
              context,
              choices: [
                Choice(
                  child: Text(Strings.of(context).rename),
                  onTap: () => rename(context),
                  value: null,
                ),
                Choice(
                  isDestructive: true,
                  onTap: () => delete(context),
                  child: Text(Strings.of(context).delete),
                  value: null,
                ),
              ],
              cancel: Choice.cancel(child: Text(Strings.of(context).cancel)),
              title: Text(Strings.of(context).what_to_do),
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
    await store.removeStop(stop);
    return store.addStop(stop.copyWith(name: s));
  }

  Future<void> delete(BuildContext context) async {
    final b = await confirm(
      context,
      title: const Text('Delete favorite ?'),
      content: Text.rich(TextSpan(text: 'Do you really want to delete ', children: [
        TextSpan(
            text: '${stop.name} (${stop.stop})',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: '?'),
      ])),
      confirm: Text(Strings.of(context).yes),
      cancel: Text(Strings.of(context).no),
      isConfirmDestructive: true,
    );
    if (!b) return;
    return context.read(storeProvider).removeStop(stop);
  }
}
