import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

@immutable
class SharedAxisConfiguration extends ModalConfiguration {
  const SharedAxisConfiguration({
    super.barrierColor = Colors.black54,
    super.transitionDuration = const Duration(milliseconds: 150),
    super.reverseTransitionDuration = const Duration(milliseconds: 75),
    String super.barrierLabel = 'Dismiss',
  }) : super(
          barrierDismissible: true,
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
