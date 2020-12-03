import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/cff/models/leg.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

class ArrivedTile extends StatelessWidget {
  const ArrivedTile({
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
        child: ListTile(
          title: Row(
            children: [
              const FaIcon(FontAwesomeIcons.mapPin),
              const SizedBox(width: 8),
              Expanded(child: Text(l.name, style: const TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }
}
