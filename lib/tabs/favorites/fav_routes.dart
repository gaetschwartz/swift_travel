import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:models/cff/local_route.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:utils/dialogs/choice.dart';
import 'package:utils/dialogs/confirmation_alert.dart';
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
            choose<String>(
              context,
              choices: [
                Choice(
                  value: 'Delete',
                  isDestructive: true,
                  onTap: () => deleteRoute(context),
                  child: null,
                )
              ],
              cancel: const Choice.cancel(child: Text('Cancel')),
              title: const Text('What to do ?'),
            );
          }),
      onTap: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SearchRoute(localRoute: route)));
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
            'From',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.from,
            textAlign: TextAlign.center,
          ),
          Text(
            'To',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            route.to,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      confirm: const Text('Yes'),
      cancel: const Text('No'),
      isConfirmDestructive: true,
    );
    if (!b) return;
    return context.read(storeProvider).removeRoute(route);
  }
}
