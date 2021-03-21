import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

class IfWrapper extends StatelessWidget {
  const IfWrapper({
    required this.condition,
    required this.builder,
    this.child,
    this.elseBuilder,
    Key? key,
  }) : super(key: key);

  final bool condition;
  final Widget Function(BuildContext context, Widget? child) builder;
  final Widget? child;
  final Widget Function(BuildContext context, Widget? child)? elseBuilder;

  @override
  Widget build(BuildContext context) => condition
      ? builder(context, child)
      : elseBuilder != null
          ? elseBuilder!(context, child)
          : child!;
}

enum PlatformDesign {
  cupertino,
  material,
}

class PlatformBuilder extends StatefulWidget {
  const PlatformBuilder({
    required this.cupertinoBuilder,
    required this.materialBuilder,
    this.child,
    this.builder,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, Widget? child) cupertinoBuilder;
  final Widget? child;
  final Widget Function(BuildContext context, Widget? child) materialBuilder;
  final Widget Function(BuildContext context, PlatformDesign design)? builder;

  @override
  _PlatformBuilderState createState() => _PlatformBuilderState();
}

class _PlatformBuilderState extends State<PlatformBuilder> {
  late bool isCupertino;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isCupertino = Responsive.isDarwin(context);
  }

  @override
  Widget build(BuildContext context) {
    final child = widget.child ??
        widget.builder?.call(
          context,
          isCupertino ? PlatformDesign.cupertino : PlatformDesign.material,
        );
    return isCupertino
        ? widget.cupertinoBuilder(context, child)
        : widget.materialBuilder(context, child);
  }
}
