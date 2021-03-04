import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

@immutable
class SharedAxisConfiguration extends ModalConfiguration {
  const SharedAxisConfiguration({
    Color barrierColor = Colors.black54,
    Duration transitionDuration = const Duration(milliseconds: 150),
    Duration reverseTransitionDuration = const Duration(milliseconds: 75),
    String barrierLabel = 'Dismiss',
  }) : super(
          barrierDismissible: true,
          transitionDuration: transitionDuration,
          reverseTransitionDuration: reverseTransitionDuration,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
        );

  @override
  Widget transitionBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SharedAxisTransition(
        animation: animation,
        secondaryAnimation: secondaryAnimation,
        transitionType: SharedAxisTransitionType.scaled,
        fillColor: Colors.transparent,
        child: child,
      );
}
