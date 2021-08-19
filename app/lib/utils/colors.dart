import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

Color primaryColor(BuildContext context) => isDarwin(context)
    ? CupertinoTheme.of(context).primaryColor
    : Theme.of(context).colorScheme.secondary;

Color lighten(Color c) =>
    Color.fromARGB(c.alpha, c.red * 3 ~/ 4, c.green * 3 ~/ 4, c.blue * 3 ~/ 4);

int _sgnOfSub(num a, num b) => a > b ? -1 : 1;

Color augment(Color c) {
  final std = sqrt(pow(c.red, 2) + pow(c.green, 2) + pow(c.blue, 2));
  final total = std;
  const factor = 1;
  return Color.fromARGB(
    c.alpha,
    (c.red + _sgnOfSub(total, c.red) * pow(c.red - total, 2) * factor).toInt().clamp(0, 255),
    (c.green + _sgnOfSub(total, c.green) * pow(c.green - total, 2) * factor).toInt().clamp(0, 255),
    (c.blue + _sgnOfSub(total, c.blue) * pow(c.blue - total, 2) * factor).toInt().clamp(0, 255),
  );
}

Color augment2(Color c, {double strength = 0.1}) {
  final avg = (c.blue + c.red + c.green) / 3;
  // ignore: binary-expression-operand-order
  final factor = avg > 127 ? 1 - strength : 1 + strength;
  return Color.fromARGB(
    c.alpha,
    (c.red * factor).round().clamp(0, 255),
    (c.green * factor).round().clamp(0, 255),
    (c.blue * factor).round().clamp(0, 255),
  );
}

class GradientMask extends StatelessWidget {
  const GradientMask({required this.child, required this.gradient, Key? key}) : super(key: key);
  final Widget child;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) => kIsWeb
      ? IconTheme(
          data: IconThemeData(color: gradient.colors.first),
          child: child,
        )
      : IconTheme(
          data: const IconThemeData(color: Colors.black),
          child: ShaderMask(
            blendMode: BlendMode.srcIn, // Add this
            shaderCallback: gradient.createShader,
            child: child,
          ),
        );
}
