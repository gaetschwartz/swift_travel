import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/vehicle_iconclass.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/routes/details/route_details.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/string_utils/format.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/line_icon.dart';

class RouteTile extends StatelessWidget {
  const RouteTile({
    Key? key,
    required this.route,
    required this.i,
  }) : super(key: key);

  final CffRoute route;
  final int i;

  Widget rowIcon() {
    final listWidget = <Widget>[];
    final c = route.connections[i];
    for (var i = 0; i < c.legs.length - 1; i++) {
      final l = c.legs[i];
      listWidget.add(CffIcon(l.type, size: 18));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Wrap(spacing: 8, children: listWidget),
        ),
        const SizedBox(height: 4),
        Text('${Format.time(c.departure)} - ${Format.time(c.arrival)}')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = route.connections[i];
    final leg = c.legs.firstWhere(
        (l) => l.type != Vehicle.walk && l.type != null && l != c.legs.last,
        orElse: () => c.legs.first);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: shadowListOf(context),
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            isThreeLine: true,
            title: Row(
              children: [
                if (LineIcon.isValidLeg(leg)) LineIcon.fromLeg(leg) else CffIcon(leg.type),
                const SizedBox(width: 8),
                Expanded(child: Text(leg.exit!.name)),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: rowIcon(),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(Format.intToDuration(c.duration!.round())),
                if (c.depDelay > 0)
                  Text(
                    Format.delay(c.depDelay),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFF5252)),
                  ),
                const SizedBox(width: 16),
                const FaIcon(CupertinoIcons.chevron_forward),
              ],
            ),
            onTap: () {
              Nav.push(
                context,
                (context) => RouteDetails(route: route, i: i),
                title: AppLoc.of(context).tabs_route,
              );
              RouteHistoryRepository.i.safeAdd(
                  LocalRoute.fromRouteConnection(route.connections[i], timestamp: DateTime.now()));
            },
          ),
        ),
      ),
    );
  }
}
