import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlurryModalRoute<T> extends ModalRoute<T> {
  BlurryModalRoute(
    this.child, {
    this.transitionDuration = const Duration(milliseconds: 300),
    this.barrierColor = Colors.transparent,
    this.barrierDismissible = true,
    this.barrierLabel = '',
  });

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

  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: animation.value * 10, sigmaY: animation.value * 10),
        child: Opacity(
          opacity: animation.value,
          child: child,
        ),
      ),
      child: child,
    );
  }
}
