import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:theming/responsive.dart';

Future<T> showActionSheet<T>(
  BuildContext context,
  List<ActionsSheetAction<T>> actions, {
  bool useRootNavigator = true,
  ActionsSheetAction<T> cancel,
  Widget title,
  Widget message,
}) {
  final isDarwin = Responsive.isDarwin(context);

  return isDarwin
      ? showCupertinoModalPopup(
          context: context,
          useRootNavigator: useRootNavigator,
          builder: (context) => Material(
                color: Colors.transparent,
                child: CupertinoActionSheet(
                  title: title,
                  message: message,
                  actions:
                      actions.map((a) => ActionsSheet._buildListTile(context, a, true)).toList(),
                  cancelButton:
                      cancel == null ? null : ActionsSheet._buildListTile(context, cancel, true),
                ),
              ))
      : showMaterialModalBottomSheet<T>(
          context: context,
          expand: false,
          backgroundColor: Colors.transparent,
          useRootNavigator: useRootNavigator,
          duration: const Duration(milliseconds: 250),
          bounce: true,
          builder: (context) => ActionsSheet<T>(
            actions: actions,
            cancel: cancel,
            title: title,
            message: message,
          ),
        );
}

@immutable
class ActionsSheetAction<T> {
  final Widget title;
  final FutureOr<T> Function() onPressed;
  final Widget icon;
  final Widget cupertinoIcon;
  final bool isDestructive;
  final bool isDefault;

  const ActionsSheetAction({
    this.cupertinoIcon,
    @required this.title,
    this.onPressed,
    this.icon,
    this.isDestructive = false,
    this.isDefault = false,
  });
}

class ActionsSheet<T> extends StatelessWidget {
  const ActionsSheet({
    Key key,
    @required this.actions,
    this.cancel,
    this.title,
    this.message,
  }) : super(key: key);

  final List<ActionsSheetAction<T>> actions;
  final ActionsSheetAction<T> cancel;
  final Widget title;
  final Widget message;

  List<Widget> buildChildren(BuildContext context) {
    final l = <Widget>[];
    for (var i = 0; i < actions.length; i++) {
      final a = actions[i];
      l.add(_buildListTile<T>(context, a, false));
      if (i < actions.length - 1) l.add(const Divider(height: 0, indent: 8, endIndent: 8));
    }
    return l;
  }

  static Widget _buildListTile<T>(BuildContext context, ActionsSheetAction a, bool isDarwin) {
    return ListTile(
      leading: a.icon == null
          ? null
          : IconTheme(
              data: IconThemeData(
                  color: a.isDestructive
                      ? CupertinoColors.destructiveRed
                      : isDarwin
                          ? CupertinoTheme.of(context).textTheme.actionTextStyle.color
                          : null),
              child: isDarwin && a.cupertinoIcon != null ? a.cupertinoIcon : a.icon,
            ),
      title: DefaultTextStyle(
          style: (isDarwin
                  ? CupertinoTheme.of(context).textTheme.actionTextStyle
                  : Theme.of(context).textTheme.subtitle1)
              .copyWith(
            color: a.isDestructive ? CupertinoColors.destructiveRed : null,
            fontWeight: a.isDefault ? FontWeight.bold : null,
          ),
          child: a.title),
      onTap: () async {
        final value = await a.onPressed?.call();
        Navigator.of(context).pop<T>(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null || message != null) const SizedBox(height: 12),
                  if (title != null)
                    DefaultTextStyle(
                        style: Theme.of(context).textTheme.subtitle1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Center(child: title),
                        )),
                  if (message != null)
                    DefaultTextStyle(
                        style: Theme.of(context).textTheme.caption,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8, right: 8, top: title != null ? 8 : 0),
                          child: Center(child: message),
                        )),
                  if (title != null || message != null) ...[
                    const SizedBox(height: 4),
                    const Divider(indent: 16, endIndent: 16)
                  ],
                  ...buildChildren(context)
                ],
              ),
            ),
          ),
        ),
        if (cancel != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
            child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: _buildListTile(context, cancel, false)),
          )
      ],
    );
  }
}
