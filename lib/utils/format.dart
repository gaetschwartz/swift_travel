import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_free/api/cff/legs.dart';

class Format {
  static Widget duration(Duration d) {
    final m = d.inMinutes;
    if (m > 60) return const Text(">1 h");
    if (m == 0) return FaIcon(FontAwesomeIcons.bus);
    return Text("$m m");
  }

  static String intToSeconds(int i) {
    double sec = i.toDouble();
    while (sec > 60) {
      sec = sec / 60;
      print(sec);
    }

    final int hour = sec.truncate();
    double min = sec - hour;

    min = min * 60;

    final String minString = min.toString().split(".").first;

    return "${hour}h$minString";
  }

  static Widget buildIcon(Legs l) {
    if (l.type == "bus") {
      return FaIcon(FontAwesomeIcons.bus);
    }
    if (l.type == "tram") {
      return FaIcon(FontAwesomeIcons.subway);
    }
    if (l.type == "walk") {
      return FaIcon(FontAwesomeIcons.walking);
    }
    if (l.type == "express_train") {
      return FaIcon(FontAwesomeIcons.train);
    } else {
      return FaIcon(FontAwesomeIcons.walking);
    }
  }
}
