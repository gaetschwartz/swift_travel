import 'package:flutter/material.dart';
import 'package:swift_travel/apis/search.ch/models/leg.dart';
import 'package:swift_travel/db/models/cache.dart';
import 'package:swift_travel/utils/string_utils/format.dart';

class LineIcon extends StatelessWidget {
  static const defaultForeground = Color(0xfff0f0f0);
  static const defaultBackground = Color(0xff000000);

  static bool isValidLeg(Leg l) => l.line != null && l.fgcolor != null && l.bgcolor != null;

  factory LineIcon({
    required String? line,
    required String background,
    required String foreground,
    bool small = false,
  }) =>
      LineIcon.raw(
        line: line,
        foreground: parseColor(foreground, defaultForeground),
        background: parseColor(background, defaultBackground),
        small: small,
      );

  const LineIcon.raw({
    required this.line,
    required this.foreground,
    required this.background,
    this.small = false,
  });

  factory LineIcon.fromString({required String? line, required String colors, bool small = false}) {
    final i = colors.indexOf('~');
    final bg = colors.substring(0, i);
    final fg = colors.substring(i + 1, colors.lastIndexOf('~'));
    return LineIcon(
      line: line,
      foreground: fg,
      background: bg,
      small: small,
    );
  }

  factory LineIcon.fromLine(Line l, {bool small = false}) => LineIcon.fromString(
        line: l.line,
        colors: l.colors,
        small: small,
      );

  factory LineIcon.fromLeg(Leg l, {bool small = false}) => LineIcon(
        line: l.line,
        background: ArgumentError.checkNotNull(l.bgcolor, 'leg.bgcolor'),
        foreground: ArgumentError.checkNotNull(l.fgcolor, 'leg.fgcolor'),
      );

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
