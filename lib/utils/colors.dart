import 'dart:math';
import 'dart:ui';

Color lighten(Color c) {
  return Color.fromARGB(c.alpha, c.red * 3 ~/ 4, c.green * 3 ~/ 4, c.blue * 3 ~/ 4);
}

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
