import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:theming/responsive.dart';

Future<T?> showActionSheet<T>(
  BuildContext context,
  List<ActionsSheetAction<T>> actions, {
  bool useRootNavigator = true,
  ActionsSheetAction<T>? cancel,
  Widget? title,
  Widget? message,
  bool popBeforeReturn = false,
}) {
  final isDarwin = Responsive.isDarwin(context);

  return isDarwin
      ? showCupertinoModalPopup<T>(
          context: context,
          useRootNavigator: useRootNavigator,
          builder: (context) => Material(
                color: Colors.transparent,
                child: CupertinoActionSheet(
                  title: title,
                  message: message,
                  actions: actions
                      .map((a) => ActionsSheet._buildListTile<T>(
                            context,
                            a,
                            true,
                            popBeforeReturn: popBeforeReturn,
                          ))
                      .toList(growable: false),
                  cancelButton: cancel == null
                      ? null
                      : ActionsSheet._buildListTile<T>(
                          context,
                          cancel,
                          true,
                          popBeforeReturn: popBeforeReturn,
                        ),
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
            popBeforeReturn: popBeforeReturn,
          ),
        );
}

Future<T?> showChoiceSheet<T>(
  BuildContext context,
  List<ActionsSheetAction<T>> actions, {
  bool useRootNavigator = true,
  ActionsSheetAction<T>? cancel,
  Widget? title,
  Widget? message,
  bool popBeforeReturn = false,
  T? defaultValue,
}) {
  final isDarwin = Responsive.isDarwin(context);

  return isDarwin
      ? showCupertinoModalPopup<T>(
          context: context,
          useRootNavigator: useRootNavigator,
          builder: (context) => Material(
                color: Colors.transparent,
                child: CupertinoActionSheet(
                  title: title,
                  message: message,
                  actions: actions
                      .map((a) => ActionsSheet._buildListTile<T>(
                            context,
                            a,
                            true,
                            popBeforeReturn: popBeforeReturn,
                          ))
                      .toList(growable: false),
                  cancelButton: cancel == null
                      ? null
                      : ActionsSheet._buildListTile<T>(
                          context,
                          cancel,
                          true,
                          popBeforeReturn: popBeforeReturn,
                        ),
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
            popBeforeReturn: popBeforeReturn,
          ),
        );
}

@immutable
class ActionsSheetAction<T> {
  const ActionsSheetAction({
    required this.title,
    this.cupertinoIcon,
    this.onPressed,
    this.icon,
    this.isDestructive = false,
    this.isDefault = false,
  });

  final Widget title;
  final FutureOr<T>? Function()? onPressed;
  final Widget? icon;
  final Widget? cupertinoIcon;
  final bool isDestructive;
  final bool isDefault;
}

class ActionsSheet<T> extends StatelessWidget {
  const ActionsSheet({
    required this.actions,
    this.cancel,
    this.title,
    this.message,
    this.popBeforeReturn = false,
    Key? key,
  }) : super(key: key);

  final List<ActionsSheetAction<T>> actions;
  final ActionsSheetAction<T>? cancel;
  final Widget? title;
  final Widget? message;
  final bool popBeforeReturn;

  List<Widget> buildChildren(BuildContext context) {
    final l = <Widget>[];
    for (var i = 0; i < actions.length; i++) {
      final a = actions[i];
      l.add(_buildListTile<T>(context, a, false, popBeforeReturn: popBeforeReturn));
      if (i < actions.length - 1) {
        l.add(const Divider(height: 0, indent: 8, endIndent: 8));
      }
    }
    return l;
  }

  static Widget _buildListTile<T>(
    BuildContext context,
    ActionsSheetAction<T> a,
    bool isDarwin, {
    required bool popBeforeReturn,
  }) =>
      ListTile(
        leading: a.icon == null
            ? null
            : IconTheme(
                data: IconThemeData(
                    color: a.isDestructive
                        ? CupertinoColors.destructiveRed
                        : isDarwin
                            ? CupertinoTheme.of(context).textTheme.actionTextStyle.color
                            : null),
                child: isDarwin && a.cupertinoIcon != null ? a.cupertinoIcon! : a.icon!,
              ),
        title: DefaultTextStyle(
            style: (isDarwin
                    ? CupertinoTheme.of(context).textTheme.actionTextStyle
                    : Theme.of(context).textTheme.subtitle1)!
                .copyWith(
              color: a.isDestructive ? CupertinoColors.destructiveRed : null,
              fontWeight: a.isDefault ? FontWeight.bold : null,
            ),
            child: a.title),
        onTap: () async {
          if (popBeforeReturn) {
            Navigator.of(context).pop<void>();
            a.onPressed?.call();
          } else {
            final value = await a.onPressed?.call();
            Navigator.of(context).pop<T>(value);
          }
        },
      );

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
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
                          style: Theme.of(context).textTheme.subtitle1!,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Center(child: title),
                          )),
                    if (message != null)
                      DefaultTextStyle(
                          style: Theme.of(context).textTheme.caption!,
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
                  child: _buildListTile(
                    context,
                    cancel!,
                    false,
                    popBeforeReturn: popBeforeReturn,
                  )),
            )
        ],
      );
}
