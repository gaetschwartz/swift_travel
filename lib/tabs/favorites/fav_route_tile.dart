import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/utils/string_utils/string_utils.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/route_widget.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dialogs/input_dialog.dart';

class FavoriteRouteTile extends StatelessWidget {
  const FavoriteRouteTile(this.route, {Key? key}) : super(key: key);

  final LocalRoute route;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: AppLoc.of(context).delete,
          color: Colors.red,
          icon: CupertinoIcons.delete,
          onTap: () => deleteRoute(context),
        ),
      ],
      actions: [
        IconSlideAction(
          caption: AppLoc.of(context).rename,
          color: Colors.blue,
          icon: CupertinoIcons.pencil,
          onTap: () => rename(context),
        ),
      ],
      child: RouteWidget(
        title: Text(route.displayName!),
        from: Text(route.from.stripAt()),
        to: Text(route.to.stripAt()),
        onLongPress: () => more(context),
        trailing: const Icon(CupertinoIcons.chevron_forward),
        onTap: () => Navigator.of(context).pushNamed('/route', arguments: route),
      ),
    );
  }

  Future<void> rename(BuildContext context) async {
    final s = await input(context, title: Text('How to rename "${route.displayName}" ?'));
    if (s == null) return;
    final store = context.read(storeProvider) as FavoritesSharedPreferencesStore;
    await store.editRoutes(
        (routes) => routes.map((r) => r == route ? route.copyWith(displayName: s) : r).toSet());
    return;
  }

  void more(BuildContext context) {
    showActionSheet(
      context,
      [
        ActionsSheetAction(
          title: Text(AppLoc.of(context).rename),
          icon: const Icon(CupertinoIcons.pencil),
          onPressed: () => rename(context),
        ),
        ActionsSheetAction(
          onPressed: () => deleteRoute(context),
          title: Text(AppLoc.of(context).delete),
          icon: const Icon(CupertinoIcons.delete),
          isDestructive: true,
        ),
      ],
      popBeforeReturn: true,
      cancel: ActionsSheetAction(
        title: Text(AppLoc.of(context).cancel),
        icon: const Icon(CupertinoIcons.xmark),
      ),
    );
  }

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
            AppLoc.of(context).from,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.from,
            textAlign: TextAlign.center,
          ),
          Text(
            AppLoc.of(context).to,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.to,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      confirm: Text(AppLoc.of(context).yes),
      cancel: Text(AppLoc.of(context).no),
      isConfirmDestructive: true,
    );
    if (!b) return;
    return context.read(storeProvider).removeRoute(route);
  }
}
