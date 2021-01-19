import 'package:flutter/material.dart';
import 'package:swift_travel/utils/format.dart';

class LineIcon extends StatelessWidget {
  const LineIcon({
    Key key,
    @required this.foreground,
    @required this.background,
    @required this.line,
  }) : super(key: key);

  LineIcon.fromString({this.line, String colors})
      : background = colors.substring(0, colors.indexOf('~')),
        foreground = colors.substring(colors.indexOf('~') + 1, colors.lastIndexOf('~'));

  final String foreground;
  final String background;
  final String line;

  @override
  Widget build(BuildContext context) {
    final color = parseColor(background, const Color(0xff000000));
    return DecoratedBox(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: color.withOpacity(0.4), blurRadius: 8)],
            borderRadius: BorderRadius.circular(32),
            color: color),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Text(
            line ?? '???',
            style: TextStyle(
              color: parseColor(foreground, const Color(0xfff0f0f0)),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ));
  }
}
