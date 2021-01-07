import 'package:flutter/material.dart';

class SinglePageNavigator extends Page {
  final Widget child;

  const SinglePageNavigator(this.child, {String name = 'myPage'}) : super(name: name);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(pageBuilder: (context, a1, a2) => child, settings: this);
  }
}
