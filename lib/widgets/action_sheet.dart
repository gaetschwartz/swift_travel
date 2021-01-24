import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/utils/no_splash.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/responsive.dart';

Future<T> showActionSheet<T>(BuildContext context, List<ActionsSheetAction<T>> actions) =>
    showCupertinoModalBottomSheet<T>(
      context: context,
      expand: false,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      duration: const Duration(milliseconds: 200),
      builder: (context) => ActionsSheet<T>(actions: actions),
    );

@immutable
class ActionsSheetAction<T> {
  final Widget title;
  final FutureOr<T> Function() onTap;
  final Widget icon;
  final bool isDestructive;
  final bool isDefault;

  const ActionsSheetAction({
    @required this.title,
    this.onTap,
    this.icon,
    this.isDestructive = false,
    this.isDefault = false,
  });
}

class ActionsSheet<T> extends StatelessWidget {
  const ActionsSheet({
    Key key,
    @required this.actions,
  }) : super(key: key);

  final List<ActionsSheetAction<T>> actions;

  @override
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);

    return IfWrapper(
      condition: isDarwin,
      builder: (context, child) => Theme(
        data: ThemeData(splashFactory: const NoSplashFactory()),
        child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), child: child),
      ),
      child: Material(
        color:
            isDarwin ? CupertinoTheme.of(context).scaffoldBackgroundColor.withOpacity(0.8) : null,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (var a in actions) ...[
                ListTile(
                  leading: a.icon == null
                      ? null
                      : isDarwin
                          ? IconTheme(
                              data: IconThemeData(
                                  color: a.isDestructive
                                      ? CupertinoColors.destructiveRed
                                      : CupertinoTheme.of(context).primaryColor),
                              child: a.icon,
                            )
                          : a.icon,
                  title: isDarwin
                      ? DefaultTextStyle(
                          style: CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(
                                color: a.isDestructive ? CupertinoColors.destructiveRed : null,
                                fontWeight: a.isDefault ? FontWeight.bold : null,
                              ),
                          child: a.title)
                      : a.title,
                  onTap: () async {
                    final value = await a.onTap?.call();
                    Navigator.of(context).pop<T>(value);
                  },
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
