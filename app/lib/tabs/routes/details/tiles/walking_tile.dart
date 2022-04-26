import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaets_logging/logging.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/utils/strings/markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WalkingTile extends ConsumerStatefulWidget {
  const WalkingTile(
    this.l, {
    Key? key,
  }) : super(key: key);

  final Leg l;

  @override
  ConsumerState<WalkingTile> createState() => _WalkingTileState();

  static const _apple = 'http://maps.apple.com/';
  static const _google = 'https://maps.google.com/maps';
}

class _WalkingTileState extends ConsumerState<WalkingTile> {
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => openRoute(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.personWalking),
                        const Gap(8),
                        Expanded(
                          child: Text(
                            widget.l.exit!.displayName,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Gap(8),
                    if (widget.l.exit!.waitTime > 0)
                      Text.rich(
                        parseDecoratedText(
                          AppLocalizations.of(context).walk_and_wait(
                            Format.duration(widget.l.walkingTime)!,
                            Format.intToDuration(widget.l.exit!.waitTime),
                          ),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      )
                    else
                      Text.rich(
                        parseDecoratedText(
                          AppLocalizations.of(context)
                              .walk(Format.duration(widget.l.walkingTime)!),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                  ],
                ),
              ),
              const Gap(16),
              const FaIcon(FontAwesomeIcons.map),
            ],
          ),
        ),
      );

  Future<void> openRoute(BuildContext context) async {
    if (widget.l.exit == null) {
      return;
    }

    log.log(widget.l.toString());
    // We should convert LV03 leg.x, leg.y to WGY84 because Switzerland is ✨edgy✨
    // http://geodesy.geo.admin.ch/reframe/lv03towgs84?easting=499692&northing=119844
    final legPos = widget.l.position;
    final exitPos = widget.l.exit!.position;

    final departure =
        legPos != null ? legPos.toCoordinatesString() : widget.l.displayName;
    final arrival = exitPos != null
        ? exitPos.toCoordinatesString()
        : widget.l.exit!.displayName;
    log.log('($departure) => ($arrival)');

    final suffix =
        '?saddr=${Uri.encodeComponent(departure)}&daddr=${Uri.encodeComponent(arrival)}&dirflg=w';
    if (kIsWeb) {
      final url = WalkingTile._google + suffix;
      await launchUrlString(url);
    } else if (Platform.isIOS) {
      final url = getMapsUrl(suffix);
      await launchUrlString(url);
    } else if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'action_view',
        data: WalkingTile._google + suffix,
      );
      await intent.launch();
    } else {
      final url = WalkingTile._google + suffix;
      await launchUrlString(url);
    }
  }

  String getMapsUrl(String suffix) {
    final m = ref.read(preferencesProvider).mapsApp.value;
    switch (m) {
      case NavigationApp.apple:
        log.log('Using Apple Maps');
        return WalkingTile._apple + suffix;
      case NavigationApp.google:
        log.log('Using Google Maps');
        return WalkingTile._google + suffix;
    }
  }
}
