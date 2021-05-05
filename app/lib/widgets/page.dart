import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/widgets/route.dart';

class SingleWidgetPage<T extends Object?> extends Page<T> {
  const SingleWidgetPage(
    this.child, {
    String name = '',
    this.title,
  }) : super(name: name);

  final Widget child;
  final String? title;

  @override
  Route<T> createRoute(BuildContext context) => PlatformPageRoute<T>(
        builder: (context) => child,
        settings: this,
        title: title,
      );
}
