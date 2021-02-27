import 'dart:convert';
import 'dart:math' as math;

import 'package:swift_travel/utils/predict/predict.dart';

class LV03ToWGS84Converter extends Converter<Pair<int, int>, Pair<double, double>> {
  @override
  Pair<double, double> convert(Pair<int, int> input) {
    final x = (input.first - 200000) / 1000000;
    final y = (input.second - 600000) / 1000000;

    final x2 = math.pow(x, 2);

    final lambdaP =
        2.6779094 + 4.728982 * y + 0.791484 * y * x + 0.1306 * y * x2 - 0.0436 * math.pow(y, 3);

    final y2 = math.pow(y, 2);

    final phiP = 16.9023892 +
        3.238272 * x -
        0.270978 * y2 -
        0.002528 * x2 -
        0.0447 * math.pow(y, 2) * x -
        0.0140 * math.pow(x, 3);

    const f = 100 / 36;

    final phi = phiP * f;
    final lambda = lambdaP * f;

    return Pair(lambda, phi);
  }

  static const hCH = 600;
}
