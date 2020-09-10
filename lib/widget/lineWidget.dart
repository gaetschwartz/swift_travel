import 'package:flutter/material.dart';
import 'package:travel_free/utils/format.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({
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
            borderRadius: BorderRadius.circular(12),
            color: Color(colorFromString(background) ?? 0xff000000)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: Text(
            line,
            style: TextStyle(
              color: Color(colorFromString(foreground) ?? 0xfff0f0f0),
            ),
          ),
        ));
  }
}
