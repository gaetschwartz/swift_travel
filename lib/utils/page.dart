import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleWidgetPage<T> extends Page<T> {
  const SingleWidgetPage(
    this.child, {
    String name = '',
    this.title,
  }) : super(name: name);

  final Widget child;
  final String? title;

  @override
  Route<T> createRoute(BuildContext context) {
    return CupertinoPageBuilder<T>(
      builder: (context) => child,
      settings: this,
      title: title,
    );
  }
}

class CupertinoPageBuilder<T> extends PageRoute<T> with CupertinoRouteTransitionMixin<T> {
  CupertinoPageBuilder({
    required this.builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
    this.title = '',
    this.maintainState = true,
  }) : super(
          fullscreenDialog: fullscreenDialog,
          settings: settings,
        );

  final Widget Function(BuildContext) builder;
  @override
  final String? title;
  @override
  final bool maintainState;

  @override
  Widget buildContent(BuildContext context) => builder(context);
}
