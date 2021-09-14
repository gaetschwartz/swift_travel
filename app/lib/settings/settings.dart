import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/constants/build.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/settings/pages/customization.dart';
import 'package:swift_travel/settings/pages/developer.dart';
import 'package:swift_travel/settings/team_page.dart';
import 'package:swift_travel/settings/widgets/switch.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/colors.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/dialogs/choice.dart';
import 'package:theming/dynamic_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final children = [
      _SectionTitle(title: Text(AppLocalizations.of(context).brightness)),
      const _ThemeModeList(),
      const Gap(16),
      SwiftSettingsTile(
        tileBorders: const TileBorders(top: true),
        title: Text(AppLocalizations.of(context).customization),
        leading: const Icon(CupertinoIcons.wand_stars),
        onTap: () => Navigator.of(context).push(PlatformPageRoute(
            builder: (_) => const CustomizationSettingsPage())),
      ),
      if (Env.isDebugMode || defaultTargetPlatform == TargetPlatform.iOS)
        SwiftSettingsPropertyTile<NavigationApp>(
          property: context.read(preferencesProvider).mapsApp,
          title: Text(AppLocalizations.of(context).maps_app),
          leading: const Icon(Icons.map_rounded),
          options: const [
            ValueOption(
              value: NavigationApp.apple,
              title: Text('Apple Maps'),
            ),
            ValueOption(
              value: NavigationApp.google,
              title: Text('Google Maps'),
            ),
          ],
          valueBuilder: (context, v) => Text(v.toStringFull()),
        ),
      SwiftSettingsPropertyTile<NavigationApiId>(
        property: context.read(preferencesProvider).api,
        options: NavigationApiFactory.factories
            .map(
              (e) => ValueOption(
                  title: Text(e.name), value: NavigationApiId(e.id.value)),
            )
            .toList(growable: false),
        title: Text(AppLocalizations.of(context).navigation_api),
        leading: const Icon(CupertinoIcons.link),
        valueBuilder: (context, v) =>
            Text(NavigationApiFactory.fromId(v).shortDesc),
        /* pageDescription: const Text(
            'BETA: In the future the goal is to add more countries.'),*/
      ),
      SwiftSettingsSwitchTile.property(
        property: context.read(preferencesProvider).useAnalytics,
        title: const Text('Use analytics'),
        subtitle: const Text('The app collects anonymized crash reports.'),
        tileBorders: const TileBorders(bottom: true),
      ),
      _SectionTitle(title: Text(AppLocalizations.of(context).more)),
      Consumer(builder: (context, w, _) {
        final isDev = w(isDeveloperProvider).value;
        return SwiftSettingsTile(
          tileBorders: TileBorders(top: true, bottom: !isDev),
          leading: const Icon(CupertinoIcons.person_3_fill),
          title: Text(AppLocalizations.of(context).our_team),
          onTap: () => Navigator.of(context, rootNavigator: true)
              .push(PlatformPageRoute(builder: (_) => const TeamPage())),
        );
      }),
      Consumer(
        builder: (context, w, _) => w(isDeveloperProvider).value
            ? SwiftSettingsTile(
                tileBorders: const TileBorders(bottom: true),
                title: Text(AppLocalizations.of(context).developer),
                leading: const Icon(Icons.developer_board),
                onTap: () => Navigator.of(context).push(PlatformPageRoute(
                    builder: (_) => const DeveloperSettingsPage())),
              )
            : const SizedBox.shrink(),
      ),
      const BuildDetailsWidget(),
      const Gap(32),
      Padding(
        key: const Key('settings-bottom-info'),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            '© Copyright Gaëtan Schwartz 2020',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    ];

    return PlatformBuilder(
        cupertinoBuilder: (context, child) => Material(
              child: CupertinoPageScaffold(
                resizeToAvoidBottomInset: false,
                navigationBar: SwiftCupertinoBar(
                  middle: Text(AppLocalizations.of(context).settings),
                ),
                backgroundColor: SettingsColor.background.resolveFrom(context),
                child: child!,
              ),
            ),
        materialBuilder: (context, child) => Scaffold(body: child),
        builder: (context, design) => Padding(
              padding: const EdgeInsets.all(8),
              child: CustomScrollView(
                key: const Key('settings-scrollview'),
                slivers: [
                  if (design == PlatformDesign.material)
                    SliverAppBar(
                      title: Text(AppLocalizations.of(context).settings),
                      pinned: true,
                      elevation: 8,
                    ),
                  SliverSafeArea(
                    top: design == PlatformDesign.cupertino,
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) => children[i],
                        childCount: children.length,
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}

class SettingsColor {
  final Color light;
  final Color dark;

  const SettingsColor({required this.light, required this.dark});

  static const background = SettingsColor(
    light: CupertinoColors.systemGrey6,
    dark: CupertinoColors.systemBackground,
  );

  static const tile = SettingsColor(
    light: CupertinoColors.systemBackground,
    dark: CupertinoColors.darkBackgroundGray,
  );

  Color resolveFrom(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    switch (brightness) {
      case Brightness.dark:
        return dark;
      case Brightness.light:
        return light;
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

final _tapCountProvider = StateProvider((ref) => 0);

final isDeveloperProvider =
    ChangeNotifierProvider((ref) => ref.watch(preferencesProvider).isDeveloper);

class BuildDetailsWidget extends StatelessWidget {
  const BuildDetailsWidget({
    Key? key,
  }) : super(key: key);

  void onTap(BuildContext context) {
    final controller = context.read(_tapCountProvider);

    if (controller.state == 6) {
      context.read(preferencesProvider).isDeveloper.setValue(true);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You are now a developer 😎")));
    } else {
      controller.state++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      dense: true,
      title: const Text(commitMessage),
      subtitle: const Text('$buildNumber • $commitBuildDate\n$commitHash'),
      onTap: () => onTap(context),
    );
  }
}

class ColorRow extends StatelessWidget {
  const ColorRow(
    this.colorScheme, {
    Key? key,
  }) : super(key: key);

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SizedBox.fromSize(
                  size: const Size.square(30),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: colorScheme.brightness == Brightness.light
                        ? const Icon(CupertinoIcons.brightness)
                        : const Icon(CupertinoIcons.moon_stars),
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: _ColorCircle(colorScheme.primary)),
          Expanded(child: _ColorCircle(colorScheme.secondary)),
        ],
      ),
    );
  }
}

class _ColorCircle extends StatelessWidget {
  const _ColorCircle(
    this.color, {
    Key? key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SizedBox.fromSize(
          size: const Size.square(30),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: color, blurRadius: 8)],
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScrollProgress extends StatefulWidget {
  const _ScrollProgress({
    required ScrollController controller,
    Key? key,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;

  @override
  __ScrollProgressState createState() => __ScrollProgressState();
}

class __ScrollProgressState extends State<_ScrollProgress> {
  double progress = 0;
  late Color color;

  void update() {
    if (mounted) {
      final p = widget._controller.position.pixels /
          widget._controller.position.maxScrollExtent;
      setState(() => progress = math.min(1, p));
    }
  }

  @override
  void initState() {
    super.initState();
    widget._controller.addListener(update);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    color = Theme.of(context).colorScheme.onSurface;
  }

  @override
  void dispose() {
    widget._controller.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LinearProgressIndicator(
        value: progress,
        valueColor: AlwaysStoppedAnimation(color),
        backgroundColor: Colors.transparent,
      );
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
          child: Container(
            key: Key('mode-${describeEnum(mode).toLowerCase()}'),
            decoration: BoxDecoration(
                boxShadow: shadowListOf(context),
                color: mode == ThemeMode.system ? null : t.cardColor,
                border: theme.themeMode == mode
                    ? Border.all(
                        width: 2,
                        color: primaryColor(context),
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
                            0.5
                          ])
                    : null,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Center(
              child: mode == ThemeMode.system
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          color: Colors.white30,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8, top: 4),
                            child: Text(
                              label,
                              style: t.textTheme.headline6!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Text(label, style: t.textTheme.headline6),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    Key? key,
  }) : super(key: key);
  final Widget title;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: primaryColor(context)),
          textAlign: TextAlign.left,
          child: title,
        ),
      );
}
