import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/in_app_purchase.dart';
import 'package:swift_travel/pages/purchases.dart';
import 'package:swift_travel/settings/properties/property.dart';
import 'package:swift_travel/settings/settings.dart';
import 'package:swift_travel/settings/widgets/settings_page_widget.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/colors.dart';
import 'package:swift_travel/widgets/property_page.dart';
import 'package:theming/dynamic_theme.dart';

class CustomizationSettingsPage extends StatefulWidget {
  const CustomizationSettingsPage({super.key});

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
        _ThemeTile(
          brightness: Brightness.light,
          title: Text(AppLocalizations.of(context).brightness_light),
        ),
        _ThemeTile(
          brightness: Brightness.dark,
          title: Text(AppLocalizations.of(context).brightness_dark),
        ),
        const _FontChoiceTile(),
        if (Env.isDebugMode) const _PlatformTile(),
      ],
    );
  }
}

class _PlatformTile extends StatelessWidget {
  const _PlatformTile();

  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    final p = defaultTargetPlatform;
    return SwiftSettingsPropertyTile<TargetPlatform>(
      leading: const Icon(Icons.phone_android),
      tileBorders: const TileBorders(bottom: true),
      property: SyncProperty<TargetPlatform>(
        onSet: (p) => unawaited(theme.setPlatform(p)),
        initialValue: theme.platform,
      ),
      valueBuilder: (_, v) => Text(v.name),
      title: const Text('Design'),
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

class _ThemeTile extends StatelessWidget {
  const _ThemeTile({required this.brightness, required this.title});

  final Brightness brightness;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    final theme = DynamicTheme.of(context);
    return SwiftSettingsPropertyTile<ExtendedTheme>(
      leading: const Icon(Icons.color_lens),
      tileBorders: const TileBorders(bottom: true),
      property: brightness == Brightness.light
          ? SyncProperty<ExtendedTheme>(
              onSet: (p) => unawaited(theme.setLightTheme(p.id)),
              initialValue: theme.theme.light,
            )
          : SyncProperty<ExtendedTheme>(
              onSet: (p) => unawaited(theme.setDarkTheme(p.id)),
              initialValue: theme.theme.dark,
            ),
      valueBuilder: (_, v) => Text(v.name),
      title: title,
      options: (brightness == Brightness.light
              ? theme.configuration.lightThemes
              : theme.configuration.darkThemes)
          .map((e) => ValueOption<ExtendedTheme>(
                value: e,
                title: Text(e.name),
              ))
          .toList(),
    );
  }
}

class _FontChoiceTile extends StatelessWidget {
  const _FontChoiceTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = DynamicTheme.of(context);
    final inApp = ref.read(inAppPurchaseManagerProvider);
    final unlocked = inApp.hasUnlockedFeature(InAppPaidFeature.customFonts);

    final options = theme.configuration.fonts
        .map(
          (f) => ValueOption(
            value: f,
            title: Text(
              f.name,
              style: f.textTheme(Theme.of(context).textTheme).bodyMedium,
            ),
          ),
        )
        .toList();
    return SwiftSettingsPropertyTile<Font>(
      leading: const Icon(Icons.font_download),
      // ignore: use_named_constants
      tileBorders: TileBorders(top: true, bottom: !isLast),
      title: Text(AppLocalizations.of(context).font),
      options: options,
      property: SyncProperty<Font>(
        onSet: unlocked ? ((f) => unawaited(theme.setFont(f))) : ((f) {}),
        initialValue: theme.font,
      ),
      valueBuilder: (context, value) => Text(value.name),
      isAllowedToChangeValue: (value) async {
        if (unlocked) {
          return true;
        }
        await showProDialog(context);
        return false;
      },
    );
  }
}

extension TargetPlatfromX on String String TargetPlatform {
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
  const _ThemeModeList();

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
  });

  final DynamicThemeNotifier theme;
  final ThemeMode mode;
  final String label;

  @override
  Widget build(BuildContext context) {
    final b = DynamicTheme.resolveBrightness(context, mode);
    final ThemeData t;
    switch (b) {
      case Brightness.light:
        t = theme.light;
        break;
      case Brightness.dark:
        t = theme.dark;
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () => unawaited(theme.setThemeMode(mode)),
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
                              style: t.textTheme.titleMedium!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Text(label, style: t.textTheme.titleMedium),
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
