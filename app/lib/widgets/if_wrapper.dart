// ignore_for_file: avoid-non-null-assertion

import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

class IfWrapper extends StatelessWidget {
  const IfWrapper({
    required this.condition,
    required this.builder,
    required this.child,
    this.elseBuilder,
    Key? key,
  }) : super(key: key);

  final bool condition;
  final Widget? child;
  final Widget Function(BuildContext context, Widget? child) builder;
  final Widget Function(BuildContext context, Widget? child)? elseBuilder;

  @override
  Widget build(BuildContext context) => condition
      ? builder(context, child)
      : elseBuilder != null
          ? elseBuilder!.call(context, child)
          : child!;
}

enum PlatformDesign {
  cupertino,
  material,
}

class PlatformBuilder extends StatelessWidget {
  const PlatformBuilder({
    required this.cupertinoBuilder,
    required this.materialBuilder,
    this.child,
    this.builder,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final Widget Function(BuildContext context, Widget? child) cupertinoBuilder;
  final Widget Function(BuildContext context, Widget? child) materialBuilder;
  final Widget Function(BuildContext context, PlatformDesign design)? builder;

  @override
  Widget build(BuildContext context) {
    final isCupertino = isThemeDarwin(context);
    final c = child ??
        builder?.call(
          context,
          isCupertino ? PlatformDesign.cupertino : PlatformDesign.material,
        );
    return isCupertino
        ? cupertinoBuilder(context, c)
        : materialBuilder(context, c);
  }
}
