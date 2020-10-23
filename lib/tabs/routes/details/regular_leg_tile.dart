import 'package:flutter/material.dart';
import 'package:swift_travel/apis/cff/models/leg.dart';
import 'package:swift_travel/apis/cff/models/stop.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/widget/cff_icon.dart';
import 'package:swift_travel/widget/expansion_tile.dart' as e;
import 'package:swift_travel/widget/line_icon.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

class RegularLegTile extends StatelessWidget {
  const RegularLegTile({
    Key key,
    @required this.l,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Theme.of(context).cardColor,
        ),
        child: e.CustomExpansionTile(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          childrenPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          title: Row(
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
                  "Pl. ${l.track}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
            ],
          ),
          subtitle: DefaultTextStyle(
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
                      Text(l.terminal ?? ""),
                    ],
                  ),
                  if (l.exit != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Text(Format.time(l.departure)),
                          if (l.depDelay != null && l.depDelay != "+0")
                            Text(
                              l.depDelay,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, color: Color(0xFFFF5252)),
                            ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(Format.intToDuration(l.runningtime.round())),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          children: _buildStopTitle(l),
        ),
      ),
    );
  }

  List<Widget> _buildStopTitle(Leg l) {
    final List<Widget> list = [];
    list.add(_buildStop(Stop(l.name, departure: l.departure), bold: true));

    for (final stop in l.stops) {
      list.add(_buildStop(stop));
    }
    list.add(_buildStop(Stop(l.exit.name, departure: l.exit.arrival), bold: true));

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
