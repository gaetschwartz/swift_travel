import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';

class RouteCompletionTile extends StatelessWidget {
  const RouteCompletionTile(
    this.completion, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  const RouteCompletionTile.empty({
    Key? key,
    this.onTap,
  })  : completion = null,
        super(key: key);

  final NavigationCompletion? completion;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => completion == null
      ? const ListTile(
          leading: SizedBox(
            height: 24,
            width: 24,
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
          ),
          title: SizedBox(
            width: double.infinity,
            height: 16,
            child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
          ),
          horizontalTitleGap: 0,
          dense: true,
        )
      : ListTile(
          leading: _Icon(completion!),
          title: Text(completion!.favoriteName ?? completion!.label),
          subtitle: completion!.favoriteName != null ? Text(completion!.label) : null,
          trailing: completion!.favoriteName != null ? const Text('⭐') : null,
          horizontalTitleGap: 0,
          dense: true,
          tileColor: Colors.transparent,
          onTap: onTap,
        );
}

class _Icon extends StatelessWidget {
  const _Icon(
    this.completion, {
    Key? key,
  }) : super(key: key);

  final NavigationCompletion completion;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(size: 20),
      child: () {
        switch (completion.origin) {
          case DataOrigin.favorites:
            return const Icon(CupertinoIcons.heart_fill);
          case DataOrigin.history:
            return const Icon(CupertinoIcons.clock);
          case DataOrigin.data:
            return completion.getIcon();
          case DataOrigin.currentLocation:
            return const Icon(CupertinoIcons.location_fill);
          case DataOrigin.prediction:
            return const Icon(CupertinoIcons.wand_stars);
          case DataOrigin.loading:
            return const SizedBox(
              height: 20,
              width: 20,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black),
              ),
            );
          case DataOrigin.contacts:
            return const Icon(CupertinoIcons.person);
        }
      }(),
    );
  }
}
