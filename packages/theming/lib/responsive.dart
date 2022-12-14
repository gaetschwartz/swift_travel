/// A library for responsive design.
library responsive;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

bool isThemeDarwin(BuildContext context) => Theme.of(context).platform.isDarwin;
bool isPlatformDarwin(TargetPlatform p) => p.isDarwin;

bool get isMobile => !kIsWeb && (Platform.isIOS || Platform.isAndroid);

enum ScreenSize {
  small,
  medium,
  large;

  bool operator <(ScreenSize s) => index < s.index;

  bool operator <=(ScreenSize s) => index <= s.index;

  bool operator >(ScreenSize s) => index > s.index;

  bool operator >=(ScreenSize s) => index >= s.index;
}

@immutable
class DoubleInterval {
  const DoubleInterval(this.low, this.high);

  final double low;
  final double high;

  static double Function(double a) lerp(
    DoubleInterval from,
    DoubleInterval to,
  ) =>
      (a) {
        return (to.low +
                (a - from.low) * (to.high - to.low) / (from.high - from.low))
            .clamp(to.low, to.high);
      };
}

class Responsive {
  const Responsive(this.smallScreenWidth, this.bigScreenWidth);

  static const default_ = Responsive(400, 1200);

  final double smallScreenWidth;
  final double bigScreenWidth;

  bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide < smallScreenWidth;

  bool isMediumScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.shortestSide >= smallScreenWidth &&
        size.shortestSide <= bigScreenWidth;
  }

  bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide > bigScreenWidth;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= smallScreenWidth;

  Size sizeOf(BuildContext context) => MediaQuery.of(context).size;

  bool isSmall(BoxConstraints c) => c.maxWidth < smallScreenWidth;
  bool isLarge(BoxConstraints c) => c.maxWidth > bigScreenWidth;
  bool isMedium(BoxConstraints c) =>
      c.maxWidth >= smallScreenWidth && c.maxWidth <= bigScreenWidth;

  ScreenSize getScreenSize(BuildContext context) =>
      getSizeOfWidth(MediaQuery.of(context).size.shortestSide);

  ScreenSize getSizeOfWidth(double width) {
    if (width > bigScreenWidth) {
      return ScreenSize.large;
    } else if (width > smallScreenWidth) {
      return ScreenSize.medium;
    } else if (width > 0) {
      return ScreenSize.small;
    } else {
      throw ArgumentError.value(width, 'width', 'must be positive');
    }
  }
}

extension TargetPlatformX on TargetPlatform {
  bool get isDarwin =>
      this == TargetPlatform.iOS || this == TargetPlatform.macOS;
}

extension ThemeDataX on ThemeData {
  bool get isDarwin => platform.isDarwin;
}
