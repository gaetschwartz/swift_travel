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
}) {
  final isDarwin = Responsive.isDarwin(context);

  return isDarwin
      ? showCupertinoModalPopup(
          context: context,
          useRootNavigator: useRootNavigator,
          builder: (context) => Material(
                color: Colors.transparent,
                child: CupertinoActionSheet(
                  actions: actions
                      .map((a) => ActionsSheet._buildListTile(a, isDarwin, context))
                      .toList(),
                  cancelButton: cancel == null
                      ? null
                      : ActionsSheet._buildListTile(cancel, isDarwin, context),
                ),
              ))
      : showMaterialModalBottomSheet<T>(
          context: context,
          expand: false,
          backgroundColor: Colors.transparent,
          useRootNavigator: useRootNavigator,
          duration: const Duration(milliseconds: 250),
          bounce: true,
          builder: (context) => ActionsSheet<T>(actions: actions, cancel: cancel),
        );
}

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
    this.cancel,
  }) : super(key: key);

  final List<ActionsSheetAction<T>> actions;
  final ActionsSheetAction<T> cancel;

  List<Widget> buildChildren(BuildContext context) {
    final l = <Widget>[];
    for (var i = 0; i < actions.length; i++) {
      final a = actions[i];
      l.add(_buildListTile<T>(a, false, context));
      if (i < actions.length - 1) l.add(const Divider(height: 0, indent: 8, endIndent: 8));
    }
    return l;
  }

  static Widget _buildListTile<T>(ActionsSheetAction a, bool isDarwin, BuildContext context) {
    return ListTile(
      leading: a.icon == null
          ? null
          : IconTheme(
              data: IconThemeData(color: a.isDestructive ? CupertinoColors.destructiveRed : null),
              child: a.icon,
            ),
      title: DefaultTextStyle(
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: a.isDestructive ? CupertinoColors.destructiveRed : null,
                fontWeight: a.isDefault ? FontWeight.bold : null,
              ),
          child: a.title),
      onTap: () async {
        final value = await a.onTap?.call();
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
                children: buildChildren(context),
              ),
            ),
          ),
        ),
        if (cancel != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
            child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: _buildListTile(cancel, false, context)),
          )
      ],
    );
  }
}
