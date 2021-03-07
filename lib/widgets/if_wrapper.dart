import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

class IfWrapper extends StatelessWidget {
  const IfWrapper({
    Key? key,
    required this.condition,
    required this.builder,
    this.child,
    this.elseBuilder,
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

class PlatformBuilder extends StatefulWidget {
  const PlatformBuilder({
    Key? key,
    required this.cupertinoBuilder,
    required this.materialBuilder,
    this.child,
  }) : super(key: key);

  final Widget Function(BuildContext context, Widget? child) cupertinoBuilder;
  final Widget? child;
  final Widget Function(BuildContext context, Widget? child) materialBuilder;

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
  Widget build(BuildContext context) => isCupertino
      ? widget.cupertinoBuilder(context, widget.child)
      : widget.materialBuilder(context, widget.child);
}
