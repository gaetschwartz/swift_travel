import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
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
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:vibration/vibration.dart';

class RouteDetails extends StatefulWidget {
  const RouteDetails({
    required this.route,
    required this.i,
    this.doShowCloseButton = false,
    super.key,
  });

  final NavRoute? route;
  final int i;
  final bool doShowCloseButton;

  @override
  State<RouteDetails> createState() => _RouteDetailsState();
}

class _RouteDetailsState extends State<RouteDetails> {
  @override
  Widget build(BuildContext context) {
    final conn = widget.route!.connections[widget.i];
    return PlatformBuilder(
        cupertinoBuilder: (context, child) => Material(
              child: CupertinoPageScaffold(
                resizeToAvoidBottomInset: false,
                navigationBar: SwiftCupertinoBar(
                  middle: Text(AppLocalizations.of(context).tabs_route),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () async => openShareAction(context, conn),
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
                      leading:
                          widget.doShowCloseButton ? const CloseButton() : null,
                      flexibleSpace: const SizedBox(),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.more_horiz),
                          onPressed: () async => openShareAction(context, conn),
                        ),
                      ]),
                SliverSafeArea(
                  top: platform == PlatformDesign.cupertino,
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

  Future<void> openShareAction(
      BuildContext context, RouteConnection conn) async {
    await showActionSheet<void>(
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
        ActionsSheetAction(
          icon: const Icon(CupertinoIcons.share),
          onPressed: () => _shareRoute(context),
          title: Text(AppLocalizations.of(context).share),
        ),
        ActionsSheetAction(
          icon: const Icon(CupertinoIcons.info),
          title: Text(AppLocalizations.of(context).share_as_image),
          onPressed: () => _shareRouteAsImage(context),
        ),
      ],
      cancel: ActionsSheetAction(
          icon: const Icon(CupertinoIcons.xmark),
          title: Text(AppLocalizations.of(context).close)),
    );
  }

  Future<void> _shareRoute(BuildContext context) async {
    Vibration.instance.select();
    await shareRoute(context, widget.route!, widget.i);
  }

  void openLive(BuildContext context, RouteConnection c) {
    Vibration.instance.select();
    unawaited(Navigator.of(context).push<void>(
        MaterialPageRoute(builder: (_) => LiveRoutePage(connection: c))));
  }

  Future<void> _shareRouteAsImage(BuildContext context) async {
    Vibration.instance.select();
    // show a dialog that displays the scre
    final image = await screenshot(
      context,
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            shrinkWrap: true,
            children: [
              DepartureTile(widget.route!.connections[widget.i]),
              for (final leg in widget.route!.connections[widget.i].legs)
                LegTile(leg),
            ],
          ),
        ),
      ),
      pixelRatio: MediaQuery.of(context).devicePixelRatio * 2,
    );
    if (image == null) {
      return;
    }
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();
    final temp = await getTemporaryDirectory();
    final folder = Directory(path.join(temp.path, 'swift_travel'));
    if (!folder.existsSync()) {
      await folder.create();
    }
    final file = File(path.join(folder.path, 'route.png'));

    await file.writeAsBytes(bytes);
    await shareFile(
      file,
      // ignore: use_build_context_synchronously
      subject: AppLocalizations.of(context).share_as_image,
      // center of the screen
      // sharePositionOrigin: const Rect.fromLTWH(0, 0, 0, 0),
    );
  }
}

class LegTile extends StatelessWidget {
  const LegTile(
    this.leg, {
    super.key,
  });

  final Leg leg;

  @override
  Widget build(BuildContext context) => leg.exit == null
      ? ArrivedTile(leg)
      : leg.type == PlaceType.walk
          ? WalkingTile(leg)
          : TransportLegTile(leg);
}
