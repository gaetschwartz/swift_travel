import 'package:flutter/material.dart';

class SingleWidgetPage extends Page {
  final Widget child;

  const SingleWidgetPage(this.child, {String name = ''}) : super(name: name);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(pageBuilder: (context, a1, a2) => child, settings: this);
  }
}
