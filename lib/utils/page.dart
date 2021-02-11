import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleWidgetPage extends Page {
  final Widget child;
  final String? title;

  const SingleWidgetPage(
    this.child, {
    String name = '',
    this.title,
  }) : super(name: name);

  @override
  Route createRoute(BuildContext context) {
    return CupertinoPageBuilder(
      builder: (context) => child,
      settings: this,
      title: title,
    );
  }
}

class CupertinoPageBuilder extends PageRoute with CupertinoRouteTransitionMixin {
  final Widget Function(BuildContext) builder;
  @override
  final String? title;
  @override
  final bool maintainState;

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

  @override
  Widget buildContent(BuildContext context) {
    return builder(context);
  }
}
