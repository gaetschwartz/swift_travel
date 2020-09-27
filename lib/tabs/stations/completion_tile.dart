import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/tabs/stations/stop_details.dart';
import 'package:swiss_travel/widget/cff_icon.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';

class CffCompletionTile extends StatelessWidget {
  const CffCompletionTile(
    this.sugg, {
    Key key,
    this.isFav = false,
  }) : super(key: key);

  final CffCompletion sugg;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    final isPrivate = CffIcon.isPrivate(sugg.iconclass);
    if (sugg.label == null) log(sugg.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CffIcon.fromIconClass(sugg.iconclass),
            title: Text(sugg.label ?? "???"),
            dense: true,
            subtitle: sugg.dist != null
                ? Text("${sugg.dist.round()}m")
                : isFav || sugg.isFavorite
                    ? const Text("Favorite")
                    : null,
            trailing: isPrivate ? null : const Icon(Icons.arrow_forward_ios),
            onTap: isPrivate
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailsStop(stopName: sugg.label),
                      ),
                    );
                  },
          ),
        ),
      ),
    );
  }
}
