import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/utils/strings/strings.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/route_widget.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dialogs/input_dialog.dart';

class FavoriteRouteTile extends StatelessWidget {
  const FavoriteRouteTile(this.route, {Key? key}) : super(key: key);

  final LocalRoute route;

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: AppLocalizations.of(context).delete,
            color: Colors.red,
            icon: CupertinoIcons.delete,
            onTap: () => deleteRoute(context),
          ),
        ],
        actions: [
          IconSlideAction(
            caption: AppLocalizations.of(context).rename,
            color: Colors.blue,
            icon: CupertinoIcons.pencil,
            onTap: () => rename(context),
          ),
        ],
        child: RouteWidget(
          title: Text(route.displayName!),
          from: Text(route.fromAsString.stripAt()),
          to: Text(route.toAsString.stripAt()),
          onLongPress: () => more(context),
          trailing: const Icon(CupertinoIcons.chevron_forward),
          onTap: () => Navigator.of(context).pushNamed('/route', arguments: route),
        ),
      );

  Future<void> rename(BuildContext context) async {
    final displayName = await input(context, title: Text('How to rename "${route.displayName}" ?'));
    if (displayName == null) {
      return;
    }
    final store = context.read(storeProvider);
    await store.removeRoute(route);
    await store.addRoute(route.copyWith(displayName: displayName));
    return;
  }

  void more(BuildContext context) => showActionSheet<void>(
        context,
        [
          ActionsSheetAction(
            title: Text(AppLocalizations.of(context).rename),
            icon: const Icon(CupertinoIcons.pencil),
            onPressed: () => rename(context),
          ),
          ActionsSheetAction(
            onPressed: () => deleteRoute(context),
            title: Text(AppLocalizations.of(context).delete),
            icon: const Icon(CupertinoIcons.delete),
            isDestructive: true,
          ),
        ],
        cancel: ActionsSheetAction<void>(
          title: Text(AppLocalizations.of(context).cancel),
          icon: const Icon(CupertinoIcons.xmark),
        ),
      );

  Future<void> deleteRoute(BuildContext context) async {
    final b = await confirm(
      context,
      title: Text.rich(TextSpan(text: 'Delete ', children: [
        TextSpan(text: route.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: ' ?'),
      ])),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context).from,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.fromAsString,
            textAlign: TextAlign.center,
          ),
          Text(
            AppLocalizations.of(context).to,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.toAsString,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      confirm: Text(AppLocalizations.of(context).yes),
      cancel: Text(AppLocalizations.of(context).no),
      isConfirmDestructive: true,
    );
    if (!b) {
      return;
    }
    return context.read(storeProvider).removeRoute(route);
  }
}
