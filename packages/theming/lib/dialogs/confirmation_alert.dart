import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theming/responsive.dart';

enum DefaultAction { cancel, confirm }

Future<bool> confirm(
  BuildContext context, {
  required Widget title,
  required Widget content,
  Widget confirm = const Text('Okay'),
  Widget cancel = const Text('Cancel'),
  TargetPlatform? platformOverride,
  bool barrierDismissible = true,
  String barrierLabel = 'Close',
  bool isCancelDestructive = false,
  bool isConfirmDestructive = false,
  DefaultAction? defaultAction,
  bool useRootNavigator = true,
}) async =>
    (isPlatformDarwin(platformOverride ?? Theme.of(context).platform)
        ? await showCupertinoDialog<bool>(
            context: context,
            barrierDismissible: barrierDismissible,
            useRootNavigator: useRootNavigator,
            builder: (context) => _IOSConfirmationAlert(
              title: title,
              content: content,
              cancel: cancel,
              confirm: confirm,
              isCancelDestructive: isCancelDestructive,
              isConfirmDestructive: isConfirmDestructive,
              defaultAction: defaultAction,
            ),
          )
        : await showGeneralDialog<bool>(
            context: context,
            barrierDismissible: barrierDismissible,
            barrierLabel: barrierLabel,
            useRootNavigator: useRootNavigator,
            transitionBuilder: (context, a1, a2, child) => FadeScaleTransition(
              animation: a1,
              child: child,
            ),
            pageBuilder: (context, animation, secondaryAnimation) => _ConfirmationAlert(
              title: title,
              content: content,
              cancel: cancel,
              confirm: confirm,
            ),
          )) ??
    false;

class _IOSConfirmationAlert extends StatelessWidget {
  const _IOSConfirmationAlert({
    required this.title,
    required this.content,
    required this.confirm,
    required this.cancel,
    required this.isCancelDestructive,
    required this.isConfirmDestructive,
    required this.defaultAction,
  });

  final Widget title;
  final Widget content;
  final Widget confirm;
  final Widget cancel;
  final bool isCancelDestructive;
  final bool isConfirmDestructive;

  final DefaultAction? defaultAction;

  @override
  Widget build(BuildContext context) => CupertinoAlertDialog(
        title: title,
        content: content,
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            isDestructiveAction: isCancelDestructive,
            isDefaultAction: defaultAction == DefaultAction.cancel,
            child: cancel,
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(true),
            isDestructiveAction: isConfirmDestructive,
            isDefaultAction: defaultAction == DefaultAction.confirm,
            child: confirm,
          ),
        ],
      );
}

class _ConfirmationAlert extends StatelessWidget {
  const _ConfirmationAlert({
    required this.title,
    required this.content,
    required this.confirm,
    required this.cancel,
  });

  final Widget title;
  final Widget content;
  final Widget confirm;
  final Widget cancel;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: title,
        content: content,
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
              child: cancel,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
              child: confirm,
            ),
          ),
        ],
      );
}
