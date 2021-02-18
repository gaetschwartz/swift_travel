import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlurryModalRoute<T> extends ModalRoute<T> {
  @override
  final Color barrierColor;

  @override
  final bool barrierDismissible;

  @override
  final String barrierLabel;

  @override
  final Duration transitionDuration;

  final Widget child;

  @override
  bool maintainState = false;

  @override
  bool opaque = false;

  BlurryModalRoute(
    this.child, {
    this.transitionDuration = const Duration(milliseconds: 300),
    this.barrierColor = Colors.transparent,
    this.barrierDismissible = true,
    this.barrierLabel = '',
  });

  @override
  Widget buildPage(BuildContext context, Animation<double> a1, Animation<double> a2) {
    return AnimatedBuilder(
      animation: a1,
      builder: (context, child) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: a1.value * 10, sigmaY: a1.value * 10),
        child: Opacity(
          opacity: a1.value,
          child: child,
        ),
      ),
      child: child,
    );
  }
}
