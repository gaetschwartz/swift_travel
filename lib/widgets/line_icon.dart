import 'package:flutter/material.dart';
import 'package:swift_travel/tabs/stations/completion_tile.dart';
import 'package:swift_travel/utils/format.dart';

class LineIcon extends StatelessWidget {
  const LineIcon({
    Key key,
    @required this.foreground,
    @required this.background,
    @required this.line,
    this.small = false,
  }) : super(key: key);

  LineIcon.fromString({@required this.line, @required String colors, this.small = false})
      : background = _computeBackground(colors),
        foreground = _computeForeground(colors);

  static String _computeBackground(String colors) => colors.substring(0, colors.indexOf('~'));
  static String _computeForeground(String colors) =>
      colors.substring(colors.indexOf('~') + 1, colors.lastIndexOf('~'));

  LineIcon.fromLine(Line l, {this.small = false})
      : background = _computeBackground(l.colors),
        foreground = _computeForeground(l.colors),
        line = l.line;

  final String foreground;
  final String background;
  final String line;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final color = parseColor(background, const Color(0xff000000));
    return DecoratedBox(
        decoration: BoxDecoration(boxShadow: [
          if (small)
            BoxShadow(color: color.withOpacity(0.4), blurRadius: 2)
          else
            BoxShadow(color: color.withOpacity(0.4), blurRadius: 8)
        ], borderRadius: BorderRadius.circular(32), color: color),
        child: Padding(
          padding: small
              ? const EdgeInsets.symmetric(vertical: 2, horizontal: 5)
              : const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Text(
            line ?? '',
            style: TextStyle(
              color: parseColor(foreground, const Color(0xfff0f0f0)),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            overflow: TextOverflow.visible,
          ),
        ));
  }
}
