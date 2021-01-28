import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleWidgetPage extends Page {
  final Widget child;
  final String title;

  const SingleWidgetPage(
    this.child, {
    String name = '',
    this.title,
  }) : super(name: name);

  @override
  Route createRoute(BuildContext context) {
    return PlatformPageRoute(
      builder: (context) => child,
      settings: this,
      title: title,
    );
  }
}

class PlatformPageRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T>
    implements MaterialRouteTransitionMixin<T> {
  /// Construct a MaterialPageRoute whose contents are defined by [builder].
  ///
  /// The values of [builder], [maintainState], and [PageRoute.fullscreenDialog]
  /// must not be null.
  PlatformPageRoute({
    this.title,
    @required this.builder,
    RouteSettings settings,
    this.maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(settings: settings, fullscreenDialog: fullscreenDialog) {
    assert(opaque);
  }

  final WidgetBuilder builder;

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  final bool maintainState;

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';

  @override
  final String title;
}
