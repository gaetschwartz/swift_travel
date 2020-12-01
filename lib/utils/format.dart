import 'package:flutter/material.dart';

int colorFromString(String s) {
  if (s == null) throw ArgumentError("No color code provided");
  if (s.length == 3) {
    return int.parse("${s[0]}0${s[1]}0${s[2]}0", radix: 16) + 0xff000000;
  } else if (s.length == 6) {
    return int.parse(s, radix: 16) + 0xff000000;
  } else {
    throw ArgumentError("Color code is not valid : $s");
  }
}

abstract class Format {
  static String distance(double d) {
    return d == null
        ? ""
        : d >= 1000
            ? "${(d / 1000).toStringAsFixed(1)} km"
            : "${d.round()} m";
  }

  static String duration(Duration d, {Locale locale = const Locale("en")}) {
    if (d == null) return null;
    final m = d.inMinutes;
    if (m > 60) {
      final int hour = m ~/ 60;
      final int minutes = m % 60;
      return '${hour.toString()}${_hs(locale)}${minutes.toString().padLeft(2, "0")}';
    }
    if (m == 0) return _now(locale);
    if (m == 1) return "1 ${_mins(locale)}";
    return "$m ${_mins(locale)}";
  }

  static String _now(Locale locale) {
    switch (locale.languageCode) {
      case "fr":
        return "Maint.";
      case "de":
        return "Jetzt";
    }
    return "Now";
  }

  static String _hs(Locale locale) {
    switch (locale.languageCode) {
      case "fr":
        return "h";
    }
    return ":";
  }

  static String _mins(Locale locale) => locale.languageCode == "de" ? "min" : "mins";

  static String intToDuration(int i, [Locale locale = const Locale("en")]) {
    final m = i ~/ 60;
    final h = m ~/ 60;
    final hrs = h == 0 ? "" : "$h${_hs(locale)}";
    final string = (m % 60).toString();
    final mins = h != 0 ? string.padLeft(2, "0") : string;
    return "$hrs$mins${h == 0 ? " ${_mins(locale)}" : ""}";
  }

  static String time(DateTime date, [Locale locale = const Locale("en")]) {
    if (date == null) return "";
    final String min = date.minute < 10 ? "0${date.minute}" : date.minute.toString();
    return "${date.hour}:$min";
  }
}
