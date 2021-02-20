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
  Widget transitionBuilder(BuildContext context, Animation<double> a1,
          Animation<double> a2, Widget child) =>
      SharedAxisTransition(
        animation: a1,
        secondaryAnimation: a2,
        transitionType: SharedAxisTransitionType.scaled,
        fillColor: Colors.transparent,
        child: child,
      );
}
