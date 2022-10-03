import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

Color platformPrimaryColor(BuildContext context) => isThemeDarwin(context)
    ? CupertinoTheme.of(context).primaryColor
    : Theme.of(context).colorScheme.secondary;

extension ColorX on Color {
  Color operator *(double ratio) => Color.fromARGB(
        alpha,
        (red * ratio).round().clamp(0, 255),
        (green * ratio).round().clamp(0, 255),
        (blue * ratio).round().clamp(0, 255),
      );

  Color lighten([double ratio = 3 / 4]) => this * ratio;

  Color darken([double ratio = 5 / 4]) => this * ratio;

  Color augmentSquared() {
    final mean = (red + green + blue) / 3;

    int sgnOfSub(num a, num b) => a > b ? -1 : 1;

    return Color.fromARGB(
      alpha,
      (red + sgnOfSub(mean, red) * pow(red - mean, 2)).round().clamp(0, 255),
      (green + sgnOfSub(mean, green) * pow(green - mean, 2))
          .round()
          .clamp(0, 255),
      (blue + sgnOfSub(mean, blue) * pow(blue - mean, 2)).round().clamp(0, 255),
    );
  }

  Color augmentlinear([double strength = 0.1]) {
    if (strength < 0 || strength > 1) throw RangeError.range(strength, 0, 1);

    final factor =
        ((blue + red + green) / 3) > 127 ? 1 - strength : 1 + strength;
    return this * factor;
  }

  /// Blends this color with [other] with [ratio] being the ratio of [other] to this color.
  Color blend(Color other, [double ratio = 0.5]) => Color.fromARGB(
        alpha,
        (red * (1 - ratio) + other.red * ratio).round().clamp(0, 255),
        (green * (1 - ratio) + other.green * ratio).round().clamp(0, 255),
        (blue * (1 - ratio) + other.blue * ratio).round().clamp(0, 255),
      );
}

class GradientMask extends StatelessWidget {
  const GradientMask({required this.child, required this.gradient, Key? key})
      : super(key: key);
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
