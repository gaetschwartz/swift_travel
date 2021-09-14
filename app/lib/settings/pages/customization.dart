import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/settings/properties/tile.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/dialogs/choice.dart';
import 'package:theming/dynamic_theme.dart';

class CustomizationSettingsPage extends StatefulWidget {
  const CustomizationSettingsPage({Key? key}) : super(key: key);

  @override
  State<CustomizationSettingsPage> createState() =>
      _CustomizationSettingsPageState();
}

class _CustomizationSettingsPageState extends State<CustomizationSettingsPage> {
  final children = [
    const _FontChoiceTile(),
    const _FontWeightTile(),
    const _PlatformTile(),
  ];

  @override
  Widget build(BuildContext context) {
    return DividerTheme(
      data: const DividerThemeData(indent: 16, endIndent: 16, thickness: 0.5),
      child: PlatformScaffold(
        title: Text(AppLocalizations.of(context).customization),
        child: ListView(children: children),
      ),
    );
  }
}

class PlatformScaffold extends StatelessWidget {
  const PlatformScaffold({
    Key? key,
    required this.child,
    this.title,
  }) : super(key: key);

  final Widget child;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => Material(
        child: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          navigationBar: SwiftCupertinoBar(
            middle: title,
          ),
          child: child!,
        ),
      ),
      materialBuilder: (context, child) => Scaffold(
        body: child,
        appBar: AppBar(
          title: title,
        ),
      ),
      child: child,
    );
  }
}

class _PlatformTile extends StatelessWidget {
  const _PlatformTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    final p = defaultTargetPlatform;
    return PropertyTile<TargetPlatform>(
      SyncProperty<TargetPlatform>(
        onSet: (p) => theme.platform = p,
        defaultValue: theme.platform,
      ),
      trailingBuilder: (v) => Text(v.name),
      title: const Text('Platform'),
      items: p == TargetPlatform.iOS || p == TargetPlatform.android
          ? const [
              ActionsSheetAction(
                  value: TargetPlatform.android, title: Text('Android')),
              ActionsSheetAction(value: TargetPlatform.iOS, title: Text('iOS')),
            ]
          : const [
              ActionsSheetAction(
                  value: TargetPlatform.macOS, title: Text('MacOS')),
              ActionsSheetAction(
                  value: TargetPlatform.windows, title: Text('Windows')),
            ],
    );
  }
}

class _FontWeightTile extends StatelessWidget {
  const _FontWeightTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    const map = {-1: 'Light', 0: 'Normal', 1: 'Medium', 3: 'Bold'};
    // final t = theme.font
    //     .textTheme(Typography.material2018(platform: Theme.of(context).platform).englishLike)
    //     .bodyText1!;
    return PropertyTile<int>(
      SyncProperty<int>(
        onSet: (delta) => theme.fontWeightDelta = delta,
        defaultValue: theme.fontWeightDelta,
      ),
      title: const Text('Font weight'),
      items: map.keys
          .map((key) =>
              ActionsSheetAction<int>(value: key, title: Text(map[key]!)))
          .toList(growable: false),
      trailingBuilder: (i) => Text(map[i] ?? ''),
    );
  }
}

class _FontChoiceTile extends StatelessWidget {
  const _FontChoiceTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwiftSettingsTile(
      leading: const Icon(CupertinoIcons.textformat_abc),
      title: Text(AppLocalizations.of(context).font),
      subtitle: Text(DynamicTheme.of(context).font.name),
      onTap: () => onTap(context),
    );
  }

  Future<void> onTap(BuildContext context) async {
    final theme = DynamicTheme.of(context);
    final f = await choose<Font>(
      context,
      options: theme.configuration.fonts
          .map(
            (e) => ValueOption(
              value: e,
              title: Text(
                e.name,
                style: e.textTheme(Typography.englishLike2018).bodyText2,
              ),
            ),
          )
          .toList(),
      title: Text(AppLocalizations.of(context).font),
      value: theme.font,
    );
    final value = f.value;
    if (value != null) {
      theme.font = value;
    }
  }
}

extension TargetPlatfromX on TargetPlatform {
  String get name {
    switch (this) {
      case TargetPlatform.android:
        return 'Android';
      case TargetPlatform.iOS:
        return 'iOS';
      case TargetPlatform.macOS:
        return 'MacOS';
      case TargetPlatform.windows:
        return 'Windows';
      case TargetPlatform.linux:
        return 'Linux';
      case TargetPlatform.fuchsia:
        return 'Fuchsia';
    }
  }
}
