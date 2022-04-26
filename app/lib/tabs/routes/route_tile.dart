import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/routes/details/route_details.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:swift_travel/widgets/sbb_icon.dart';
import 'package:vibration/vibration.dart';

class RouteTile extends StatelessWidget {
  const RouteTile({
    required this.route,
    required this.i,
    Key? key,
  }) : super(key: key);

  final NavRoute route;
  final int i;

  @override
  Widget build(BuildContext context) {
    final c = route.connections[i];
    final leg = c.legs.firstWhereOrNull((l) =>
            l.type != PlaceType.walk && l.type != null && l != c.legs.last) ??
        c.legs.first;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: shadowListOf(context),
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            isThreeLine: true,
            title: Row(
              children: [
                if (LineIcon.isValidLeg(leg))
                  LineIcon.fromLeg(leg)
                else
                  SbbIcon(leg.type),
                const Gap(8),
                Expanded(child: Text(leg.exit!.name)),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: _RowIcon(route: route, i: i),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(Format.duration(c.duration).toString()),
                if (c.depDelay != null)
                  Text(
                    Format.delay(c.depDelay!),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFFF5252)),
                  ),
                const Gap(16),
                const FaIcon(CupertinoIcons.chevron_forward),
              ],
            ),
            onTap: () {
              Vibration.instance.select();
              SideBar.push(
                context,
                (context) => RouteDetails(route: route, i: i),
                title: AppLocalizations.of(context).tabs_route,
              );
              RouteHistoryRepository.instance.safeAdd(
                  LocalRoute.fromRouteConnection(route.connections[i]));
            },
          ),
        ),
      ),
    );
  }
}

class _RowIcon extends StatelessWidget {
  const _RowIcon({
    Key? key,
    required this.route,
    required this.i,
  }) : super(key: key);

  final NavRoute route;
  final int i;

  @override
  Widget build(BuildContext context) {
    final c = route.connections[i];
    final listWidget = <Widget>[
      for (var i = 0; i < c.legs.length - 1; i++)
        SbbIcon(c.legs[i].type, size: 18)
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Wrap(spacing: 8, children: listWidget),
        ),
        const Gap(4),
        Text('${Format.time(c.departure)} - ${Format.time(c.arrival)}')
      ],
    );
  }
}
