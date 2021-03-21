import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef AnimatedWidgetBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Widget child,
);

// ignore_for_file: prefer_function_declarations_over_variables
class Animations {
  const Animations._();

  static AnimatedWidgetBuilder fadeScale({Alignment? alignment}) => (
        context,
        animation,
        child,
      ) =>
          Opacity(
            opacity: animation.value,
            child: Transform.scale(
              scale: (animation.value + 19) / 20,
              alignment: alignment,
              child: child,
            ),
          );

  static AnimatedWidgetBuilder fade({int animationPortion = 20}) => (
        context,
        animation,
        child,
      ) =>
          Opacity(
              opacity: (animation.value + animationPortion - 1) / animationPortion, child: child);
}

class AnimateOnInitWidget extends StatefulWidget {
  const AnimateOnInitWidget({
    required this.child,
    required this.builder,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.linear,
    this.delay = const Duration(milliseconds: 300),
    this.onEnd,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final Duration delay;
  final VoidCallback? onEnd;
  final Curve curve;
  final Widget Function(
    BuildContext context,
    Animation<double>? animation,
    Widget? child,
  ) builder;

  @override
  _AnimateOnInitWidgetState createState() => _AnimateOnInitWidgetState();
}

class _AnimateOnInitWidgetState extends State<AnimateOnInitWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  CurvedAnimation? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onEnd?.call();
        }
      });

    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    Future.delayed(widget.delay, _controller.forward);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animation!,
        builder: (context, child) => widget.builder(context, _animation, child),
        child: widget.child,
      );
}
