import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/api/cff/models/leg.dart';
import 'package:swiss_travel/api/cff/models/route_connection.dart';
import 'package:swiss_travel/api/cff/models/types_enum.dart';
import 'package:swiss_travel/tabs/routes/route_details.dart';
import 'package:swiss_travel/utils/format.dart';
import 'package:swiss_travel/widget/cff_icon.dart';
import 'package:swiss_travel/widget/line_icon.dart';

class RouteTile extends StatelessWidget {
  const RouteTile({
    Key key,
    @required this.c,
  }) : super(key: key);

  final RouteConnection c;

  Widget rowIcon() {
    final List<Widget> listWidget = [];

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
        Text("${Format.dateTime(c.departure)} - ${Format.dateTime(c.arrival)}")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final leg = c.legs.firstWhere(
        (l) => l.type != Vehicle.walk && l.type != null && l != c.legs.last,
        orElse: () => c.legs.first);
    return ListTile(
      isThreeLine: true,
      title: Row(
        children: [
          if (leg.line == null)
            CffIcon(leg.type)
          else
            LineIcon(foreground: leg.fgcolor, background: leg.bgcolor, line: leg.line),
          const SizedBox(width: 8),
          Expanded(child: Text(leg.name)),
        ],
      ),
      subtitle: rowIcon(),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(Format.intToDuration(c.duration.round())),
          const SizedBox(width: 16),
          const FaIcon(FontAwesomeIcons.chevronRight),
        ],
      ),
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => RouteDetails(c: c))),
    );
  }
}
