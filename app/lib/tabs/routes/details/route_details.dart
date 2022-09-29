import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/live_route/live_route.dart';
import 'package:swift_travel/tabs/routes/details/snake.dart';
import 'package:swift_travel/tabs/routes/details/tiles/arrived_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/departure_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/transport/transport_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/walking_tile.dart';
import 'package:swift_travel/utils/share.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/utils/strings/strings.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

class RouteDetails extends StatelessWidget {
  const RouteDetails({
    required this.route,
    required this.i,
    this.doShowCloseButton = false,
    Key? key,
  }) : super(key: key);

  final NavRoute? route;
  final int i;
  final bool doShowCloseButton;

  @override
  Widget build(BuildContext context) {
    final conn = route!.connections[i];
    return PlatformBuilder(
        cupertinoBuilder: (context, child) => Material(
              child: CupertinoPageScaffold(
                resizeToAvoidBottomInset: false,
                navigationBar: SwiftCupertinoBar(
                  middle: Text(AppLocalizations.of(context).tabs_route),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () => openShareAction(context, conn),
                  ),
                ),
                child: child!,
              ),
            ),
        materialBuilder: (context, child) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: child,
            ),
        builder: (context, platform) => CustomScrollView(
              slivers: [
                if (platform == PlatformDesign.material)
                  SliverAppBar(
                      title: Text(AppLocalizations.of(context).tabs_route),
                      pinned: true,
                      floating: true,
                      leading: doShowCloseButton ? const CloseButton() : null,
                      flexibleSpace: const SizedBox(),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () => openShareAction(context, conn),
                        ),
                      ]),
                SliverSafeArea(
                  sliver: SliverToBoxAdapter(child: _Header(conn)),
                  bottom: false,
                  top: platform == PlatformDesign.cupertino,
                ),
                SliverSafeArea(
                  top: false,
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, i) => i == 0
                          ? DepartureTile(conn)
                          : LegTile(conn.legs[i - 1]),
                      childCount: conn.legs.length + 1,
                    ),
                  ),
                ),
              ],
            ));
  }

  void openShareAction(BuildContext context, RouteConnection conn) {
    showActionSheet<void>(
      context,
      [
        if (Env.isLiveRouteEnabled)
          ActionsSheetAction(
            icon: const Icon(CupertinoIcons.play_fill),
            onPressed: () => openLive(context, conn),
            title: Text(AppLocalizations.of(context).live_route),
          ),
        ActionsSheetAction(
          icon: const Icon(CupertinoIcons.game_controller),
          onPressed: () => Navigator.of(context).push<void>(
              CupertinoPageRoute(builder: (_) => const SneccGame())),
          title: const Text('Snake'),
        ),
        if (kIsWeb || isMobile)
          ActionsSheetAction(
            icon: const Icon(CupertinoIcons.share),
            onPressed: () => _shareRoute(context),
            title: Text(AppLocalizations.of(context).share),
          )
      ],
      cancel: ActionsSheetAction(
          icon: const Icon(CupertinoIcons.xmark),
          title: Text(AppLocalizations.of(context).close)),
    );
  }

  void _shareRoute(BuildContext context) {
    Vibration.instance.select();
    shareRoute(context, route!, i);
  }

  void openLive(BuildContext context, RouteConnection c) {
    Vibration.instance.select();
    Navigator.of(context).push<void>(
        MaterialPageRoute(builder: (_) => LiveRoutePage(connection: c)));
  }
}

class _Header extends StatelessWidget {
  const _Header(
    this.c, {
    Key? key,
  }) : super(key: key);

  final RouteConnection c;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Gap(8),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyLarge!,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _DataRow(
                      AppLocalizations.of(context).departure, c.from.stripAt()),
                  _DataRow(
                      AppLocalizations.of(context).destination, c.to.stripAt()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppLocalizations.of(context).travel_duration),
                      const Gap(8),
                      Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text:
                                          '${Format.time(c.departure)} - ${Format.time(c.arrival)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: ' (${Format.duration(c.duration)})')
                                ]),
                                textAlign: TextAlign.end,
                              )))
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 8),
        ],
      );
}

class _DataRow extends StatelessWidget {
  const _DataRow(
    this.title,
    this.text, {
    Key? key,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title),
          const Gap(8),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  )))
        ],
      );
}

class LegTile extends StatelessWidget {
  const LegTile(
    this.leg, {
    Key? key,
  }) : super(key: key);

  final Leg leg;

  @override
  Widget build(BuildContext context) => leg.exit == null
      ? ArrivedTile(leg)
      : leg.type == PlaceType.walk
          ? WalkingTile(leg)
          : TransportLegTile(leg);
}
