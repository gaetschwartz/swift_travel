import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/db/store.dart';
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

class FavoriteStationTile extends StatelessWidget {
  const FavoriteStationTile(
    this.stop, {
    Key? key,
  }) : super(key: key);

  final FavoriteStop stop;

  @override
  Widget build(BuildContext context) {
    final darwin = isDarwin(context);
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: AppLocalizations.of(context).delete,
          color: Colors.red,
          icon: CupertinoIcons.delete,
          onTap: () => delete(context),
        ),
      ],
      actions: [
        IconSlideAction(
          caption: AppLocalizations.of(context).rename,
          color: Colors.blue,
          icon: CupertinoIcons.pencil,
          onTap: () => rename(context),
        ),
        IconSlideAction(
          caption: AppLocalizations.of(context).timetable,
          color: Colors.blue,
          icon: CupertinoIcons.list_number,
          onTap: () =>
              SideBar.push(context, (context) => StopDetails(SbbStop.fromFavoriteStop(stop))),
        ),
      ],
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
        onTap: () => Navigator.of(context).pushNamed('/route', arguments: stop),
        onLongPress: () => edit(context),
        trailing: Icon(CupertinoIcons.chevron_forward, color: IconTheme.of(context).color),
        title: Text(stop.name),
        subtitle: Text(stop.stop, overflow: TextOverflow.ellipsis),
      ),
    );
  }

  void edit(BuildContext context) {
    Vibration.instance.select();
    showActionSheet<void>(
      context,
      [
        ActionsSheetAction(
          title: Text(AppLocalizations.of(context).timetable),
          icon: const Icon(CupertinoIcons.list_number),
          onPressed: () =>
              SideBar.push(context, (context) => StopDetails(SbbStop.fromFavoriteStop(stop))),
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
    final s = await input(context, title: Text('How to rename "${stop.name}" ?'));
    if (s == null) {
      return;
    }
    final store = context.read(storeProvider);
    await store.removeStop(stop);
    return store.addStop(stop.copyWith(name: s));
  }

  Future<void> delete(BuildContext context) async {
    final b = await confirm(
      context,
      title: Text(AppLocalizations.of(context).delete_fav),
      content: Text.rich(TextSpan(text: 'Do you really want to delete ', children: [
        TextSpan(
            text: '${stop.name} (${stop.stop})',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: '?'),
      ])),
      confirm: Text(AppLocalizations.of(context).yes),
      cancel: Text(AppLocalizations.of(context).no),
      isConfirmDestructive: true,
    );
    if (!b) {
      return;
    }
    return context.read(storeProvider).removeStop(stop);
  }
}
