import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/search.ch/models/leg.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/format.dart';
import 'package:swift_travel/utils/markdown.dart';

class ArrivedTile extends StatelessWidget {
  const ArrivedTile({
    Key? key,
    required this.l,
  }) : super(key: key);

  final Leg l;

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.mapPin),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(l.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text.rich(parseDecoratedText(
                AppLoc.of(context).youll_be_there(Format.time(l.arrival)),
                Theme.of(context).textTheme.subtitle2,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
