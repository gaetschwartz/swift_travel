import 'package:flutter/material.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/widget/cff_icon.dart';

class SuggestedTile extends StatelessWidget {
  const SuggestedTile(
    this.suggestion, {
    Key key,
  }) : super(key: key);
  final CffCompletion suggestion;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CffIcon.fromIconClass(suggestion.iconclass),
      title: Text(suggestion.label),
      trailing: suggestion.isFavorite ? const Text("⭐") : null,
      dense: true,
    );
  }
}
