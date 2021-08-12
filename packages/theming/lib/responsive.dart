library responsive;

import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum ScreenSize { small, medium, large }

bool isDarwin(BuildContext context) => Theme.of(context).platform.isDarwin;
bool isPlatformDarwin(TargetPlatform p) => p.isDarwin;

bool get isMobile => !kIsWeb && (Platform.isIOS || Platform.isAndroid);

extension ScreenSizeX on ScreenSize {
  bool operator <(ScreenSize s) => index < s.index;

  bool operator <=(ScreenSize s) => index <= s.index;

  bool operator >(ScreenSize s) => index > s.index;

  bool operator >=(ScreenSize s) => index >= s.index;
}

@immutable
class DoubleInterval<T extends num> {
  const DoubleInterval(this.low, this.high);

  final T low;
  final T high;

  static double Function(double a) lerp(
    DoubleInterval from,
    DoubleInterval to,
  ) =>
      (a) => min(
            to.high,
            max(
              to.low,
              (a - from.low) * (to.high - to.low) / (from.high - from.low) + to.low,
            ),
          ).toDouble();
}

class Responsive {
  const Responsive(this.smallScreenWidth, this.bigScreenWidth);

  const Responsive.def()
      : smallScreenWidth = 400,
        bigScreenWidth = 1200;

  final double smallScreenWidth;
  final double bigScreenWidth;

  bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide < smallScreenWidth;
  bool isMediumScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.shortestSide >= smallScreenWidth && size.shortestSide <= bigScreenWidth;
  }

  bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide > bigScreenWidth;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= smallScreenWidth;

  Size sizeOf(BuildContext context) => MediaQuery.of(context).size;

  bool isSmall(BoxConstraints c) => c.maxWidth < smallScreenWidth;
  bool isLarge(BoxConstraints c) => c.maxWidth > bigScreenWidth;
  bool isMedium(BoxConstraints c) => c.maxWidth >= smallScreenWidth && c.maxWidth <= bigScreenWidth;

  ScreenSize getScreenSize(BuildContext context) =>
      getSizeOfWidth(MediaQuery.of(context).size.shortestSide);

  ScreenSize getSizeOfWidth(double width) {
    if (width > bigScreenWidth) {
      return ScreenSize.large;
    } else if (width < smallScreenWidth) {
      return ScreenSize.small;
    } else {
      return ScreenSize.medium;
    }
  }
}

extension TargetPlatformX on TargetPlatform {
  bool get isDarwin => this == TargetPlatform.iOS || this == TargetPlatform.macOS;
}
