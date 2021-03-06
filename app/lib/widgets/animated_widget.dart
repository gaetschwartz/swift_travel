import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

typedef AnimationBuilder = Widget Function(
    BuildContext context, Animation<double> animation, Widget child);

const _kDefaultAnimation = Duration(milliseconds: 300);
Duration _zeroDelay() => Duration.zero;

class InstantlyAnimatedWidget extends StatefulWidget {
  const InstantlyAnimatedWidget({
    required this.child,
    required this.builder,
    Key? key,
    this.duration = _kDefaultAnimation,
    this.delay = _zeroDelay,
    this.start = 0.0,
    this.end = 1.0,
  }) : super(key: key);

  factory InstantlyAnimatedWidget.fade({
    required Widget child,
    Duration duration = _kDefaultAnimation,
    Duration Function() delay = _zeroDelay,
  }) =>
      InstantlyAnimatedWidget(
        builder: fadeScale,
        duration: duration,
        delay: delay,
        child: child,
      );

  static AnimationBuilder get fadeScale => (context, animation, child) => FadeScaleTransition(
        animation: animation,
        child: child,
      );

  final Widget child;
  final Duration duration;
  final AnimationBuilder builder;
  final Duration Function() delay;
  final double start;
  final double end;

  @override
  _InstantlyAnimatedWidgetState createState() => _InstantlyAnimatedWidgetState();
}

class _InstantlyAnimatedWidgetState extends State<InstantlyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: widget.duration);

    final delay = widget.delay();
    if (delay > Duration.zero) {
      Future.delayed(delay, () {
        if (mounted) {
          controller.forward();
        }
      });
    } else {
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, controller, widget.child);
}
