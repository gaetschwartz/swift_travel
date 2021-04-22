import 'dart:developer';
import 'dart:math' show min;
import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedantic/pedantic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/constants/build.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/page_not_found.dart';
import 'package:swift_travel/pages/settings/properties/tile.dart';
import 'package:swift_travel/pages/settings/route_history.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/colors.dart';
import 'package:swift_travel/utils/crawler.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/modal.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:vibration/vibration.dart';

import 'properties/property.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final children = <WidgetBuilder>[
    (context) => _SectionTitle(title: Text(AppLoc.of(context).brightness)),
    (_) => SizedBox(
          key: const Key('settings-top-theme-section'),
          height: 100,
          child: Builder(builder: (context) {
            final theme = DynamicTheme.of(context);
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _ThememodeWidget(
                  theme: theme,
                  label: AppLoc.of(context).brightness_system,
                  mode: ThemeMode.system,
                ),
                _ThememodeWidget(
                  theme: theme,
                  label: AppLoc.of(context).brightness_light,
                  mode: ThemeMode.light,
                ),
                _ThememodeWidget(
                  theme: theme,
                  label: AppLoc.of(context).brightness_dark,
                  mode: ThemeMode.dark,
                ),
              ],
            );
          }),
        ),
    (context) => _SectionTitle(title: Text(AppLoc.of(context).themes)),
    (_) => const _ThemesSection(),
    (context) => _SectionTitle(title: Text(AppLoc.of(context).font)),
    (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Icon(CupertinoIcons.textformat_abc),
                const SizedBox(width: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Builder(builder: (context) {
                    final theme = DynamicTheme.of(context);
                    return DropdownButton<Font>(
                      icon: const SizedBox(),
                      value: theme.font,
                      items: theme.configuration.fonts
                          .map(
                            (f) => DropdownMenuItem(
                                value: f,
                                child: f == theme.font
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: Text(f.name,
                                                style: f
                                                    .textTheme(Typography.englishLike2018)
                                                    .bodyText1),
                                          ),
                                          const Icon(CupertinoIcons.checkmark_alt)
                                        ],
                                      )
                                    : Text(f.name,
                                        style: f.textTheme(Typography.englishLike2018).bodyText1)),
                          )
                          .toList(growable: false),
                      selectedItemBuilder: (context) => fonts
                          .map<Widget>(
                              (f) => Align(alignment: Alignment.centerLeft, child: Text(f.name)))
                          .toList(growable: false),
                      onChanged: (f) {
                        if (f == null) {
                          return;
                        }
                        Vibration.select();
                        theme.fontIndex = theme.configuration.fonts.indexOf(f);
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
    (context) {
      final theme = DynamicTheme.of(context);
      const map = {-1: 'Light', 0: 'Normal', 1: 'Medium', 3: 'Bold'};
      // final t = theme.font
      //     .textTheme(Typography.material2018(platform: Theme.of(context).platform).englishLike)
      //     .bodyText1!;
      return PropertyTile<int>(
        Property<int>(
          onSet: (delta) => theme.fontWeightDelta = delta,
          defaultValue: theme.fontWeightDelta,
        ),
        title: const Text('Font weight'),
        items: map.keys
            .map((key) => ActionsSheetAction<int>(
                value: key,
                title: Text(
                  map[key]!,
                  //   style: t.apply(fontWeightDelta: key),
                )))
            .toList(growable: false),
        trailingBuilder: (i) => Text(map[i] ?? ''),
      );
    },
    (context) {
      final theme = DynamicTheme.of(context);
      final p = defaultTargetPlatform;
      return PropertyTile<TargetPlatform>(
        Property<TargetPlatform>(
          onSet: (p) => theme.platform = p,
          defaultValue: theme.platform,
        ),
        trailingBuilder: (v) => Text(platformNames[v] ?? describeEnum(v)),
        title: const Text('Platform'),
        items: p == TargetPlatform.iOS || p == TargetPlatform.android
            ? const [
                ActionsSheetAction(value: TargetPlatform.android, title: Text('Android')),
                ActionsSheetAction(value: TargetPlatform.iOS, title: Text('iOS')),
              ]
            : const [
                ActionsSheetAction(value: TargetPlatform.macOS, title: Text('MacOS')),
                ActionsSheetAction(value: TargetPlatform.windows, title: Text('Windows')),
              ],
      );
    },
    (context) {
      if (isDebugMode || Theme.of(context).platform == TargetPlatform.iOS) {
        return PropertyTile<Maps>(
          context.read(preferencesProvider).mapsApp,
          title: Text(AppLoc.of(context).maps_app),
          icon: const Icon(Icons.map_rounded),
          items: const [
            ActionsSheetAction(value: Maps.apple, title: Text('Apple Maps')),
            ActionsSheetAction(value: Maps.google, title: Text('Google Maps')),
          ],
          trailingBuilder: (v) => Text(_mapsName(v)),
        );
      } else {
        return const SizedBox();
      }
    },
    (context) {
      final items = NavigationApi.values
          .map((e) =>
              ActionsSheetAction(title: Text(BaseNavigationApi.getFactory(e).name), value: e))
          .toList(growable: false);
      return PropertyTile<NavigationApi>(
        context.read(preferencesProvider).api,
        items: items,
        title: Text(AppLoc.of(context).navigation_api),
        icon: const Icon(CupertinoIcons.link),
        trailingBuilder: (v) => Text(BaseNavigationApi.getFactory(v).shortDesc),
        pageDescription: const Text('BETA: In the future the goal is to add more countries.'),
      );
    },
    (context) {
      final items = [
        const ActionsSheetAction(value: true, title: Text('True')),
        const ActionsSheetAction(value: false, title: Text('True')),
      ];
      return PropertyTile<bool>(
        context.read(preferencesProvider).useAnalytics,
        items: items,
        title: const Text('Use analytics'),
        icon: const Icon(CupertinoIcons.list_bullet),
        subtitle: const Text('The app collects anonymized crash reports'),
      );
    },
    (_) => const Divider(height: 0),
    (context) => _SectionTitle(title: Text(AppLoc.of(context).more)),
    (context) => ListTile(
          leading: const Icon(CupertinoIcons.person_3_fill),
          title: Text(AppLoc.of(context).our_team),
          onTap: () => Navigator.of(context).pushNamed('/ourTeam'),
        ),
    (context) => ListTile(
        leading: const Icon(Icons.restore),
        title: Text(AppLoc.of(context).reset_settings),
        onTap: () async {
          final c = await confirm(
            context,
            title: const Text('Reset settings ?'),
            content: const Text('You will lose all of you favorites!'),
            isConfirmDestructive: true,
            confirm: Text(AppLoc.of(context).yes),
            cancel: Text(AppLoc.of(context).no),
          );
          if (c != true) {
            return;
          }
          final prefs = await SharedPreferences.getInstance();
          final b = await prefs.clear();
          log('Done : $b');
          unawaited(SystemNavigator.pop(animated: true));
        }),
    (_) => const Divider(),
    (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(title: Text(AppLoc.of(context).developer)),
            ListTile(
                leading: const Icon(Icons.slideshow),
                title: const Text('Test dialog'),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push<void>(
                    BlurryModalRoute(
                      const AlertDialog(
                        title: Text('Hello'),
                        content: Text('World'),
                      ),
                    ),
                  );
                }),
            ListTile(
                leading: const Icon(CupertinoIcons.search),
                title: const Text('Attributes crawler'),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    PlatformPageRoute(
                      builder: (context) => const CrawlerPage(),
                    ),
                  );
                }),
            ListTile(
                leading: const Icon(CupertinoIcons.clock),
                title: const Text('Route history'),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    PlatformPageRoute(
                      builder: (context) => const RouteHistoryPage(),
                    ),
                  );
                }),
            ListTile(
              leading: const Icon(CupertinoIcons.clear),
              title: const Text('Clear history'),
              onTap: RouteHistoryRepository.i.clear,
            ),
            ListTile(
                leading: const Icon(Icons.screen_lock_landscape),
                title: const Text('Screen info'),
                onTap: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) => Theme(
                        data: ThemeData.light(),
                        child: Builder(builder: (context) => const _ScreenPage()),
                      ),
                    ),
                  );
                }),
            ListTile(
                leading: const Icon(Icons.warning_rounded),
                title: const Text('Throw a Flutter error'),
                onTap: () => throw StateError('Debug error')),
            ListTile(
                leading: const Icon(Icons.warning_rounded),
                title: const Text('Throw a Dart error'),
                onTap: () {
                  try {
                    throw const IntegerDivisionByZeroException();
                  } catch (e, s) {
                    reportDartError(e, s, library: 'settings', reason: 'voluntarirly');
                  }
                }),
            ListTile(
                leading: const Icon(Icons.open_in_browser),
                title: const Text('Open incorrect page'),
                onTap: () => Navigator.of(context).pushNamed('/thisIsNotACorrectPage')),
            ListTile(
                leading: const Icon(Icons.close),
                title: const Text('Trigger a crash'),
                onTap: () async {
                  await FirebaseCrashlytics.instance.log('We trigger a crash');
                  FirebaseCrashlytics.instance.crash();
                }),
          ],
        ),
    (_) => const ListTile(
          isThreeLine: true,
          dense: true,
          title: Text(commitMessage),
          subtitle: Text('$buildNumber • $commitBuildDate\n$commitHash'),
        ),
    (_) => const SizedBox(height: 32),
    (context) => Padding(
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

  @override
  Widget build(BuildContext context) => DividerTheme(
        data: const DividerThemeData(indent: 16, endIndent: 16),
        child: PlatformBuilder(
            cupertinoBuilder: (context, child) => Material(
                  child: CupertinoPageScaffold(
                    resizeToAvoidBottomInset: false,
                    navigationBar: SwiftCupertinoBar(
                      middle: Text(AppLoc.of(context).settings),
                    ),
                    child: child!,
                  ),
                ),
            materialBuilder: (context, child) => Scaffold(body: child),
            builder: (context, d) => CustomScrollView(
                  key: const Key('settings-scrollview'),
                  slivers: [
                    if (d == PlatformDesign.material)
                      SliverAppBar(
                        title: Text(AppLoc.of(context).settings),
                        pinned: true,
                      ),
                    SliverSafeArea(
                      top: d == PlatformDesign.cupertino,
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) => children[i](context),
                          childCount: children.length,
                        ),
                      ),
                    ),
                  ],
                )),
      );
}

