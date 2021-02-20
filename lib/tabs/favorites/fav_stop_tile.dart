import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/logic/store.dart';
import 'package:swift_travel/models/state_models.dart';
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
    final isDarwin = Responsive.isDarwin(context);
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: AppLoc.of(context).delete,
          color: Colors.red,
          icon: CupertinoIcons.delete,
          onTap: () => delete(context),
        ),
      ],
      actions: [
        IconSlideAction(
          caption: AppLoc.of(context).rename,
          color: Colors.blue,
          icon: CupertinoIcons.pencil,
          onTap: () => rename(context),
        ),
        IconSlideAction(
          caption: AppLoc.of(context).timetable,
          color: Colors.blue,
          icon: CupertinoIcons.list_number,
          onTap: () => Nav.push(context, (context) => StopDetails(stopName: stop.stop)),
        ),
      ],
      child: ListTile(
        horizontalTitleGap: 8,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isDarwin)
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
                  Colors.orange,
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
    Vibration.select();
    showActionSheet(
      context,
      [
        ActionsSheetAction(
          title: Text(AppLoc.of(context).timetable),
          icon: const Icon(CupertinoIcons.list_number),
          onPressed: () => Nav.push(context, (context) => StopDetails(stopName: stop.stop)),
        ),
        ActionsSheetAction(
          title: Text(AppLoc.of(context).rename),
          icon: const Icon(CupertinoIcons.pencil),
          onPressed: () => rename(context),
        ),
        ActionsSheetAction(
          title: Text(AppLoc.of(context).delete),
          icon: const Icon(CupertinoIcons.delete),
          onPressed: () => delete(context),
          isDestructive: true,
        ),
      ],
      popBeforeReturn: true,
      cancel: ActionsSheetAction(
        title: Text(AppLoc.of(context).close),
        icon: const Icon(CupertinoIcons.xmark),
        onPressed: () => null,
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
      title: Text(AppLoc.of(context).delete_fav),
      content: Text.rich(TextSpan(text: 'Do you really want to delete ', children: [
        TextSpan(
            text: '${stop.name} (${stop.stop})',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const TextSpan(text: '?'),
      ])),
      confirm: Text(AppLoc.of(context).yes),
      cancel: Text(AppLoc.of(context).no),
      isConfirmDestructive: true,
    );
    if (!b) {
      return;
    }
    return context.read(storeProvider).removeStop(stop);
  }
}
