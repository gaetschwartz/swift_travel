import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/apis/cff/models/leg.dart';
import 'package:swift_travel/apis/cff/models/route_connection.dart';
import 'package:swift_travel/apis/cff/models/types_enum.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/live_route/live_route.dart';
import 'package:swift_travel/tabs/routes/details/tiles/arrived_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/transport_tile.dart';
import 'package:swift_travel/tabs/routes/details/tiles/walking_tile.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/utils/share.dart';
import 'package:vibration/vibration.dart';

class RouteDetails extends StatelessWidget {
  final CffRoute route;
  final int i;
  final bool doClose;

  const RouteDetails({
    Key key,
    @required this.route,
    @required this.i,
    this.doClose = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conn = route.connections[i];
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            title: Text(Strings.of(context).tabs_route),
            pinned: true,
            snap: true,
            floating: true,
            leading: doClose ? const CloseButton() : null,
            flexibleSpace: const SizedBox(),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(CupertinoIcons.play_fill),
                  onPressed: () => openLive(context, conn)),
              if (isMobile || kIsWeb)
                IconButton(
                    icon: Theme.of(context).platform == TargetPlatform.iOS
                        ? const Icon(CupertinoIcons.share)
                        : const Icon(Icons.share),
                    onPressed: () => _shareRoute(context))
            ]),
        SliverToBoxAdapter(
          child: buildHeader(
            context,
            conn,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => LegTile(l: conn.legs[i]),
            childCount: conn.legs.length,
          ),
        ),
      ],
    ));
  }

  String _format(String place) {
    final i = place.indexOf('@');
    if (i == -1) return place;
    return place.substring(0, i);
  }

  PreferredSize buildPreferred(BuildContext context, RouteConnection c, Size size) {
    return PreferredSize(
      preferredSize: size,
      child: SizedBox.fromSize(size: size, child: buildHeader(context, c)),
    );
  }

  Widget buildHeader(BuildContext context, RouteConnection c) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _dataRow(Strings.of(context).departure, _format(c.from)),
              _dataRow(Strings.of(context).destination, _format(c.to)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(Strings.of(context).travel_duration),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: '${Format.time(c.departure)} - ${Format.time(c.arrival)}',
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' (${Format.intToDuration(c.duration.round())})')
                            ]),
                            textAlign: TextAlign.end,
                          )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _shareRoute(BuildContext context) {
    Vibration.select();
    shareRoute(context, route, i);
  }

  void openLive(BuildContext context, RouteConnection c) {
    Vibration.select();
    Navigator.of(context)
        .push(MaterialWithModalsPageRoute(builder: (_) => LiveRoutePage(connection: c)));
  }

  void base64Experiment() {
    final connection = route.connections[i];
    final json = connection.toJson().toString();
    log(json);
    final bytes = ascii.encode(json);
    final compressed = zlib.encode(bytes);
    final compressed64 = base64.encode(compressed);
    final raw64 = base64.encode(bytes);
    log('compresssed : ${compressed64.length}, raw : ${raw64.length}');
    log(compressed64);
  }

  Widget _dataRow(String key, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(key),
        const SizedBox(width: 8),
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
}

class LegTile extends StatelessWidget {
  const LegTile({
    Key key,
    @required this.l,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) => l.exit == null
      ? ArrivedTile(l: l)
      : l.type == Vehicle.walk
          ? WalkingTile(l: l)
          : TransportLegTile(l: l);
}