class _ScreenPage extends StatelessWidget {
  const _ScreenPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            ErrorDataWidget('Screen size:', MediaQuery.of(context).size.toString()),
            ErrorDataWidget('Orientation:', MediaQuery.of(context).orientation.toString()),
            ErrorDataWidget(
                'Text scale factor:', MediaQuery.of(context).textScaleFactor.toString()),
            ErrorDataWidget('Pixel ratio:', MediaQuery.of(context).devicePixelRatio.toString()),
          ],
        ),
      );
}

String _mapsName(Maps m) {
  switch (m) {
    case Maps.apple:
      return 'Apple Maps';
    case Maps.google:
      return 'Google Maps';
  }
}

const platformNames = <TargetPlatform, String>{
  TargetPlatform.android: 'Android',
  TargetPlatform.iOS: 'iOS',
  TargetPlatform.macOS: 'MacOS',
  TargetPlatform.windows: 'Windows',
  TargetPlatform.linux: 'Linux',
  TargetPlatform.fuchsia: 'Fuchsia'
};

class _ThemesSection extends StatefulWidget {
  const _ThemesSection({
    Key? key,
  }) : super(key: key);

  @override
  __ThemesSectionState createState() => __ThemesSectionState();
}

class __ThemesSectionState extends State<_ThemesSection> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 150,
            child: Builder(builder: (context) {
              final theme = DynamicTheme.of(context);
              final list = theme.configuration.themes.entries.toList(growable: false);
              return ListView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, i) {
                  final ft = list[i].value;
                  const radius = BorderRadius.all(Radius.circular(16));
                  return Container(
                    key: const Key('theme-card'),
                    margin: const EdgeInsets.only(bottom: 16, right: 8, left: 8),
                    width: 120,
                    decoration: BoxDecoration(
                      boxShadow: shadowListOf(context),
                      color: Theme.of(context).cardColor,
                      borderRadius: radius,
                      border: ft == theme.theme
                          ? Border.all(width: 2, color: primaryColor(context))
                          : null,
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Vibration.select();
                        theme.name = list[i].key;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildColorRow(ft.light),
                                  buildColorRow(ft.dark),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    ft.name,
                                    style: Theme.of(context).textTheme.bodyText2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: _ScrollProgress(controller: _controller),
          ),
          const SizedBox(height: 8)
        ],
      );

  Widget buildColorRow(ColorScheme colorScheme) => ConstrainedBox(
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
            Expanded(child: colorCircle(colorScheme.primary)),
            Expanded(child: colorCircle(colorScheme.secondary)),
          ],
        ),
      );

  Widget colorCircle(Color color) => Center(
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
  double _progress = 0;
  late Color color;

  void update() {
    if (mounted) {
      final __progress =
          widget._controller.position.pixels / widget._controller.position.maxScrollExtent;
      setState(() => _progress = min(1, __progress));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    color = Theme.of(context).colorScheme.onSurface;
  }

  @override
  void initState() {
    super.initState();
    widget._controller.addListener(update);
  }

  @override
  void dispose() {
    widget._controller.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LinearProgressIndicator(
        value: _progress,
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
                    ? LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                        theme.theme.light.background,
                        theme.theme.dark.background,
                      ], stops: const [
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
                            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 4),
                            child: Text(
                              label,
                              style: t.textTheme.headline6!.copyWith(color: Colors.black),
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
          style: Theme.of(context).textTheme.headline6!.copyWith(color: primaryColor(context)),
          textAlign: TextAlign.left,
          child: title,
        ),
      );
}
