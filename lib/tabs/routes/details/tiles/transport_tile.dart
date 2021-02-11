import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/search.ch/models/leg.dart';
import 'package:swift_travel/apis/search.ch/models/stop.dart';
import 'package:swift_travel/tabs/routes/details/tiles/expandable.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/line_icon.dart';

class TransportLegTile extends StatefulWidget {
  const TransportLegTile({
    Key? key,
    required this.l,
  }) : super(key: key);

  final Leg l;

  @override
  _TransportLegTileState createState() => _TransportLegTileState();
}

const _expandableTheme = ExpandableThemeData(
  sizeCurve: Curves.easeOutCubic,
  iconRotationAngle: math.pi / 2,
  animationDuration: Duration(milliseconds: 100),
);

const _red = Color(0xFFFF5252);

class _TransportLegTileState extends State<TransportLegTile> {
  final ExpandableController _controller = ExpandableController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: shadowListOf(context),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ExpandableTheme(
            data: _expandableTheme,
            child: ExpandablePanel(
              controller: _controller,
              builder: (context, collapsed, expanded) {
                return ExpandableButton(
                  child: MyExpandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    backgroundColor: Theme.of(context).cardColor,
                    theme: _expandableTheme,
                  ),
                );
              },
              header: Column(
                children: [
                  Row(
                    children: <Widget>[
                      if (widget.l.line != null) ...[
                        LineIcon(
                            foreground: widget.l.fgcolor,
                            background: widget.l.bgcolor,
                            line: widget.l.line),
                      ] else ...[
                        CffIcon(widget.l.type),
                      ],
                      const SizedBox(width: 8),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.l.terminal!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      if (widget.l.track != null)
                        Text(
                          'Pl. ${widget.l.track}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ],
              ),
              expanded: Column(
                children: _stops(widget.l, context),
              ),
              collapsed: DefaultTextStyle(
                style: Theme.of(context).textTheme.subtitle2!,
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Builder(builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                  text: Format.time(widget.l.departure),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                if (widget.l.depDelay > 0)
                                  TextSpan(
                                    text: Format.delay(widget.l.depDelay),
                                    style: const TextStyle(
                                      color: _red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ])),
                              const SizedBox(width: 16),
                              Expanded(child: Text(widget.l.name!)),
                            ],
                          ),
                        ),
                        if (widget.l.exit != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: Format.time(widget.l.exit!.arrival),
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  if (widget.l.exit!.arrDelay > 0)
                                    TextSpan(
                                      text: Format.delay(widget.l.exit!.arrDelay),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: _red,
                                      ),
                                    ),
                                ])),
                                const SizedBox(width: 16),
                                Expanded(child: Text(widget.l.exit!.name)),
                                Text(Format.intToDuration(widget.l.runningTime!.round())),
                                const SizedBox(width: 32),
                              ],
                            ),
                          ),
                      ],
                    );
                  }),
                ),
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
        l,
        Stop(l.name!, departure: l.departure),
        context,
        bold: true,
        isFirst: true,
      ),
      ...l.stops.map((s) => _buildStop(l, s, context)),
      _buildStop(
        l,
        Stop(l.exit!.name, departure: l.exit!.arrival),
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

  Widget _buildCircle(BuildContext context, Leg l) {
    return Container(
      decoration: BoxDecoration(
        color: parseColor(l.bgcolor, Colors.black),
        shape: BoxShape.circle,
      ),
      width: 8,
      height: 8,
    );
  }

  Widget _buildStop(Leg l, Stop stop, BuildContext context,
      {bool bold = false, bool isFirst = false, bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: SizedBox(
        height: 28,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: _buildLine(!isFirst)),
                _buildCircle(context, l),
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
      ),
    );
  }
}
