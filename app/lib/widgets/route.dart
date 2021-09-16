import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PlatformPageRoute<T extends Object?> extends MaterialWithModalsPageRoute<T>
    with PlatformRouteTitleMixin {
  PlatformPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    this.title,
  }) : super(
            settings: settings,
            fullscreenDialog: fullscreenDialog,
            builder: builder,
            maintainState: maintainState);

  @override
  final String? title;
}

mixin PlatformRouteTitleMixin<T> on PageRoute<T> {
  String? get title;

  ValueNotifier<String?>? _previousTitle;

  ValueListenable<String?> get previousTitle {
    assert(
      _previousTitle != null,
      'Cannot read the previousTitle for a route that has not yet been installed',
    );
    return _previousTitle!;
  }

  @override
  void didChangePrevious(Route<dynamic>? previousRoute) {
    final String? previousTitleString;
    if (previousRoute is CupertinoRouteTransitionMixin) {
      previousTitleString = previousRoute.title;
    } else if (previousRoute is PlatformRouteTitleMixin) {
      previousTitleString = previousRoute.title;
    } else {
      previousTitleString = null;
    }

    if (_previousTitle == null) {
      _previousTitle = ValueNotifier<String?>(previousTitleString);
    } else {
      _previousTitle!.value = previousTitleString;
    }
    super.didChangePrevious(previousRoute);
  }

  static String? getPreviousTitleOf(BuildContext context) {
    final route = ModalRoute.of(context);
    // log.log('Current route is a ${route.runtimeType}');
    if (route == null || route.isFirst) {
      return null;
    }

    if (route is PlatformRouteTitleMixin) {
      return route.previousTitle.value;
    }
    if (route is CupertinoRouteTransitionMixin) {
      return route.previousTitle.value;
    }
  }

  static String? getPageTitleOf(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route == null) {
      return null;
    }

    if (route is PlatformRouteTitleMixin) {
      return route.title;
    }
    if (route is CupertinoRouteTransitionMixin) {
      return route.title;
    }
  }
}
