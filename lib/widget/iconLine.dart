import 'package:flutter/material.dart';
import 'package:travel_free/utils/format.dart';

class IconLine extends StatelessWidget {
  final String bgColor;
  final String text;
  final String colorText;

  const IconLine({Key key, this.bgColor, this.text, this.colorText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(colorFromString(bgColor) ?? 0xff000000)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
        child: Text(
          text,
          style: TextStyle(
              color: colorText != null
                  ? Color(colorFromString(colorText))
                  : Colors.white),
        ),
      ),
    );
  }
}
