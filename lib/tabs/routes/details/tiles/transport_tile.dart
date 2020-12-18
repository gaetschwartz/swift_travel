import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/cff/models/leg.dart';
import 'package:swift_travel/apis/cff/models/stop.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/widget/cff_icon.dart';
import 'package:swift_travel/widget/line_icon.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

@Deprecated('Use `NewTransportLegTile`')
class TransportLegTile extends StatelessWidget {
  const TransportLegTile({
    Key key,
    @required this.l,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) {
    final children = _stops(l, context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ExpandableTheme(
            data: const ExpandableThemeData(
              sizeCurve: Curves.easeOutCubic,
              iconRotationAngle: pi / 2,
            ),
            child: ExpandablePanel(
              header: Column(
                children: [
                  Row(
                    children: <Widget>[
                      if (l.line != null) ...[
                        LineIcon(foreground: l.fgcolor, background: l.bgcolor, line: l.line),
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
                          'Pl. ${l.track}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.subtitle2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CffIcon(l.type, size: 16),
                              const SizedBox(width: 8),
                              Text(l.terminal ?? ''),
                            ],
                          ),
                          if (l.exit != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Text.rich(TextSpan(children: [
                                    TextSpan(
                                      text: Format.time(l.departure),
                                    ),
                                    if (l.depDelay != null && l.depDelay > 0)
                                      TextSpan(
                                        text: Format.delay(l.depDelay),
                                        style: const TextStyle(color: Color(0xFFFF5252)),
                                      ),
                                    const TextSpan(text: ' ⇢ '),
                                    TextSpan(
                                      text: Format.time(l.exit.arrival),
                                    ),
                                  ])),
                                  const Spacer(),
                                  Text(Format.intToDuration(l.runningtime.round())),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              expanded: Column(
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _stops(Leg l, BuildContext context) {
    return [
      _buildStop(
        Stop(l.name, departure: l.departure),
        context,
        bold: true,
        isFirst: true,
      ),
      ...l.stops.map((s) => _buildStop(s, context)),
      _buildStop(
        Stop(l.exit.name, departure: l.exit.arrival),
        context,
        bold: true,
        isLast: true,
      )
    ];
  }

  Widget _buildLine(bool isVisible) {
    return Container(
      width: isVisible ? 1 : 0,
      color: Colors.grey.shade400,
    );
  }

  Widget _buildCircle(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      width: 8,
      height: 8,
    );
  }

  Widget _buildStop(Stop stop, BuildContext context,
      {bool bold = false, bool isFirst = false, bool isLast = false}) {
    return SizedBox(
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: _buildLine(!isFirst)),
              _buildCircle(context),
              Expanded(child: _buildLine(!isLast)),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              stop.name,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
            ),
          ),
          if (stop.departure != null) ...[
            const SizedBox(width: 8),
            Text(
              Format.time(stop.departure),
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
            ),
          ],
        ],
      ),
    );
  }
}
