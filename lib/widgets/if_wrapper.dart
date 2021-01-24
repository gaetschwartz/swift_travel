import 'package:flutter/material.dart';

class IfWrapper extends StatelessWidget {
  final bool condition;

  final Widget Function(BuildContext context, Widget child) builder;
  final Widget child;
  final Widget Function(BuildContext context, Widget child) ifFalseWrapper;

  const IfWrapper({
    Key key,
    @required this.condition,
    @required this.builder,
    @required this.child,
    this.ifFalseWrapper,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => condition
      ? builder(context, child)
      : ifFalseWrapper != null
          ? ifFalseWrapper(context, child)
          : child;
}
