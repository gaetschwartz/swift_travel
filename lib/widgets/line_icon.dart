import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/db/models/cache.dart';
import 'package:swift_travel/utils/strings/format.dart';

class LineIcon extends StatelessWidget {
  factory LineIcon({
    required String? line,
    required String? background,
    required String? foreground,
    Color defaultBg = defaultBackground,
    Color defaultFg = defaultForeground,
    bool small = false,
    Key? key,
  }) =>
      LineIcon.raw(
        line: line,
        foreground: parseColor(foreground, defaultFg),
        background: parseColor(background, defaultBg),
        small: small,
        key: key,
      );

  const LineIcon.raw({
    required this.line,
    required this.foreground,
    required this.background,
    this.small = false,
    Key? key,
  }) : super(key: key);

  factory LineIcon.fromString({
    required String? line,
    required String colors,
    bool small = false,
    Key? key,
  }) {
    final i = colors.indexOf('~');
    final bg = colors.substring(0, i);
    final fg = colors.substring(i + 1, colors.lastIndexOf('~'));
    return LineIcon(
      line: line,
      foreground: fg,
      background: bg,
      small: small,
      key: key,
    );
  }

  factory LineIcon.fromLine(
    Line l, {
    bool small = false,
    Key? key,
  }) =>
      LineIcon.fromString(
        line: l.line,
        colors: l.colors,
        small: small,
        key: key,
      );

  factory LineIcon.fromLeg(
    Leg l, {
    bool small = false,
    Key? key,
  }) =>
      LineIcon(
        line: l.line,
        background: l.bgcolor,
        foreground: l.fgcolor,
        small: small,
        key: key,
      );

  static const defaultForeground = Color(0xfff0f0f0);
  static const defaultBackground = Color(0xff000000);
  static bool isValidLeg(Leg l) => l.line != null && l.fgcolor != null && l.bgcolor != null;

  final Color foreground;
  final Color background;
  final String? line;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: background.withOpacity(0.4), blurRadius: small ? 2 : 8)],
          borderRadius: BorderRadius.circular(32),
          color: background,
        ),
        child: Padding(
          padding: small
              ? const EdgeInsets.symmetric(vertical: 2, horizontal: 5)
              : const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Text(
            line ?? '',
            style: TextStyle(
              color: foreground,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            overflow: TextOverflow.visible,
          ),
        ));
  }
}
