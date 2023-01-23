import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stop.dart';
import 'package:swift_travel/db/db.dart';
import 'package:swift_travel/db/favorite_store.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/utils/colors.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

class FavoriteStationTile extends ConsumerStatefulWidget {
  const FavoriteStationTile(this.stopWithId, {super.key});

  final DataWithId<FavoriteStop> stopWithId;

  FavoriteStop get stop => stopWithId.data;

  @override
  ConsumerState<FavoriteStationTile> createState() =>
      _FavoriteStationTileState();
}

class _FavoriteStationTileState extends ConsumerState<FavoriteStationTile> {
  SchStop favoriteToStop(FavoriteStop stop) =>
      SchStop(sbbName: stop.stop, id: stop.id);

  @override
  Widget build(BuildContext context) {
    final darwin = isThemeDarwin(context);
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: <Widget>[
          SlidableAction(
            label: AppLocalizations.of(context).delete,
            backgroundColor: Colors.red,
            icon: CupertinoIcons.delete,
            onPressed: delete,
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            label: AppLocalizations.of(context).rename,
            backgroundColor: Colors.blue,
            icon: CupertinoIcons.pencil,
            onPressed: rename,
          ),
          SlidableAction(
            label: AppLocalizations.of(context).timetable,
            backgroundColor: Colors.blue,
            icon: CupertinoIcons.list_number,
            onPressed: (context) => SideBar.push(
                context, (context) => StopDetails(favoriteToStop(widget.stop))),
          ),
        ],
      ),
      child: ListTile(
        horizontalTitleGap: 8,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (darwin)
              const GradientMask(
                gradient: RadialGradient(colors: [
                  Color(0xFFB71C1C),
                  Colors.red,
                ], radius: 0.4),
                child: Icon(CupertinoIcons.heart_fill, size: 32),
              )
            else
              const GradientMask(
                gradient: RadialGradient(colors: [
                  Colors.yellow,
                  Color(0xFFFBC02D),
                ]),
                child: Icon(CupertinoIcons.star_fill, size: 32),
              ),
          ],
        ),
        onTap: () => unawaited(
            Navigator.of(context).pushNamed('/route', arguments: widget.stop)),
        onLongPress: () async => edit(context),
        trailing: Icon(CupertinoIcons.chevron_forward,
            color: IconTheme.of(context).color),
        title: Text(widget.stop.name),
        subtitle: Text(widget.stop.stop, overflow: TextOverflow.ellipsis),
      ),
    );
  }

  Future<void> edit(BuildContext context) async {
    Vibration.instance.select();
    await showActionSheet<void>(
      context,
      [
        ActionsSheetAction(
          title: Text(AppLocalizations.of(context).timetable),
          icon: const Icon(CupertinoIcons.list_number),
          onPressed: () => SideBar.push(
              context, (context) => StopDetails(favoriteToStop(widget.stop))),
        ),
        ActionsSheetAction(
          title: Text(AppLocalizations.of(context).rename),
          icon: const Icon(CupertinoIcons.pencil),
          onPressed: () => rename(context),
        ),
        ActionsSheetAction(
          title: Text(AppLocalizations.of(context).delete),
          icon: const Icon(CupertinoIcons.delete),
          onPressed: () => delete(context),
          isDestructive: true,
        ),
      ],
      cancel: ActionsSheetAction(
        title: Text(AppLocalizations.of(context).close),
        icon: const Icon(CupertinoIcons.xmark),
      ),
    );
  }

  Future<void> rename(BuildContext context) async {
    final store = ref.read(favoritesStoreProvider);
    final s = await input(context,
        title: Text('How to rename "${widget.stop.name}" ?'));
    if (s == null) {
      return;
    }
    await store.removeStop(widget.stopWithId);
    await store.addStop(widget.stop.copyWith(name: s));
  }

  Future<void> delete(BuildContext context) async {
    final favoritesStore = ref.read(favoritesStoreProvider);
    final b = await confirm(
      context,
      title: Text(AppLocalizations.of(context).delete_fav),
      content:
          Text.rich(TextSpan(text: 'Do you really want to delete ', children: [
        TextSpan(
            text: '${widget.stop.name} (${widget.stop.stop})',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: '?'),
      ])),
      confirm: Text(AppLocalizations.of(context).yes),
      cancel: Text(AppLocalizations.of(context).no),
      isConfirmDestructive: true,
    );
    if (!b) return;

    return favoritesStore.removeStop(widget.stopWithId);
  }
}
