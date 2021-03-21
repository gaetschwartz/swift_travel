import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:theming/dialogs/configurations/bottom_sheet_configuration.dart';
import 'package:theming/responsive.dart';

enum DefaultAction { cancel, confirm }

@immutable
class Choice<T> {
  const Choice({
    required this.value,
    required this.child,
    this.onTap,
    this.isDestructive = false,
    this.isDefault = false,
  });

  const Choice.cancel({
    required this.child,
    this.value,
    this.onTap,
    this.isDestructive = true,
    this.isDefault = false,
  });

  final bool isDestructive;
  final bool isDefault;
  final T? value;
  final VoidCallback? onTap;
  final Widget child;
}

@immutable
class ChoiceResult<T> {
  const ChoiceResult(this.value, {this.gotCancelled = false});

  final T value;
  final bool gotCancelled;
}

Future<ChoiceResult<T?>> choose<T>(
  BuildContext context, {
  required List<Choice<T>> choices,
  required Widget title,
  Widget? message,
  Choice<Widget>? cancel,
  T? defaultValue,
  TargetPlatform? platformOverride,
  bool useRootNavigator = true,
  ModalConfiguration configuration = const BottomSheetConfiguration(),
}) async =>
    (Responsive.isPlatformDarwin(platformOverride ?? Theme.of(context).platform)
        ? await showCupertinoModalPopup<ChoiceResult<T>>(
            context: context,
            useRootNavigator: useRootNavigator,
            builder: (context) => _IOSChoiceAlert<T>(
              title: title,
              message: message,
              cancel: cancel,
              choices: choices,
            ),
          )
        : await showModal<ChoiceResult<T>>(
            context: context,
            configuration: configuration,
            builder: (context) => _ChoiceAlert<T>(
              title: title,
              message: message,
              cancel: cancel,
              choices: choices,
            ),
          )) ??
    ChoiceResult(defaultValue, gotCancelled: true);

class _IOSChoiceAlert<T> extends StatelessWidget {
  const _IOSChoiceAlert({
    required this.title,
    required this.choices,
    required this.cancel,
    required this.message,
    Key? key,
  }) : super(key: key);

  final Widget title;
  final Widget? message;
  final List<Choice<T>> choices;
  final Choice<Widget>? cancel;

  @override
  Widget build(BuildContext context) => CupertinoActionSheet(
        title: title,
        message: message,
        cancelButton: cancel == null
            ? null
            : CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context)
                      .pop<ChoiceResult<T?>>(const ChoiceResult(null, gotCancelled: true));
                  cancel!.onTap?.call();
                },
                isDefaultAction: cancel!.isDefault,
                isDestructiveAction: cancel!.isDestructive,
                child: cancel!.child,
              ),
        actions: choices
            .map((v) => CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop<ChoiceResult<T?>>(ChoiceResult(v.value));
                  v.onTap?.call();
                },
                isDefaultAction: v.isDefault,
                isDestructiveAction: v.isDestructive,
                child: v.child))
            .toList(),
      );
}

class _ChoiceAlert<T> extends StatelessWidget {
  const _ChoiceAlert({
    required this.title,
    required this.choices,
    required this.cancel,
    required this.message,
    Key? key,
  }) : super(key: key);

  final Widget title;
  final Widget? message;
  final List<Choice<T>> choices;
  final Choice<Widget>? cancel;

  @override
  Widget build(BuildContext context) {
    final widgets = choices
        .map((v) => CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop<ChoiceResult<T?>>(ChoiceResult(v.value));
              v.onTap?.call();
            },
            isDefaultAction: v.isDefault,
            isDestructiveAction: v.isDestructive,
            child: v.child))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: Theme.of(context).cardColor,
        ),
        child: Theme(
          data: ThemeData(brightness: Theme.of(context).brightness),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child:
                    DefaultTextStyle(style: Theme.of(context).textTheme.headline6!, child: title),
              ),
            ),
            if (message != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.caption!, child: message!),
                ),
              ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) => widgets[i],
              separatorBuilder: (context, i) => const Divider(),
              itemCount: widgets.length,
            ),
            if (cancel != null) ...[
              const Divider(indent: 16, endIndent: 16, thickness: 1, height: 0),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context)
                      .pop<ChoiceResult<T?>>(const ChoiceResult(null, gotCancelled: true));
                  cancel!.onTap?.call();
                },
                isDefaultAction: cancel!.isDefault,
                isDestructiveAction: cancel!.isDestructive,
                child: cancel!.child,
              ),
            ]
          ]),
        ),
      ),
    );
  }
}
