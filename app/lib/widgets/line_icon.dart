import 'package:flutter/material.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/db/models/cache.dart';
import 'package:swift_travel/utils/strings/format.dart';

class LineIcon extends StatelessWidget {
  const LineIcon.raw({
    required this.line,
    required Color? foreground,
    required Color? background,
    Color defaultBg = defaultBackground,
    Color defaultFg = defaultForeground,
    this.small = false,
    Key? key,
  })  : foreground = foreground ?? defaultFg,
        background = background ?? defaultBg,
        super(key: key);

  factory LineIcon.fromString({
    required String? line,
    required String colors,
    Color defaultBg = defaultBackground,
    Color defaultFg = defaultForeground,
    bool small = false,
    Key? key,
  }) {
    final i = colors.indexOf('~');
    final bg = colors.substring(0, i);
    final fg = colors.substring(i + 1, colors.lastIndexOf('~'));
    return LineIcon.raw(
      line: line,
      foreground: parseColor(fg, defaultFg),
      background: parseColor(bg, defaultBg),
      small: small,
      key: key,
    );
  }

  factory LineIcon.fromLine(
    Line l, {
    bool small = false,
    Key? key,
  }) =>
      LineIcon.raw(
        line: l.line,
        background: l.bgColor == null ? null : Color(l.bgColor!),
        foreground: l.fgColor == null ? null : Color(l.fgColor!),
        small: small,
        key: key,
      );

  factory LineIcon.fromLeg(
    Leg l, {
    bool small = false,
    Key? key,
  }) =>
      LineIcon.raw(
        line: l.line,
        background: l.bgColor,
        foreground: l.fgColor,
        small: small,
        key: key,
      );

  static const defaultForeground = Color(0xfff0f0f0);
  static const defaultBackground = Color(0xff000000);
  static bool isValidLeg(Leg l) =>
      l.line != null && l.fgColor != null && l.bgColor != null;

  final Color foreground;
  final Color background;
  final String? line;
  final bool small;

  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: background.withOpacity(0.4), blurRadius: small ? 2 : 8)
        ],
        borderRadius: const BorderRadius.all(Radius.circular(32)),
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

Color parseColor(String? s, Color defaultColor) {
  final c = parseColorInt(s);
  return c == null ? defaultColor : Color(c);
}
