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
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/settings/pages/advanced.dart';
import 'package:swift_travel/settings/pages/customization.dart';
import 'package:swift_travel/settings/pages/developer.dart';
import 'package:swift_travel/settings/team_page.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/utils/colors.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/property_page.dart';
import 'package:swift_travel/widgets/route.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final children = [
      SectionTitle(title: Text(AppLocalizations.of(context).settings)),
      SwiftSettingsTile(
        tileBorders: const TileBorders(top: true),
        title: Text(AppLocalizations.of(context).customization),
        leading: const Icon(CupertinoIcons.wand_stars),
        onTap: () => Navigator.of(context).push(PlatformPageRoute(
          builder: (_) => const CustomizationSettingsPage(),
          title: AppLocalizations.of(context).customization,
        )),
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
        tileBorders: const TileBorders(bottom: true),
        options: NavigationApiFactory.factories
            .map(
              (e) => ValueOption(title: Text(e.name), value: NavigationApiId(e.id.value)),
            )
            .toList(growable: false),
        title: Text(AppLocalizations.of(context).navigation_api),
        leading: const Icon(CupertinoIcons.link),
        valueBuilder: (context, v) => Text(NavigationApiFactory.fromId(v).shortDesc),
        /* pageDescription: const Text(
            'BETA: In the future the goal is to add more countries.'),*/
      ),
      SectionTitle(title: Text(AppLocalizations.of(context).more)),
      SwiftSettingsTile(
        title: Text(AppLocalizations.of(context).advanced_settings),
        leading: const Icon(Icons.settings),
        onTap: () => Navigator.of(context).push(PlatformPageRoute(
          builder: (_) => const AdvancedSettingsPage(),
          title: AppLocalizations.of(context).advanced_settings,
        )),
        tileBorders: const TileBorders(top: true),
      ),
      Consumer(builder: (context, w, _) {
        final isDev = w.watch(isDeveloperProvider).value;
        return SwiftSettingsTile(
          tileBorders: TileBorders(bottom: !isDev),
          leading: const Icon(CupertinoIcons.person_3_fill),
          title: Text(AppLocalizations.of(context).our_team),
          onTap: () => Navigator.of(context, rootNavigator: true)
              .push(PlatformPageRoute(builder: (_) => const TeamPage())),
        );
      }),
      Consumer(
        builder: (context, w, _) => w.watch(isDeveloperProvider).value
            ? SwiftSettingsTile(
                tileBorders: const TileBorders(bottom: true),
                title: Text(AppLocalizations.of(context).developer),
                leading: const Icon(Icons.developer_board),
                onTap: () => Navigator.of(context).push(PlatformPageRoute(
                  builder: (_) => const DeveloperSettingsPage(),
                  title: AppLocalizations.of(context).developer,
                )),
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
            '© Copyright Gaëtan Schwartz ${DateTime.now().year}',
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
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("You are now a developer 😎")));
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
      final p = widget._controller.position.pixels / widget._controller.position.maxScrollExtent;
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
    Key? key,
  }) : super(key: key);
  final Widget title;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: DefaultTextStyle(
          style:
              Theme.of(context).textTheme.headline6!.copyWith(color: platformPrimaryColor(context)),
          textAlign: TextAlign.left,
          child: title,
        ),
      );
}
