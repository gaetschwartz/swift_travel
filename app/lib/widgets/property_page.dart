import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/listener.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/dialogs/configurations/bottom_sheet_configuration.dart';

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
    required this.value,
    this.onTap,
    this.isDestructive = true,
    this.isDefault = false,
  });

  final bool isDestructive;
  final bool isDefault;
  final T value;
  final VoidCallback? onTap;
  final Widget title;
}

Future<void> showPropertyPage<T>(
  BuildContext context, {
  required List<ValueOption<T>> options,
  required Widget title,
  required Property<T> property,
  Widget? message,
  TargetPlatform? platformOverride,
  bool useRootNavigator = true,
  ModalConfiguration configuration = const BottomSheetConfiguration(),
}) async {
  return Navigator.of(context).push<void>(
    PlatformPageRoute(
      builder: (_) => _PropertyPage(
        title: title,
        message: message,
        choices: options,
        property: property,
      ),
    ),
  );
}

class _PropertyPage<T> extends StatelessWidget {
  const _PropertyPage({
    Key? key,
    required this.title,
    required this.message,
    required this.choices,
    required this.property,
  }) : super(key: key);

  final Widget title;
  final Widget? message;
  final List<ValueOption<T>> choices;
  final Property<T> property;

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => CupertinoPageScaffold(
        backgroundColor: SettingsColor.background.resolveFrom(context),
        navigationBar: CupertinoNavigationBar(
          middle: title,
          previousPageTitle:
              PlatformRouteTitleMixin.getPreviousTitleOf(context),
        ),
        child: Builder(builder: (context) => child!),
      ),
      materialBuilder: (context, child) => Scaffold(
        appBar: AppBar(title: title),
        body: child,
      ),
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListenableBuilder<Property<T>>(
              listenable: property,
              builder: (context, prop, _) {
                return ListView.separated(
                  separatorBuilder: (_, __) =>
                      const Divider(indent: 56, thickness: 0.5, height: 0),
                  itemBuilder: (context, i) {
                    final c = choices[i];
                    return Material(
                      color: Colors.transparent,
                      child: ListTile(
                        horizontalTitleGap: 0,
                        tileColor: Theme.of(context).backgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: i == 0
                              ? SwiftSettingsTile.borderRadius
                              : Radius.zero,
                          bottom: i == choices.length - 1
                              ? SwiftSettingsTile.borderRadius
                              : Radius.zero,
                        )),
                        leading: Icon(
                          Icons.check,
                          color: prop.value == c.value
                              ? IconTheme.of(context).color
                              : Colors.transparent,
                        ),
                        title: c.title,
                        onTap: () => property.setValue(c.value),
                      ),
                    );
                  },
                  itemCount: choices.length,
                );
              })),
    );
  }
}
