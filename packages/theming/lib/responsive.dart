import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const darwinPlatforms = [TargetPlatform.iOS, TargetPlatform.macOS];

enum ScreenSize { small, medium, large }

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
  Responsive._();

  static const smallScreenWidth = 600;
  static const bigScreenWidth = 1000;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide < smallScreenWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= smallScreenWidth;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide > bigScreenWidth;

  static bool isMediumScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.shortestSide >= smallScreenWidth && size.shortestSide <= bigScreenWidth;
  }

  static Size sizeOf(BuildContext context) => MediaQuery.of(context).size;

  static bool isSmall(BoxConstraints c) => c.maxWidth < smallScreenWidth;

  static bool isLarge(BoxConstraints c) => c.maxWidth > bigScreenWidth;

  static bool isMedium(BoxConstraints c) =>
      c.maxWidth >= smallScreenWidth && c.maxWidth <= bigScreenWidth;

  static ScreenSize getScreenSize(BuildContext context) =>
      getSizeOfWidth(MediaQuery.of(context).size.shortestSide);

  static ScreenSize getSizeOfWidth(double width) {
    if (width > bigScreenWidth) {
      return ScreenSize.large;
    } else if (width < smallScreenWidth) {
      return ScreenSize.small;
    } else {
      return ScreenSize.medium;
    }
  }

  static bool isDarwin(BuildContext context) {
    final platform = Theme.of(context).platform;
    return _isDarwin(platform);
  }

  static bool _isDarwin(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.windows:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return true;
    }
  }

  static bool isPlatformDarwin(TargetPlatform p) => _isDarwin(p);
  static bool isDeviceDarwin() => !kIsWeb && (Platform.isIOS || Platform.isMacOS);

  static bool isMobile() => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
}
