import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/utils/definitions.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/responsive.dart';

Future<T?> showActionSheet<T>(
  BuildContext context,
  List<ActionsSheetAction<T>> actions, {
  bool useRootNavigator = true,
  ActionsSheetAction<T>? cancel,
  Widget? title,
  Widget? message,
}) {
  return isThemeDarwin(context)
      ? showCupertinoModalPopup<T>(
          context: context,
          useRootNavigator: useRootNavigator,
          builder: (context) => Material(
                color: Colors.transparent,
                child: CupertinoActionSheet(
                  title: title,
                  message: message,
                  actions: actions
                      .map((a) => _Tile<T>(
                            a,
                            isDarwin: true,
                          ))
                      .toList(growable: false),
                  cancelButton: cancel == null
                      ? null
                      : _Tile<T>(
                          cancel,
                          isDarwin: true,
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
          ),
        );
}

// ignore: long-parameter-list
Future<T?> showChoiceSheet<T>(
  BuildContext context,
  List<ActionsSheetAction<T>> actions, {
  bool useRootNavigator = true,
  ActionsSheetAction<T>? cancel,
  Widget? title,
  Widget? message,
  T? defaultValue,
}) {
  return isThemeDarwin(context)
      ? showCupertinoModalPopup<T>(
          context: context,
          useRootNavigator: useRootNavigator,
          builder: (context) => Material(
                color: Colors.transparent,
                child: CupertinoActionSheet(
                  title: title,
                  message: message,
                  actions: actions
                      .map((a) => _Tile<T>(
                            a,
                            isDarwin: true,
                            isSelected: defaultValue == a.value,
                          ))
                      .toList(growable: false),
                  cancelButton: cancel == null
                      ? null
                      : _Tile<T>(
                          cancel,
                          isDarwin: true,
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
            defaultValue: defaultValue,
            actions: actions,
            cancel: cancel,
            title: title,
            message: message,
          ),
        );
}

@immutable
class ActionsSheetAction<T> {
  const ActionsSheetAction({
    required this.title,
    this.value,
    this.cupertinoIcon,
    this.onPressed,
    this.icon,
    this.isDestructive = false,
    this.isDefault = false,
  });

  final Widget title;
  final void Function()? onPressed;
  final Widget? icon;
  final Widget? cupertinoIcon;
  final bool isDestructive;
  final bool isDefault;
  final T? value;
}

class _Tile<T> extends StatelessWidget {
  const _Tile(
    this.a, {
    required this.isDarwin,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  final ActionsSheetAction<T> a;
  final bool isDarwin;
  final bool isSelected;

  void onPressed(BuildContext context) {
    Navigator.of(context).pop<T>(a.value);
    a.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) => CupertinoActionSheetAction(
        onPressed: () => onPressed(context),
        isDefaultAction: isSelected || a.isDefault,
        isDestructiveAction: a.isDestructive,
        child: PlatformBuilder(
            cupertinoBuilder: (_, child) => child!,
            materialBuilder: (_, child) => child!,
            child: a.title),
      );
}

class ActionsSheet<T> extends StatelessWidget {
  const ActionsSheet({
    required this.actions,
    this.cancel,
    this.title,
    this.message,
    Key? key,
    this.defaultValue,
  }) : super(key: key);

  final List<ActionsSheetAction<T>> actions;
  final ActionsSheetAction<T>? cancel;
  final Widget? title;
  final Widget? message;
  final T? defaultValue;

  @allowReturningWidgets
  Iterable<Widget> buildChildren() sync* {
    for (var i = 0; i < actions.length; i++) {
      final a = actions[i];
      yield _Tile<T>(a, isDarwin: false, isSelected: a.value == defaultValue);
      if (i < actions.length - 1) {
        yield const Divider(height: 0, indent: 8, endIndent: 8);
      }
    }
  }

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
                    if (title != null || message != null) const Gap(12),
                    if (title != null)
                      DefaultTextStyle(
                          style: Theme.of(context).textTheme.titleMedium!,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Center(child: title),
                          )),
                    if (message != null)
                      DefaultTextStyle(
                          style: Theme.of(context).textTheme.bodySmall!,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: title != null ? 8 : 0),
                            child: Center(child: message),
                          )),
                    if (title != null || message != null) ...[
                      const Gap(4),
                      const Divider(indent: 16, endIndent: 16)
                    ],
                    ...buildChildren()
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
                  child: _Tile(
                    cancel!,
                    isDarwin: false,
                  )),
            )
        ],
      );
}
