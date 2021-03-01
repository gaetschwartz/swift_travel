import 'dart:convert';
import 'dart:math' as math;

import 'models/coordinates.dart';

final lv03ToWGS84Converter = LV03ToWGS84Converter();

/// Converts LV03 coordinates from the swiss coordinates system to regular GPS coordinates (WGS84).
/// This method is the approximate version which far more than enough for our usage.
///
/// See https://www.swisstopo.admin.ch/en/knowledge-facts/surveying-geodesy/reference-systems/switzerland.html
class LV03ToWGS84Converter extends Converter<LV03Coordinates, LatLon> {
  @override
  LatLon convert(LV03Coordinates input) {
    final x = (input.x - 2e5) / 1e6;
    final y = (input.y - 6e5) / 1e6;

    final x2 = math.pow(x, 2);

    final lambdaP =
        2.6779094 + 4.728982 * y + 0.791484 * y * x + 0.1306 * y * x2 - 0.0436 * math.pow(y, 3);

    final y2 = math.pow(y, 2);

    final phiP = 16.9023892 +
        3.238272 * x -
        0.270978 * y2 -
        0.002528 * x2 -
        0.0447 * y2 * x -
        0.0140 * math.pow(x, 3);

    const f = 100 / 36;

    final phi = phiP * f;
    final lambda = lambdaP * f;

    return LatLon(lambda, phi);
  }

  static const hCH = 600;
}
