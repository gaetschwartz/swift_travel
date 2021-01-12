import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/cff/models/local_route.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:theming/dialogs/choice.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:vibration/vibration.dart';

class FavoriteRouteTile extends StatelessWidget {
  const FavoriteRouteTile({
    Key key,
    @required this.route,
  }) : super(key: key);

  final LocalRoute route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(FontAwesomeIcons.route),
      isThreeLine: true,
      title: Text(route.displayName),
      subtitle: Text('${route.from} ➡ ${route.to}'),
      trailing: IconButton(
          icon: const Icon(CupertinoIcons.pencil),
          onPressed: () {
            Vibration.select();
            choose<void>(
              context,
              choices: [
                Choice(
                  isDestructive: true,
                  onTap: () => deleteRoute(context),
                  child: Text(Strings.of(context).delete),
                  value: null,
                )
              ],
              cancel: Choice.cancel(child: Text(Strings.of(context).cancel)),
              title: Text(Strings.of(context).what_to_do),
            );
          }),
      onTap: () async {
        Navigator.of(context).pushNamed("/route", arguments: route);
      },
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
            Strings.of(context).from,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.from,
            textAlign: TextAlign.center,
          ),
          Text(
            Strings.of(context).to,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.to,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      confirm: Text(Strings.of(context).yes),
      cancel: Text(Strings.of(context).no),
      isConfirmDestructive: true,
    );
    if (!b) return;
    return context.read(storeProvider).removeRoute(route);
  }
}
