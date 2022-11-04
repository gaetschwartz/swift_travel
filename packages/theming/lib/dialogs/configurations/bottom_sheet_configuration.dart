import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

@immutable
class BottomSheetConfiguration extends ModalConfiguration {
  const BottomSheetConfiguration({
    super.barrierColor = Colors.black54,
    super.transitionDuration = const Duration(milliseconds: 300),
    super.reverseTransitionDuration = const Duration(milliseconds: 300),
    String super.barrierLabel = 'Dismiss',
  }) : super(
          barrierDismissible: true,
        );

  @override
  Widget transitionBuilder(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      AlignTransition(
        alignment:
            Tween<AlignmentGeometry>(begin: const Alignment(0, 2), end: Alignment.bottomCenter)
                .animate(CurvedAnimation(curve: Curves.fastOutSlowIn, parent: animation)),
        child: child,
      );
}
