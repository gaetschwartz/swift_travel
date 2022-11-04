import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/strings/format.dart';

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
            child: Row(
              children: [
                const Icon(CupertinoIcons.map_pin, size: 24),
                const Gap(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: AppLocalizations.of(context).arrive,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: ' (${Format.time(l.arrival)})',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    const Gap(8),
                    Text(
                      l.displayName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
