import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/strings/format.dart';
import 'package:swift_travel/utils/strings/markdown.dart';

class ArrivedTile extends StatelessWidget {
  const ArrivedTile(
    this.l, {
    Key? key,
  }) : super(key: key);

  final Leg l;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: shadowListOf(context),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.mapPin),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(l.displayName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text.rich(parseDecoratedText(
                  AppLocalizations.of(context).youll_be_there(Format.time(l.arrival)),
                  style: Theme.of(context).textTheme.subtitle2,
                )),
              ],
            ),
          ),
        ),
      );
}
