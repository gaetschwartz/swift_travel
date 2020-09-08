import 'dart:developer';

int colorFromString(String s) {
  if (s.length == 3) {
    return int.parse("ff${s[0]}0${s[1]}0${s[2]}0", radix: 16);
  } else if (s.length == 6) {
    return int.parse("ff$s", radix: 16);
  } else if (s.isEmpty) {
    return null;
  } else {
    log("", error: "Unknown color code : `$s`");
    return null;
  }
}

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
    final m = i ~/ 60;
    final h = m ~/ 60;
    final hrs = h == 0 ? "" : "${h}h";
    final mins = (m % 60).toString().padLeft(2, "0");
    return "$hrs$mins${h == 0 ? " m" : ""}";
  }

  static String dateToHour(DateTime arrival) {
    final String min = arrival.minute < 10 ? "0${arrival.minute}" : arrival.minute.toString();
    return "${arrival.hour}:$min";
  }
}
