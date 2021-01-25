import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

class FavoriteStationTile extends StatelessWidget {
  final FavoriteStop stop;

  const FavoriteStationTile(
    this.stop, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isDarwin ? const Icon(CupertinoIcons.heart_fill) : const Icon(FontAwesomeIcons.solidStar),
        ],
      ),
      onTap: () => Navigator.of(context, rootNavigator: true).pushNamed('/route', arguments: stop),
      onLongPress: () => edit(context),
      trailing: IconButton(
          icon: isDarwin ? const Icon(CupertinoIcons.pencil) : const Icon(Icons.edit),
          onPressed: () => edit(context)),
      title: Text(stop.name),
      subtitle: Text(stop.stop),
    );
  }

  void edit(BuildContext context) {
    Vibration.select();
    showActionSheet(context, [
      ActionsSheetAction(
        title: Text(Strings.of(context).rename),
        icon: const Icon(CupertinoIcons.pencil),
        onPressed: () => rename(context),
      ),
      ActionsSheetAction(
        title: Text(Strings.of(context).delete),
        icon: const Icon(CupertinoIcons.delete),
        onPressed: () => delete(context),
        isDestructive: true,
      ),
      ActionsSheetAction(
        title: Text(Strings.of(context).close),
        icon: const Icon(CupertinoIcons.xmark),
        onPressed: () => null,
      ),
    ]);
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
      title: Text(Strings.of(context).delete_fav),
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
