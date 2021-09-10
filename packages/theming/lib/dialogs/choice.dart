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

  const ChoiceResult.cancelled()
      : value = null,
        gotCancelled = true;

  final T? value;
  final bool gotCancelled;
}

Future<ChoiceResult<T?>> choose<T>(
  BuildContext context, {
  required List<Choice<T>> choices,
  required Widget title,
  Widget? message,
  Choice<Widget>? cancel,
  T? value,
  TargetPlatform? platformOverride,
  bool useRootNavigator = true,
  ModalConfiguration configuration = const BottomSheetConfiguration(),
}) async {
  return await Navigator.of(context).push<ChoiceResult<T?>>(
        MaterialPageRoute(
          builder: (_) => _ChoicePage(
            title: title,
            message: message,
            choices: choices,
            cancel: cancel,
            value: value,
          ),
        ),
      ) ??
      ChoiceResult(value, gotCancelled: true);
}

class _ChoicePage<T> extends StatelessWidget {
  const _ChoicePage({
    Key? key,
    required this.title,
    required this.message,
    required this.choices,
    required this.cancel,
    required this.value,
  }) : super(key: key);

  final Widget title;
  final Widget? message;
  final List<Choice<T>> choices;
  final Choice<Widget>? cancel;
  final T? value;

  @override
  Widget build(BuildContext context) {
    final child = ListView.builder(
      itemBuilder: (context, i) {
        final c = choices[i];
        return ListTile(
          horizontalTitleGap: 0,
          leading: value != null
              ? Icon(Icons.check, color: value == c.value ? null : Colors.transparent)
              : null,
          title: c.child,
          onTap: () => Navigator.of(context).pop(ChoiceResult<T>(c.value)),
        );
      },
      itemCount: choices.length,
    );

    return isThemeDarwin(context)
        ? CupertinoPageScaffold(
            child: child,
            navigationBar: CupertinoNavigationBar(
              middle: title,
            ),
          )
        : Scaffold(
            body: child,
            appBar: AppBar(
              title: title,
            ),
          );
  }
}
