import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/apis/search.ch/models/cff_completion.dart';
import 'package:swift_travel/widgets/cff_icon.dart';

class SuggestedTile extends StatelessWidget {
  const SuggestedTile(
    this.suggestion, {
    Key key,
  }) : super(key: key);
  final CffCompletion suggestion;

  const SuggestedTile.empty() : suggestion = null;

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
            leading: suggestion.isCurrentLocation
                ? const Icon(FluentIcons.my_location_24_regular, size: 20)
                : CffIcon.fromIconClass(suggestion.icon, size: 20),
            title: Text(suggestion.favoriteName ?? suggestion.label),
            subtitle: suggestion.favoriteName != null ? Text(suggestion.label) : null,
            trailing: suggestion.favoriteName != null ? const Text('⭐') : null,
            horizontalTitleGap: 0,
            dense: true,
            tileColor: Colors.transparent,
          );
  }
}
