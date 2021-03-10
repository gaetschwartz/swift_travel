import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PlatformRoute<T extends Object?> extends MaterialWithModalsPageRoute<T> {
  PlatformRoute({
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

  final String? title;

  ValueNotifier<String?>? _previousTitle;

  /// The title string of the previous [CupertinoPageRoute].
  ///
  /// The [ValueListenable]'s value is readable after the route is installed
  /// onto a [Navigator]. The [ValueListenable] will also notify its listeners
  /// if the value changes (such as by replacing the previous route).
  ///
  /// The [ValueListenable] itself will be null before the route is installed.
  /// Its content value will be null if the previous route has no title or
  /// is not a [CupertinoPageRoute].
  ///
  /// See also:
  ///
  ///  * [ValueListenableBuilder], which can be used to listen and rebuild
  ///    widgets based on a ValueListenable.
  ValueListenable<String?> get previousTitle {
    assert(
      _previousTitle != null,
      'Cannot read the previousTitle for a route that has not yet been installed',
    );
    return _previousTitle!;
  }

  @override
  void didChangePrevious(Route<dynamic>? previousRoute) {
    late final String? previousTitleString;
    if (previousRoute is CupertinoRouteTransitionMixin) {
      previousTitleString = previousRoute.title;
    } else if (previousRoute is PlatformRoute) {
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

  static String? getPreviousTitle(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route is PlatformRoute && route.isFirst) {
      return route.previousTitle.value;
    }
  }
}
