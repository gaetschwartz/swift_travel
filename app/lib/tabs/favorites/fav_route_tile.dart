import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:swift_travel/db/db.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/utils/strings/strings.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/route_widget.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dialogs/input_dialog.dart';

class FavoriteRouteTile extends ConsumerWidget {
  const FavoriteRouteTile(this.routeWithId, {super.key});

  final DataWithId<LocalRoute> routeWithId;

  LocalRoute get route => routeWithId.data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            label: AppLocalizations.of(context).rename,
            backgroundColor: Colors.blue,
            icon: CupertinoIcons.pencil,
            onPressed: (context) async => rename(context, ref),
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: <Widget>[
          SlidableAction(
            label: AppLocalizations.of(context).delete,
            backgroundColor: Colors.red,
            icon: CupertinoIcons.delete,
            onPressed: (context) async => deleteRoute(context, ref),
          ),
        ],
      ),
      child: RouteWidget(
        title: Text(route.displayName!),
        from: Text(route.fromAsString.stripAt()),
        to: Text(route.toAsString.stripAt()),
        onLongPress: () async => more(context, ref),
        trailing: const Icon(CupertinoIcons.chevron_forward),
        onTap: () => unawaited(
            Navigator.of(context).pushNamed('/route', arguments: route)),
      ),
    );
  }

  Future<void> rename(BuildContext context, WidgetRef ref) async {
    final store = ref.read(favoritesStoreProvider);
    final displayName = await input(context,
        title: Text('How to rename "${route.displayName}" ?'));
    if (displayName == null) {
      return;
    }
    await store.removeRoute(routeWithId);
    await store.addRoute(route.copyWith(displayName: displayName));
    return;
  }

  Future<void> more(BuildContext context, WidgetRef ref) async {
    await showActionSheet<void>(
      context,
      [
        ActionsSheetAction(
          title: Text(AppLocalizations.of(context).rename),
          icon: const Icon(CupertinoIcons.pencil),
          onPressed: () => rename(context, ref),
        ),
        ActionsSheetAction(
          onPressed: () => deleteRoute(context, ref),
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
  }

  Future<void> deleteRoute(BuildContext context, WidgetRef ref) async {
    final favoritesStore = ref.read(favoritesStoreProvider);
    final b = await confirm(
      context,
      title: Text.rich(TextSpan(text: 'Delete ', children: [
        TextSpan(
            text: route.displayName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: ' ?'),
      ])),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context).from,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            route.fromAsString,
            textAlign: TextAlign.center,
          ),
          Text(
            AppLocalizations.of(context).to,
            style: Theme.of(context).textTheme.titleMedium,
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
    if (!b) return;

    return favoritesStore.removeRoute(routeWithId);
  }
}
