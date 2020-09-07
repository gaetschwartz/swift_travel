import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_free/api/cff/completions.dart';
import 'package:travel_free/api/cff/legs.dart';

class Format {
  static String duration(Duration d, {bool showExactTime = false}) {
    final m = d.inMinutes;
    if (m > 60) {
      if (showExactTime) {
        final int hour = m ~/ 60;
        final int minutes = m % 60;
        return '${hour.toString()}h${minutes.toString().padLeft(2, "0")}';
      } else {
        return ">1 h";
      }
    }
    if (m == 0) return "now";
    return "$m m";
  }

  static String intToSeconds(int i) {
    double sec = i.toDouble();
    while (sec > 60) {
      sec = sec / 60;
    }

    final int hour = sec.truncate();
    double min = sec - hour;

    min = min * 60;
    String minS = min.toString();
    if (min < 10) {
      minS = min < 10 ? "0$min" : min.toString();
    }

    final String minString = minS.split(".").first;

    return "${hour}h$minString";
  }

  static Widget buildIconFromLegs(Legs l) {
    if (l.type == "bus") {
      return const FaIcon(FontAwesomeIcons.bus);
    }
    if (l.type == "tram") {
      return const FaIcon(FontAwesomeIcons.subway);
    }
    if (l.type == "walk") {
      return const FaIcon(FontAwesomeIcons.walking);
    }

    if (l.type == "express_train") {
      return const FaIcon(FontAwesomeIcons.train);
    } else {
      return const FaIcon(FontAwesomeIcons.walking);
    }
  }

  static String dateToHour(DateTime arrival) {
    final String min = arrival.minute < 10 ? "0${arrival.minute}" : arrival.minute.toString();
    return "${arrival.hour}h$min";
  }

  static Widget completionToIcon(Completion c) {
    final icon = c.iconClass.split("-").last;
    if (icon == "bus") {
      return const FaIcon(FontAwesomeIcons.bus);
    }
    if (icon == "tram") {
      return const FaIcon(FontAwesomeIcons.subway);
    }
    if (icon == "walk") {
      return const FaIcon(FontAwesomeIcons.walking);
    }
    if (icon == "train") {
      return const FaIcon(FontAwesomeIcons.train);
    }
    if (icon == "strain") {
      return const FaIcon(FontAwesomeIcons.train);
    }
    if (icon == "business") {
      return const FaIcon(FontAwesomeIcons.building);
    }
    if (icon == "adr") {
      return const FaIcon(FontAwesomeIcons.home);
    }
    if (icon == "express_train") {
      return const FaIcon(FontAwesomeIcons.train);
    } else {
      return const FaIcon(FontAwesomeIcons.walking);
    }
  }
}
