import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/settings/widgets/settings_page_widget.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/widgets/property_page.dart';
import 'package:theming/dynamic_theme.dart';

class CustomizationSettingsPage extends StatefulWidget {
  const CustomizationSettingsPage({Key? key}) : super(key: key);

  @override
  State<CustomizationSettingsPage> createState() =>
      _CustomizationSettingsPageState();
}

class _CustomizationSettingsPageState extends State<CustomizationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SettingsPageWidget(
      title: Text(AppLocalizations.of(context).customization),
      children: const [
        _FontChoiceTile(),
        _PlatformTile(),
      ],
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
    return SwiftSettingsPropertyTile<TargetPlatform>(
      tileBorders: const TileBorders(bottom: true),
      property: SyncProperty<TargetPlatform>(
        onSet: (p) => theme.platform = p,
        initialValue: theme.platform,
      ),
      valueBuilder: (_, v) => Text(v.name),
      title: const Text('Platform'),
      options: p == TargetPlatform.iOS || p == TargetPlatform.android
          ? const [
              ValueOption(
                  value: TargetPlatform.android, title: Text('Android')),
              ValueOption(value: TargetPlatform.iOS, title: Text('iOS')),
            ]
          : const [
              ValueOption(value: TargetPlatform.macOS, title: Text('MacOS')),
              ValueOption(
                  value: TargetPlatform.windows, title: Text('Windows')),
            ],
    );
  }
}

class _FontChoiceTile extends StatelessWidget {
  const _FontChoiceTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    return SwiftSettingsPropertyTile<Font>(
      tileBorders: const TileBorders(top: true),
      title: Text(AppLocalizations.of(context).font),
      subtitle: Text(DynamicTheme.of(context).font.name),
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
      property: SyncProperty<Font>(
        onSet: (f) => theme.font = f,
        initialValue: theme.font,
      ),
      valueBuilder: (context, value) => Text(value.name),
    );
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

/* class _FontWeightTile extends StatelessWidget {
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
    return SwiftSettingsPropertyTile<int>(
      property: SyncProperty<int>(
        onSet: (delta) => theme.fontWeightDelta = delta,
        initialValue: theme.fontWeightDelta,
      ),
      leading: const Icon(Icons.text_fields),
      title: const Text('Font weight'),
      options: map.keys
          .map((key) => ValueOption<int>(value: key, title: Text(map[key]!)))
          .toList(growable: false),
      valueBuilder: (_, i) => Text(map[i] ?? ''),
    );
  }
} */
