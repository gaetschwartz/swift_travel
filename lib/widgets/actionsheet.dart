import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/utils/no_splash.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/responsive.dart';

Future<T> showActionSheet<T>(BuildContext context, List<ActionsSheetAction> actions) =>
    showCupertinoModalBottomSheet<T>(
      context: context,
      expand: false,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      duration: const Duration(milliseconds: 300),
      builder: (context) => ActionsSheet(actions: actions),
    );

@immutable
class ActionsSheetAction {
  final Widget title;
  final VoidCallback onTap;
  final Widget icon;

  const ActionsSheetAction({@required this.title, this.onTap, this.icon});
}

class ActionsSheet extends StatelessWidget {
  const ActionsSheet({
    Key key,
    @required this.actions,
  }) : super(key: key);

  final List<ActionsSheetAction> actions;

  @override
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);

    return IfWrapper(
      condition: isDarwin,
      builder: (context, child) => Theme(
        data: ThemeData(splashFactory: const NoSplashFactory()),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: child,
        ),
      ),
      child: Material(
        color: isDarwin ? Theme.of(context).dialogBackgroundColor.withOpacity(0.8) : null,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (var a in actions) ...[
                ListTile(
                  leading: isDarwin
                      ? IconTheme(
                          data: IconThemeData(color: CupertinoTheme.of(context).primaryColor),
                          child: a.icon,
                        )
                      : a.icon,
                  title: isDarwin
                      ? DefaultTextStyle(
                          style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                          child: a.title)
                      : a.title,
                  onTap: a.onTap,
                ),
                const Divider(height: 0, indent: 8, endIndent: 8),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
