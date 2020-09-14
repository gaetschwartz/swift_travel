import 'package:flutter/material.dart';
import 'package:swiss_travel/utils/format.dart';

class LineIcon extends StatelessWidget {
  const LineIcon({
    Key key,
    @required this.foreground,
    @required this.background,
    @required this.line,
  }) : super(key: key);

  final String foreground;
  final String background;
  final String line;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(colorFromString(background) ?? 0xff000000)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Text(
            line ?? "???",
            style: TextStyle(
              color: Color(colorFromString(foreground) ?? 0xfff0f0f0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
