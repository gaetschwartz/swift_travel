import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CffIcon extends StatelessWidget {
  const CffIcon(
    this.icon, {
    Key key,
    this.size,
    this.color,
  }) : super(key: key);

  final String icon;
  final double size;
  final Color color;

  static Widget getIcon(String s) {
    if (s == null) return const FaIcon(FontAwesomeIcons.question);
    final icon = s.substring(s.lastIndexOf("-") + 1);
    switch (icon) {
      case "bus":
        return const FaIcon(FontAwesomeIcons.bus);
      case "tram":
        return const FaIcon(FontAwesomeIcons.subway);
      case "walk":
        return const FaIcon(FontAwesomeIcons.walking);
      case "strain":
      case "train":
      case "express_train":
      case "funicular":
        return const FaIcon(FontAwesomeIcons.train);
      case "business":
        return const FaIcon(FontAwesomeIcons.store);
      case "adr":
        return const FaIcon(FontAwesomeIcons.home);
      case "private":
        return const FaIcon(FontAwesomeIcons.building);
      case "gondola":
        return const FaIcon(FontAwesomeIcons.ship);
      case "post":
        return const FaIcon(FontAwesomeIcons.busAlt);
    }
    log("", error: "Unknown icon : `$icon`");
    return const FaIcon(FontAwesomeIcons.question);
  }

  static const List<String> _privatePlaces = ["adr", "business", "private"];

  static bool isPrivate(String s) => _privatePlaces.contains(s.substring(s.lastIndexOf("-") + 1));

  @override
  Widget build(BuildContext context) => IconTheme(
        data: IconTheme.of(context).copyWith(size: size, color: color),
        child: getIcon(icon),
      );
}
