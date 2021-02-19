import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';

class SuggestedTile extends StatelessWidget {
  const SuggestedTile(
    this.suggestion, {
    Key? key,
  }) : super(key: key);

  final Completion? suggestion;

  const SuggestedTile.empty() : suggestion = null;

  Widget? buildIcon(BuildContext context) {
    switch (suggestion!.origin) {
      case DataOrigin.favorites:
        return const Icon(CupertinoIcons.heart_fill, size: 20);
      case DataOrigin.history:
        return const Icon(CupertinoIcons.clock, size: 20);
      case DataOrigin.data:
        return suggestion!.getIcon(size: 20);
      case DataOrigin.currentLocation:
        return const Icon(CupertinoIcons.location_fill, size: 20);
      case DataOrigin.prediction:
        return const Icon(CupertinoIcons.wand_stars, size: 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    return suggestion == null
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
            leading: buildIcon(context),
            title: Text(suggestion!.favoriteName ?? suggestion!.label),
            subtitle: suggestion!.favoriteName != null ? Text(suggestion!.label) : null,
            trailing: suggestion!.favoriteName != null ? const Text('⭐') : null,
            horizontalTitleGap: 0,
            dense: true,
            tileColor: Colors.transparent,
          );
  }
}
