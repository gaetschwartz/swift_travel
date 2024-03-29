import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/constants/build.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/settings/pages/advanced.dart';
import 'package:swift_travel/settings/pages/customization.dart';
import 'package:swift_travel/settings/pages/developer.dart';
import 'package:swift_travel/settings/pages/in_app_purchases.dart';
import 'package:swift_travel/settings/team_page.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/utils/colors.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/property_page.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/responsive.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final children = [
      SectionTitle(title: Text(AppLocalizations.of(context).settings)),
      SwiftSettingsTile(
        tileBorders: const TileBorders(top: true),
        title: Text(AppLocalizations.of(context).customization),
        leading: const Icon(CupertinoIcons.wand_stars),
        onTap: () => unawaited(Navigator.of(context).push(PlatformPageRoute(
          builder: (_) => const CustomizationSettingsPage(),
          title: AppLocalizations.of(context).customization,
        ))),
      ),
      if (Env.isDebugMode || defaultTargetPlatform == TargetPlatform.iOS)
        SwiftSettingsPropertyTile<NavigationApp>(
          property: ref.read(preferencesProvider).mapsApp,
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
        property: ref.read(preferencesProvider).api,
        tileBorders: const TileBorders(bottom: true),
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
      SectionTitle(title: Text(AppLocalizations.of(context).more)),
      SwiftSettingsTile(
        title: Text(AppLocalizations.of(context).advanced_settings),
        leading: isThemeDarwin(context)
            ? const Icon(CupertinoIcons.settings)
            : const Icon(Icons.settings),
        onTap: () => unawaited(Navigator.of(context).push(PlatformPageRoute(
          builder: (_) => const AdvancedSettingsPage(),
          title: AppLocalizations.of(context).advanced_settings,
        ))),
        tileBorders: const TileBorders(top: true),
      ),
      // in app purchases
      SwiftSettingsTile(
        title: Text(AppLocalizations.of(context).support_me),
        leading: const Icon(Icons.favorite),
        onTap: () => unawaited(Navigator.of(context).push(PlatformPageRoute(
          builder: (_) => const InAppPurchasesPage(),
          title: AppLocalizations.of(context).support_me,
        ))),
      ),
      Consumer(builder: (context, w, _) {
        final isDev = w.watch(isDeveloperProvider).value;
        return SwiftSettingsTile(
          tileBorders: TileBorders(bottom: !isDev),
          leading: const Icon(CupertinoIcons.app_badge),
          title: Text(AppLocalizations.of(context).about_the_app),
          onTap: () => unawaited(
              Navigator.of(context, rootNavigator: true).push(PlatformPageRoute(
            builder: (_) => const TeamPage(),
            title: AppLocalizations.of(context).about_the_app,
          ))),
        );
      }),
      Consumer(
        builder: (context, ref, _) {
          return ref.watch(isDeveloperProvider).value
              ? SwiftSettingsTile(
                  tileBorders: const TileBorders(bottom: true),
                  title: Text(AppLocalizations.of(context).developer),
                  leading: const Icon(Icons.developer_board),
                  onTap: () =>
                      unawaited(Navigator.of(context).push(PlatformPageRoute(
                    builder: (_) => const DeveloperSettingsPage(),
                    title: AppLocalizations.of(context).developer,
                  ))),
                )
              : const SizedBox.shrink();
        },
      ),
      const BuildDetailsWidget(),
      const Gap(32),
      Padding(
        key: const Key('settings-bottom-info'),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            '© Copyright Gaëtan Schwartz ${DateTime.now().year}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
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

final _tapCountProvider = StateProvider((ref) => 0);

final isDeveloperProvider =
    ChangeNotifierProvider((ref) => ref.watch(preferencesProvider).isDeveloper);

class BuildDetailsWidget extends ConsumerWidget {
  const BuildDetailsWidget({
    super.key,
  });

  Future<void> onTap(BuildContext context, WidgetRef ref) async {
    final notifier = ref.read(_tapCountProvider.notifier);

    if (notifier.state >= minimumTapCount) {
      await ref.read(preferencesProvider).isDeveloper.setValue(true);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You are now a developer 😎')));
      }
    } else {
      notifier.state++;
    }
  }

  static const minimumTapCount = 7;

  bool isDeveloper(WidgetRef ref) =>
      ref.read(_tapCountProvider.notifier).state >= minimumTapCount ||
      ref.read(preferencesProvider).isDeveloper.value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      isThreeLine: true,
      dense: true,
      title: Text(commitMessage),
      subtitle: const Text('$buildNumber • $commitBuildDate\n$commitHash'),
      onTap: () async => onTap(context, ref),
      onLongPress: () async {
        if (isDeveloper(ref)) {
          await launchUrlString(
              'https://github.com/gaetschwartz/swift_travel/commit/$commitHash');
        }
      },
    );
  }
}

class ColorRow extends StatelessWidget {
  const ColorRow(
    this.colorScheme, {
    super.key,
  });

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
  const _ColorCircle(this.color);

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
  }) : _controller = controller;

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

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    super.key,
  });
  final Widget title;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: platformPrimaryColor(context)),
          textAlign: TextAlign.left,
          child: title,
        ),
      );
}
