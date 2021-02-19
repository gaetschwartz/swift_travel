import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/exit.dart';

int? parseColorInt(String? s) {
  if (s == null || s.isEmpty) {
    return null;
  } else if (s.length == 3) {
    return int.parse('${s[0]}0${s[1]}0${s[2]}0', radix: 16) + 0xff000000;
  } else if (s.length == 6) {
    return int.parse(s, radix: 16) + 0xff000000;
  } else {
    throw ArgumentError('Color code is not valid : $s');
  }
}

Color parseColor(String? s, Color defaultColor) {
  final c = parseColorInt(s);
  return c == null ? defaultColor : Color(c);
}

mixin Format {
  static String distance(double? d) {
    return d == null
        ? ''
        : d >= 1000
            ? '${(d / 1000).toStringAsFixed(1)} km'
            : '${d.round()} m';
  }

  static String delay(int d) => delayToJson(d);

  static String? duration(Duration? d, {Locale locale = const Locale('en')}) {
    if (d == null) return null;
    final m = d.inMinutes;
    if (m > 60) {
      final hour = m ~/ 60;
      final minutes = m % 60;
      return '${hour.toString()}${_hs(locale)}${minutes.toString().padLeft(2, '0')}';
    }
    if (m == 0) return _now(locale);
    if (m == 1) return '1 ${_mins(locale, m)}';
    return '$m ${_mins(locale, m)}';
  }

  static String _now(Locale locale) {
    switch (locale.languageCode) {
      case 'fr':
        return 'Maint.';
      case 'de':
        return 'Jetzt';
      default:
        return 'Now';
    }
  }

  static String _hs(Locale locale) {
    switch (locale.languageCode) {
      case 'fr':
        return 'h';
    }
    return ':';
  }

  static String _mins(Locale locale, int m) {
    switch (locale.languageCode) {
      case 'fr':
      case 'en':
        return m == 1 ? 'min' : 'mins';
      default:
        return 'min';
    }
  }

  static String intToDuration(int i, [Locale locale = const Locale('fr')]) {
    final m = i ~/ 60;
    final h = m ~/ 60;
    final hrs = h == 0 ? '' : '$h${_hs(locale)}';
    final string = (m % 60).toString();
    final mins = h != 0 ? string.padLeft(2, '0') : string;
    return "$hrs$mins${h == 0 ? " ${_mins(locale, m)}" : ""}";
  }

  static String time(DateTime? date, [Locale locale = const Locale('en')]) {
    if (date == null) return '';
    final min = date.minute < 10 ? '0${date.minute}' : date.minute.toString();
    return '${date.hour}:$min';
  }
}
