import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

@immutable
class BottomSheetConfiguration extends ModalConfiguration {
  const BottomSheetConfiguration({
    Color barrierColor = Colors.black54,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
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
      BuildContext context, Animation<double> a1, Animation<double> a2, Widget child) {
    return AlignTransition(
      alignment: Tween<AlignmentGeometry>(begin: const Alignment(0, 2), end: Alignment.bottomCenter)
          .animate(CurvedAnimation(curve: Curves.fastOutSlowIn, parent: a1)),
      child: child,
    );
  }
}
