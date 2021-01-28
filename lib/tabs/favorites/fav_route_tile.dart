import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:vibration/vibration.dart';

class FavoriteRouteTile extends StatelessWidget {
  const FavoriteRouteTile(this.route, {Key key}) : super(key: key);

  final LocalRoute route;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: S.of(context).delete,
          color: Colors.red,
          icon: CupertinoIcons.delete,
          onTap: () => deleteRoute(context),
        ),
      ],
      child: ListTile(
        leading: const Icon(CupertinoIcons.arrow_turn_up_right),
        title: Text(route.displayName),
        horizontalTitleGap: 8,
        isThreeLine: true,
        dense: true,
        subtitle: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                route.from,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                route.to,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        onLongPress: () => more(context),
        trailing: IconButton(
            icon: const Icon(CupertinoIcons.chevron_forward),
            onPressed: () {
              Vibration.select();
              more(context);
            }),
        onTap: () => Navigator.of(context).pushNamed('/route', arguments: route),
      ),
    );
  }

  void more(BuildContext context) {
    showActionSheet(
      context,
      [
        ActionsSheetAction(
          onPressed: () => deleteRoute(context),
          title: Text(S.of(context).delete),
          icon: const Icon(CupertinoIcons.delete),
          isDestructive: true,
        ),
      ],
      cancel: ActionsSheetAction(
        title: Text(S.of(context).cancel),
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
            S.of(context).from,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.from,
            textAlign: TextAlign.center,
          ),
          Text(
            S.of(context).to,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.to,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      confirm: Text(S.of(context).yes),
      cancel: Text(S.of(context).no),
      isConfirmDestructive: true,
    );
    if (!b) return;
    return context.read(storeProvider).removeRoute(route);
  }
}
