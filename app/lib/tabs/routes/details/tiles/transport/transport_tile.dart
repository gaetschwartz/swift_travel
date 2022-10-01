import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/attribute.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/tabs/routes/details/tiles/attributes_page.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:swift_travel/widgets/sbb_icon.dart';
import 'package:theming/responsive.dart';

import 'details.dart';

class TransportLegTile extends StatefulWidget {
  const TransportLegTile(
    this.l, {
    Key? key,
  }) : super(key: key);

  final Leg l;

  @override
  _TransportLegTileState createState() => _TransportLegTileState();
}

const _red = Color(0xFFFF5252);

class _TransportLegTileState extends State<TransportLegTile> {
  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(16));
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: shadowListOf(context),
          borderRadius: borderRadius,
          color: Theme.of(context).cardColor,
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {
            unawaited(Navigator.of(context).push(
              PlatformPageRoute(
                builder: (context) => TransportDetails(leg: widget.l),
              ),
            ));
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Gap(12),
                  Expanded(
                    child: Column(
                      children: [
                        _Header(widget.l),
                        _Collapsed(widget.l),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(CupertinoIcons.forward),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class _Collapsed extends StatelessWidget {
  const _Collapsed(
    this.l, {
    Key? key,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) => DefaultTextStyle(
      style: Theme.of(context).textTheme.titleSmall!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: Format.time(l.departure),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (l.depDelay != null)
                    TextSpan(
                      text: Format.delay(l.depDelay!),
                      style: const TextStyle(
                        color: _red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ])),
                const Gap(16),
                Expanded(child: Text(l.name)),
              ],
            ),
          ),
          if (l.exit != null)
            IconTheme(
              data: const IconThemeData(size: 16, color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: Format.time(l.exit!.arrival),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (l.exit!.arrDelay != null)
                        TextSpan(
                          text: Format.delay(l.exit!.arrDelay!),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _red,
                          ),
                        ),
                    ])),
                    const Gap(16),
                    Expanded(child: Text(l.exit!.name)),
                    InkWell(
                      onTap: () async {
                        final darwin = isThemeDarwin(context);
                        final list = l.attributes.entries
                            .map(Attribute.fromAttribute)
                            .where((e) => !e.ignore)
                            .toList()
                          ..sort((a, b) => a.code.compareTo(b.code));

                        if (Env.isDebugMode) {
                          list.add(Attribute(
                            code: 'dummy_code',
                            message: 'This is a dummy unhandled attribute',
                          ));
                        }
                        if (darwin) {
                          await showCupertinoModalBottomSheet<void>(
                              context: context,
                              builder: (context) => CupertinoPageScaffold(
                                    resizeToAvoidBottomInset: false,
                                    navigationBar: CupertinoNavigationBar(
                                      automaticallyImplyLeading: false,
                                      middle: Text(
                                          '${l.line} ${AppLocalizations.of(context).to} ${l.terminal}'),
                                    ),
                                    child: SafeArea(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Gap(8),
                                          ...list.map(AttributeTile.new),
                                          const Gap(8),
                                        ],
                                      ),
                                    ),
                                  ),
                              expand: false);
                        } else {
                          await showMaterialModalBottomSheet<void>(
                              context: context,
                              builder: (context) => Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Gap(8),
                                      ...list.map(AttributeTile.new),
                                      const Gap(8),
                                    ],
                                  ),
                              expand: false);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...l.attributes.entries
                              .map(Attribute.fromAttribute)
                              .where((e) => !e.ignore)
                              .map((att) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.red,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: att.icon,
                                      ),
                                    ),
                                  ))
                              .take(3),
                          if (l.attributes.length > 3) ...[
                            const Gap(2),
                            Text('+${l.attributes.length - 3}'),
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ));
}

class _Header extends StatelessWidget {
  const _Header(
    this.l, {
    Key? key,
  }) : super(key: key);

  final Leg l;

  String fmtTrack(String s) {
    final i = s.indexOf('!');
    if (i == -1) return s;
    return s.substring(0, i);
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: <Widget>[
              if (l.line != null) LineIcon.fromLeg(l) else SbbIcon(l.type),
              const Gap(8),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    l.terminal!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              if (l.track != null)
                Text(
                  'Pl. ${fmtTrack(l.track!)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: l.track!.contains('!') ? Colors.red : null),
                ),
            ],
          ),
        ],
      );
}
