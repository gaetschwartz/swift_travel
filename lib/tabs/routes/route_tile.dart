import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/apis/cff/models/leg.dart';
import 'package:swift_travel/apis/cff/models/types_enum.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

class RouteTile extends StatelessWidget {
  const RouteTile({
    Key key,
    @required this.route,
    @required this.i,
  }) : super(key: key);

  final CffRoute route;
  final int i;

  Widget rowIcon() {
    final List<Widget> listWidget = [];
    final c = route.connections[i];
    for (int i = 0; i < c.legs.length - 1; i++) {
      final Leg l = c.legs[i];
      listWidget.add(CffIcon(l.type, size: 18));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Wrap(spacing: 8, children: listWidget),
        ),
        const SizedBox(height: 4),
        Text('${Format.time(c.departure)} - ${Format.time(c.arrival)}')
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = route.connections[i];
    final leg = c.legs.firstWhere(
        (l) => l.type != Vehicle.walk && l.type != null && l != c.legs.last,
        orElse: () => c.legs.first);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            isThreeLine: true,
            title: Row(
              children: [
                if (leg.line == null)
                  CffIcon(leg.type)
                else
                  LineIcon(foreground: leg.fgcolor, background: leg.bgcolor, line: leg.line),
                const SizedBox(width: 8),
                Expanded(child: Text(leg.exit.name)),
              ],
            ),
            subtitle: rowIcon(),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(Format.intToDuration(c.duration.round())),
                if (c.depDelay > 0)
                  Text(
                    Format.delay(c.depDelay),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFF5252)),
                  ),
                const SizedBox(width: 16),
                const FaIcon(FontAwesomeIcons.chevronRight),
              ],
            ),
            onTap: () => Navigator.of(context)
                .pushNamed("/routeDetails", arguments: {"route": route, "i": i}),
          ),
        ),
      ),
    );
  }
}
