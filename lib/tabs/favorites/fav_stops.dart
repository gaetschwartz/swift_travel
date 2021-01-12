import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/responsive.dart';

class FavoriteStationTile extends StatelessWidget {
  final FavoriteStop stop;

  const FavoriteStationTile(
    this.stop, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darwin = Responsive.isDarwin(context);
    return ListTile(
      leading:
          darwin ? const Icon(CupertinoIcons.heart_fill) : const Icon(FontAwesomeIcons.solidStar),
      onTap: () => Navigator.of(context, rootNavigator: true).pushNamed("/route", arguments: stop),
      onLongPress: () => edit(context),
      trailing: IconButton(
          icon: darwin ? const Icon(CupertinoIcons.pencil) : const Icon(Icons.edit),
          onPressed: () => edit(context)),
      title: Text(stop.name),
      subtitle: Text(stop.stop),
    );
  }

  void edit(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      duration: const Duration(milliseconds: 200),
      expand: false,
      builder: (context) => Material(
          child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(Strings.of(context).rename),
              leading: const Icon(CupertinoIcons.pencil),
              onTap: () => rename(context),
            ),
            ListTile(
              title: Text(Strings.of(context).delete),
              leading: const Icon(CupertinoIcons.delete),
              onTap: () => delete(context),
            ),
            ListTile(
              title: Text(Strings.of(context).close),
              leading: const Icon(CupertinoIcons.xmark),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      )),
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
