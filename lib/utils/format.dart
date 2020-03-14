import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Format {
  static Widget duration(Duration d) {
    final m = d.inMinutes;
    if(m>60) return const Text(">1 h");
    if(m == 0 ) return FaIcon(FontAwesomeIcons.bus);
    return Text("${m} m");
  }
}
