import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/strings/format.dart';

class DepartureTile extends StatelessWidget {
  const DepartureTile(
    this.c, {
    Key? key,
  }) : super(key: key);

  final RouteConnection c;

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
                    const Gap(8),
                    Expanded(
                      child: Text(text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  String get text => 'Leave at ${Format.time(c.departure)}';
}
