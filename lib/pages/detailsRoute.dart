import 'dart:developer';
import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/api/cff/leg.dart';
import 'package:swiss_travel/api/cff/route_connection.dart';
import 'package:swiss_travel/api/cff/stop.dart';
import 'package:swiss_travel/api/cff/types_enum.dart';
import 'package:swiss_travel/utils/format.dart';
import 'package:swiss_travel/widget/icon.dart';
import 'package:swiss_travel/widget/lineWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsRoute extends StatelessWidget {
  final RouteConnection c;

  const DetailsRoute({Key key, this.c}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(c.to),
      ),
      body: Column(
        children: <Widget>[
          _dataRow("Departure", c.from),
          _dataRow("Arrival", c.to),
          _dataRow("Travel duration", Format.intToMinutes(c.duration)),
          const Divider(thickness: 2, height: 4),
          Expanded(
            child: ListView.separated(
              itemCount: c.legs.length,
              itemBuilder: (context, i) {
                final Leg l = c.legs[i];
                return LegTile(l: l);
              },
              separatorBuilder: (context, index) => const Divider(
                indent: 16,
                endIndent: 16,
                height: 0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _dataRow(String key, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
                  )))
        ],
      ),
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
      : l.type == Vehicle.walk ? WalkingTile(l: l) : RegularLegTile(l: l);
}

class RegularLegTile extends StatelessWidget {
  const RegularLegTile({
    Key key,
    @required this.l,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Theme.of(context).backgroundColor.withAlpha(100),
      title: Row(
        children: <Widget>[
          if (l.line != null) ...[
            LineWidget(
                foreground: l.fgcolor, background: l.bgcolor, line: l.line),
            const SizedBox(width: 8),
          ] else ...[
            CffIcon(l.type),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                l.exit.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (l.track != null)
            Text(
              "Pl. ${l.track}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CffIcon(l.type, size: 16),
                const SizedBox(width: 8),
                Text(
                  l.terminal ?? "",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            if (l.exit != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.subtitle2,
                  child: Row(
                    children: [
                      Text(
                        "${Format.dateToHour(l.departure)} - ${Format.dateToHour(l.exit.arrival)}",
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(Format.intToMinutes(
                            l.runningtime,
                            pad: false,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      children: _buildStopTitle(l),
    );
  }

  List<Widget> _buildStopTitle(Leg l) {
    final List<Widget> list = [];
    list.add(_buildStop(Stop(l.name, departure: l.departure), bold: true));

    for (final stop in l.stops) {
      list.add(_buildStop(stop));
    }
    list.add(
        _buildStop(Stop(l.exit.name, departure: l.exit.arrival), bold: true));

    return list;
  }

  Padding _buildStop(Stop stop, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              stop.name,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
            ),
          ),
          if (stop.departure != null) ...[
            const SizedBox(width: 8),
            Text(Format.dateToHour(stop.departure))
          ],
        ],
      ),
    );
  }
}

class ArrivedTile extends StatelessWidget {
  const ArrivedTile({
    Key key,
    @required this.l,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          const FaIcon(FontAwesomeIcons.mapPin),
          const SizedBox(width: 8),
          Expanded(
              child: Text(l.name,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}

class WalkingTile extends StatelessWidget {
  const WalkingTile({
    Key key,
    @required this.l,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openRoute(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.walking),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            l.exit.name,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Walk ",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    TextSpan(
                        text: Format.intToMinutes(l.runningtime),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontWeight: FontWeight.w900)),
                  ])),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).disabledColor,
            ),
          ],
        ),
      ),
    );
  }

  Future openRoute() async {
    final departure =
        l.lat != null && l.lon != null ? "${l.lat}, ${l.lon}" : l.name;
    final arrival = "${l.exit.lat}, ${l.exit.lon}";
    const apple = "http://maps.apple.com/";
    const google = "https://maps.google.com/maps";
    final suffix =
        '?saddr=${Uri.encodeComponent(departure)}&daddr=${Uri.encodeComponent(arrival)}&dirflg=w';
    log(l.toString());
    log(suffix);
    if (Platform.isAndroid) {
      final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: google + suffix,
      );
      await intent.launch();
    } else if (Platform.isIOS) {
      final prefs = await SharedPreferences.getInstance();
      final url =
          (prefs.getBool("apple_maps") == false ? google : apple) + suffix;
      try {
        await launch(url);
      } on Exception {
        log("Failed to open $apple+suffix");
      }
    }
  }
}
