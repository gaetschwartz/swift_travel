import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

Color lighten(Color c) =>
    Color.fromARGB(c.alpha, c.red * 3 ~/ 4, c.green * 3 ~/ 4, c.blue * 3 ~/ 4);

int _sgnOfSub(num a, num b) => a > b ? -1 : 1;

Color augment(Color c) {
  final std = sqrt((pow(c.red, 2) + pow(c.green, 2) + pow(c.blue, 2)) / 3);
  final total = std;
  const factor = 1 / 2;
  return Color.fromARGB(
    c.alpha,
    (c.red + _sgnOfSub(total, c.red) * pow(c.red - total, 2) * factor).toInt().clamp(0, 255),
    (c.green + _sgnOfSub(total, c.green) * pow(c.green - total, 2) * factor).toInt().clamp(0, 255),
    (c.blue + _sgnOfSub(total, c.blue) * pow(c.blue - total, 2) * factor).toInt().clamp(0, 255),
  );
}

class GradientMask extends StatelessWidget {
  const GradientMask({required this.child, required this.gradient});
  final Widget child;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn, // Add this
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: child,
    );
  }
}
