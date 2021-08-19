import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/attribute.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:theming/dynamic_theme.dart';

class TransportDetails extends StatefulWidget {
  const TransportDetails({
    required this.leg,
    Key? key,
  }) : super(key: key);

  final Leg leg;

  @override
  _TransportDetailsState createState() => _TransportDetailsState();
}

class _TransportDetailsState extends State<TransportDetails> {
  late final stops = <Widget>[
    _Stop(
      SbbStop(name: widget.leg.name, departure: widget.leg.departure),
      isFirst: true,
      leg: widget.leg,
    ),
    ...widget.leg.stops.map((s) => _Stop(
          s,
          leg: widget.leg,
        )),
    _Stop(
      SbbStop(name: widget.leg.exit!.name, departure: widget.leg.exit!.arrival),
      isLast: true,
      leg: widget.leg,
    )
  ];
  late final List<Attribute> attributes = widget.leg.attributes.entries
      .map((e) =>
          Attribute.attributes[e.key]?.copyWith(message: e.value) ??
          Attribute(code: e.key, message: e.value))
      .where((e) => !e.ignore)
      .toList(growable: false);

  @override
  Widget build(BuildContext context) {
    final empty = attributes.isEmpty;
    final dividerCount = empty ? 0 : 1;
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => CupertinoPageScaffold(
        navigationBar: SwiftCupertinoBar(middle: Text(title)),
        child: child!,
      ),
      materialBuilder: (context, child) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: child,
      ),
      child: ListView.builder(
        itemBuilder: (context, i) {
          if (i == 0) {
            return PhysicalModel(
              shadowColor: ShadowTheme.of(context).buttonShadow!.color,
              elevation: 8,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    LineIcon(
                      line: widget.leg.line,
                      background: widget.leg.bgcolor,
                      foreground: widget.leg.fgcolor,
                    ),
                    const SizedBox(width: 8),
                    Text(AppLoc.of(context).direction(widget.leg.terminal ?? '')),
                  ],
                ),
              ),
            );
          }
          if (i < stops.length + 1) {
            return stops[i - 1];
          } else if (!empty && i == stops.length + 1) {
            return const Divider();
          } else {
            return _AttributeTile(att: attributes[i - dividerCount - stops.length - 1]);
          }
        },
        itemCount: attributes.length + dividerCount + stops.length + 1,
      ),
    );
  }

  Wrap buildWrap(BuildContext context) => Wrap(
        children: [
          for (final att in attributes)
            Padding(
              padding: const EdgeInsets.all(2),
              child: IconTheme(
                data: IconThemeData(
                    color: parseColor(
                      widget.leg.bgcolor,
                      Theme.of(context).colorScheme.onBackground,
                    ),
                    size: 16),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: att.icon ?? const Icon(CupertinoIcons.info_circle),
                ),
              ),
            )
        ],
      );

  String get title => AppLoc.of(context).journey_informations;
}

class _Stop extends StatelessWidget {
  const _Stop(
    this.stop, {
    Key? key,
    this.isFirst = false,
    this.isLast = false,
    required this.leg,
  }) : super(key: key);

  final Stop stop;
  final bool isFirst;
  final bool isLast;
  final Leg leg;

  @override
  Widget build(BuildContext context) {
    final bold = isFirst || isLast;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 48,
              child: stop.departure != null
                  ? Text(
                      Format.time(stop.departure),
                      style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
                    )
                  : const SizedBox(),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: _Line(isVisible: !isFirst)),
                _Circle(leg),
                Expanded(child: _Line(isVisible: !isLast)),
              ],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                stop.name,
                style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AttributeTile extends StatelessWidget {
  const _AttributeTile({
    Key? key,
    required this.att,
  }) : super(key: key);

  final Attribute att;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: IconTheme(
          data: const IconThemeData(color: Colors.white, size: 16),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: att.icon ?? const Icon(CupertinoIcons.info_circle),
            ),
          ),
        ),
        horizontalTitleGap: 0,
        title: Text(att.message!),
        dense: true,
        trailing: Env.isDebugMode && att.icon == null ? const Text('Unhandled') : null,
      );
}

class _Circle extends StatelessWidget {
  const _Circle(
    this.leg, {
    Key? key,
  }) : super(key: key);

  final Leg leg;

  @override
  Widget build(BuildContext context) => Container(
        decoration:
            BoxDecoration(color: parseColor(leg.bgcolor, Colors.black), shape: BoxShape.circle),
        width: 12,
        height: 12,
      );
}

class _Line extends StatelessWidget {
  const _Line({
    Key? key,
    required this.isVisible,
  }) : super(key: key);

  final bool isVisible;

  @override
  Widget build(BuildContext context) => isVisible
      ? const SizedBox(
          width: 2,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFE0E0E0),
            ),
          ),
        )
      : const SizedBox();
}
