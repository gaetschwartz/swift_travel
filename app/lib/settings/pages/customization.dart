import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/settings/widgets/settings_page_widget.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/colors.dart';
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
      children: [
        SectionTitle(title: Text(AppLocalizations.of(context).brightness)),
        const _ThemeModeList(),
        const Gap(16),
        const _FontChoiceTile(),
        const _PlatformTile(),
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
                style: e.textTheme(Typography.englishLike2018).bodyMedium,
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

class _ThemeModeList extends StatelessWidget {
  const _ThemeModeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('settings-top-theme-section'),
      height: 100,
      child: Builder(builder: (context) {
        final theme = DynamicTheme.of(context);
        return ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _ThememodeWidget(
              theme: theme,
              label: AppLocalizations.of(context).brightness_system,
              mode: ThemeMode.system,
            ),
            _ThememodeWidget(
              theme: theme,
              label: AppLocalizations.of(context).brightness_light,
              mode: ThemeMode.light,
            ),
            _ThememodeWidget(
              theme: theme,
              label: AppLocalizations.of(context).brightness_dark,
              mode: ThemeMode.dark,
            ),
          ],
        );
      }),
    );
  }
}

class _ThememodeWidget extends StatelessWidget {
  const _ThememodeWidget({
    required this.theme,
    required this.mode,
    required this.label,
    Key? key,
  }) : super(key: key);

  final DynamicThemeData theme;
  final ThemeMode mode;
  final String label;

  @override
  Widget build(BuildContext context) {
    final t = DynamicTheme.resolve(
      context,
      mode,
      theme.theme,
      textTheme: Typography.englishLike2018,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () => theme.themeMode = mode,
        child: AspectRatio(
          aspectRatio: 1,
          child: DecoratedBox(
            key: Key('mode-${describeEnum(mode).toLowerCase()}'),
            decoration: BoxDecoration(
                boxShadow: shadowListOf(context),
                color: mode == ThemeMode.system ? null : t.cardColor,
                border: theme.themeMode == mode
                    ? Border.all(
                        width: 2,
                        color: platformPrimaryColor(context),
                      )
                    : null,
                gradient: mode == ThemeMode.system
                    ? LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                            theme.light.colorScheme.background,
                            theme.dark.colorScheme.background,
                          ],
                        stops: const [
                            0.5,
                            0.5,
                          ])
                    : null,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Center(
              child: mode == ThemeMode.system
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: ColoredBox(
                          color: Colors.white30,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8, top: 4),
                            child: Text(
                              label,
                              style: t.textTheme.titleLarge!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Text(label, style: t.textTheme.titleLarge),
            ),
          ),
        ),
      ),
    );
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
