import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:theming/dialogs/configurations/bottom_sheet_configuration.dart';
import 'package:theming/responsive.dart';

enum DefaultAction { cancel, confirm }

@immutable
class ValueOption<T> {
  const ValueOption({
    required this.value,
    required this.title,
    this.onTap,
    this.isDestructive = false,
    this.isDefault = false,
  });

  const ValueOption.cancel({
    required this.title,
    this.value,
    this.onTap,
    this.isDestructive = true,
    this.isDefault = false,
  });

  final bool isDestructive;
  final bool isDefault;
  final T? value;
  final VoidCallback? onTap;
  final Widget title;
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
  required List<ValueOption<T>> options,
  required Widget title,
  Widget? message,
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
            choices: options,
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
    required this.value,
  }) : super(key: key);

  final Widget title;
  final Widget? message;
  final List<ValueOption<T>> choices;
  final T? value;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(16);
    final child = Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (context, i) {
            final c = choices[i];
            return Material(
              color: Colors.transparent,
              child: ListTile(
                horizontalTitleGap: 0,
                tileColor: Theme.of(context).backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  top: i == 0 ? radius : Radius.zero,
                  bottom: i == choices.length - 1 ? radius : Radius.zero,
                )),
                leading: value != null
                    ? Icon(
                        Icons.check,
                        color: value == c.value
                            ? IconTheme.of(context).color
                            : Colors.transparent,
                      )
                    : null,
                title: c.title,
                onTap: () =>
                    Navigator.of(context).pop(ChoiceResult<T>(c.value)),
              ),
            );
          },
          itemCount: choices.length,
        ));

    return isThemeDarwin(context)
        ? CupertinoPageScaffold(
            backgroundColor: CupertinoColors.systemGrey6,
            navigationBar: CupertinoNavigationBar(middle: title),
            child: Builder(builder: (context) => child),
          )
        : Scaffold(
            body: child,
            appBar: AppBar(
              title: title,
            ),
          );
  }
}
