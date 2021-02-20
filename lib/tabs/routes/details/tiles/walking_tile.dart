import 'dart:developer';
import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/utils/strings/markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class WalkingTile extends StatelessWidget {
  const WalkingTile(
    this.l, {
    Key? key,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openRoute(context),
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
                        child: Text(
                          l.exit!.name,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (l.exit != null && l.exit!.waittime > 0)
                    Text.rich(
                      parseDecoratedText(
                        AppLoc.of(context).walk_and_wait(
                            Format.intToDuration(l.runningTime!.round()),
                            Format.intToDuration(l.exit!.waittime)),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    )
                  else
                    Text.rich(
                      parseDecoratedText(
                        AppLoc.of(context).walk(Format.intToDuration(l.runningTime!.round())),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const FaIcon(FontAwesomeIcons.map),
          ],
        ),
      ),
    );
  }

  static const _apple = 'http://maps.apple.com/';
  static const _google = 'https://maps.google.com/maps';

  Future<void> openRoute(BuildContext context) async {
    log(l.toString());
    final departure = l.lat != null && l.lon != null ? '${l.lat}, ${l.lon}' : l.name;
    final arrival = l.exit!.lat != null && l.exit!.lon != null
        ? '${l.exit!.lat}, ${l.exit!.lon}'
        : l.exit!.name;
    log('($departure) => ($arrival)');

    final suffix =
        '?saddr=${Uri.encodeComponent(departure)}&daddr=${Uri.encodeComponent(arrival)}&dirflg=w';
    if (kIsWeb) {
      final url = _google + suffix;
      await launch(url);
    } else if (Platform.isIOS) {
      final url = getMapsUrl(context, suffix);
      await launch(url);
    } else if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'action_view',
        data: _google + suffix,
      );
      await intent.launch();
    } else {
      final url = _google + suffix;
      await launch(url);
    }
  }

  String getMapsUrl(BuildContext context, String suffix) {
    final m = context.read(preferencesProvider).mapsApp;
    switch (m) {
      case Maps.apple:
        log('Using Apple Maps');
        return _apple + suffix;
      case Maps.google:
        log('Using Google Maps');
        return _google + suffix;
    }
  }
}
