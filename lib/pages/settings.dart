import 'dart:developer';
import 'dart:math' show min;
import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pedantic/pedantic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/constants/build.dart';
import 'package:swift_travel/db/database.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/page_not_found.dart';
import 'package:swift_travel/pages/search.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/predict/predict.dart';
import 'package:swift_travel/widgets/choice_page.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/modal.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage();

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final children = <WidgetBuilder>[
    (context) => _SectionTitle(title: Text(AppLoc.of(context).brightness)),
    (_) => SizedBox(
          key: const Key('settings-top-theme-section'),
          height: 100,
          child: Consumer(builder: (context, w, _) {
            final theme = w(dynamicTheme);
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _ModeWidget(
                  theme: theme,
                  label: AppLoc.of(context).brightness_system,
                  mode: ThemeMode.system,
                ),
                _ModeWidget(
                  theme: theme,
                  label: AppLoc.of(context).brightness_light,
                  mode: ThemeMode.light,
                ),
                _ModeWidget(
                  theme: theme,
                  label: AppLoc.of(context).brightness_dark,
                  mode: ThemeMode.dark,
                ),
              ],
            );
          }),
        ),
    (context) => _SectionTitle(title: Text(AppLoc.of(context).font)),
    (_) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Icon(CupertinoIcons.textformat_abc),
                const SizedBox(width: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Consumer(builder: (context, w, _) {
                    final theme = w(dynamicTheme);
                    return DropdownButton<Font>(
                      icon: const SizedBox(),
                      value: theme.font,
                      items: fonts
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
                                          const Icon(FluentIcons.checkmark_24_filled)
                                        ],
                                      )
                                    : Text(f.name,
                                        style: f.textTheme(Typography.englishLike2018).bodyText1)),
                          )
                          .toList(),
                      selectedItemBuilder: (context) => fonts
                          .map<Widget>(
                              (f) => Align(alignment: Alignment.centerLeft, child: Text(f.name)))
                          .toList(),
                      onChanged: (f) {
                        Vibration.select();
                        theme.font = f!;
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
    (_) => const _PlaformChoiceWidget(),
    (_) => const _FontWeightWidget(),
    (context) => _SectionTitle(title: Text(AppLoc.of(context).themes)),
    (_) => const _ThemesSection(),
    (context) => (isDebugMode || Theme.of(context).platform == TargetPlatform.iOS)
        ? Column(children: [
            const Divider(),
            Consumer(builder: (context, w, _) {
              final maps = w(preferencesProvider);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(CupertinoIcons.map),
                    title: Text(AppLoc.of(context).maps_app),
                    onTap: () async {
                      await Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => ChoicePage<Maps>(
                                items: const [
                                  ChoicePageItem(value: Maps.apple, child: Text('Apple Maps')),
                                  ChoicePageItem(value: Maps.google, child: Text('Google Maps')),
                                ],
                                value: maps.mapsApp,
                                title: Text(AppLoc.of(context).maps_app),
                                onChanged: (a) => maps.mapsApp = a,
                              )));
                      log(maps.mapsApp.toString());
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _mapsName(maps.mapsApp),
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .copyWith(color: CupertinoColors.systemGrey),
                        ),
                        const SizedBox(width: 8),
                        const Icon(CupertinoIcons.chevron_forward),
                      ],
                    ),
                  ),
                ],
              );
            })
          ])
        : const SizedBox(),
    (_) => const Divider(),
    (_) => Consumer(builder: (context, w, _) {
          final prefs = w(preferencesProvider);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(CupertinoIcons.link),
                title: Text(AppLoc.of(context).navigation_api),
                onTap: () async {
                  await Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => ChoicePage<NavigationApiType>(
                            items: NavigationApiType.values
                                .map((e) => ChoicePageItem(
                                    child: Text(NavigationApi.getFactory(e).name), value: e))
                                .toList(),
                            value: prefs.api,
                            title: Text(AppLoc.of(context).navigation_api),
                            description: const Text(
                                'BETA: In the future the goal is to add more countries.'),
                            onChanged: (a) => prefs.api = a,
                          )));
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(NavigationApi.getFactory(prefs.api).shortDesc,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(color: CupertinoColors.systemGrey)),
                    const SizedBox(width: 8),
                    const Icon(CupertinoIcons.chevron_forward),
                  ],
                ),
              ),
            ],
          );
        }),
    (_) => const Divider(),
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
          if (c != true) return;
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
                  Navigator.of(context, rootNavigator: true).push(
                    BlurryModalRoute(
                      const AlertDialog(
                        title: Text('Hello'),
                        content: Text('World'),
                      ),
                    ),
                  );
                }),
            ListTile(
                leading: const Icon(CupertinoIcons.clock),
                title: const Text('Route history'),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    platformRoute(
                        builder: (context) => const RouteHistoryPage(),
                        isDarwin: Responsive.isDarwin(context)),
                  );
                }),
            ListTile(
                leading: const Icon(CupertinoIcons.clear),
                title: const Text('Clear history'),
                onTap: () {
                  RouteHistoryRepository.i.clear();
                }),
            ListTile(
                leading: const Icon(Icons.screen_lock_landscape),
                title: const Text('Screen info'),
                onTap: () {
                  Navigator.of(context).push(
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
          padding: const EdgeInsets.all(8.0),
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
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);
    return DividerTheme(
      data: const DividerThemeData(indent: 16, endIndent: 16),
      child: IfWrapper(
          condition: isDarwin,
          builder: (context, child) => Material(
                child: CupertinoPageScaffold(
                  child: child!,
                  resizeToAvoidBottomInset: false,
                  navigationBar: cupertinoBar(
                    context,
                    middle: Text(AppLoc.of(context).settings),
                  ),
                ),
              ),
          elseBuilder: (context, child) => Scaffold(body: child),
          child: CustomScrollView(
            key: const Key('settings-scrollview'),
            slivers: [
              if (!isDarwin)
                SliverAppBar(
                  title: Text(AppLoc.of(context).settings),
                  pinned: true,
                ),
              SliverSafeArea(
                top: isDarwin,
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

  void onMapsChanged(PreferencesBloc prefs, Maps m) => prefs.mapsApp = m;

  void onAPIChanged(PreferencesBloc prefs, NavigationApiType api) => prefs.api = api;
}

class RouteHistoryPage extends StatefulWidget {
  const RouteHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  _RouteHistoryPageState createState() => _RouteHistoryPageState();
}

const _days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

class _RouteHistoryPageState extends State<RouteHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final routes = RouteHistoryRepository.i.routes;
    final pred = predictRoute(routes, DateTime.now());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await RouteHistoryRepository.i.clear();
                setState(() {});
              })
        ],
      ),
      body: Column(
        children: [
          if (pred.prediction != null) ...[
            const Text('Predicted route :'),
            ListTile(
                title: Text('Confidence : ${(pred.confidence * 100).toStringAsFixed(2)} %'),
                subtitle: Text(pred.arguments.toString())),
            ListTile(
              title: Text(pred.prediction!.from),
              subtitle: Text(pred.prediction!.to),
            ),
            const Divider(),
          ],
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) => ListTile(
                title: Text(routes[i].from),
                subtitle: Text(routes[i].to),
                trailing: Text(
                    '${TimeOfDay.fromDateTime(routes[i].timestamp!).format(context)}, ${_days[routes[i].timestamp!.weekday - 1]}'),
              ),
              itemCount: routes.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _TestWidget extends StatefulWidget {
  const _TestWidget({
    Key? key,
  }) : super(key: key);

  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  final controller = TextEditingController();
  final tag = 'heniu';
  final focus = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(transitionBetweenRoutes: false),
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: tag,
                child: CupertinoTextField(
                  controller: controller,
                  focusNode: focus,
                  placeholder: AppLoc.of(context).search_station,
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                        builder: (_) => SearchPage(
                              binder: TextStateBinder(controller, null),
                              heroTag: tag,
                              configuration: CupertinoTextFieldConfiguration(focusNode: focus),
                            )));
                  },
                ),
              ),
            ),
          ),
        ));
  }
}

Color primaryColor(BuildContext context) => Responsive.isDarwin(context)
    ? CupertinoTheme.of(context).primaryColor
    : Theme.of(context).accentColor;

class _ScreenPage extends StatelessWidget {
  const _ScreenPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ErrorDataWidget('Screen size:', MediaQuery.of(context).size.toString()),
          ErrorDataWidget('Orientation:', MediaQuery.of(context).orientation.toString()),
          ErrorDataWidget('Text scale factor:', MediaQuery.of(context).textScaleFactor.toString()),
          ErrorDataWidget('Pixel ratio:', MediaQuery.of(context).devicePixelRatio.toString()),
        ],
      ),
    );
  }
}

String _mapsName(Maps m) {
  switch (m) {
    case Maps.apple:
      return 'Apple Maps';
    case Maps.google:
      return 'Google Maps';
  }
}

class _PlaformChoiceWidget extends StatelessWidget {
  const _PlaformChoiceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Consumer(builder: (context, w, _) {
          final theme = w(dynamicTheme);
          final p = defaultTargetPlatform;

          return CupertinoSlidingSegmentedControl<TargetPlatform>(
            children: p == TargetPlatform.android || p == TargetPlatform.iOS
                ? {
                    TargetPlatform.android: const Text(
                      'Android',
                      key: Key('platform-choice-android'),
                    ),
                    TargetPlatform.iOS: const Text(
                      'iOS',
                      key: Key('platform-choice-ios'),
                    ),
                  }
                : {
                    TargetPlatform.windows: const Text('Windows'),
                    TargetPlatform.macOS: const Text('MacOS'),
                  },
            groupValue: theme.platform,
            onValueChanged: (i) {
              theme.platform = i!;
              Vibration.select();
            },
          );
        }),
      ),
    );
  }
}

class _FontWeightWidget extends StatelessWidget {
  const _FontWeightWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = context
        .read(dynamicTheme)
        .font
        .textTheme(Typography.material2018(platform: Theme.of(context).platform).englishLike)
        .bodyText1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Consumer(builder: (context, w, _) {
          final theme = w(dynamicTheme);
          return CupertinoSlidingSegmentedControl<int>(
            children: {
              -1: Text(
                'Light',
                style: t!.apply(fontWeightDelta: -1),
              ),
              0: Text(
                'Normal',
                style: t.apply(fontWeightDelta: 0),
              ),
              1: Text(
                'Medium',
                style: t.apply(fontWeightDelta: 1),
              ),
              3: Text(
                'Bold',
                style: t.apply(fontWeightDelta: 3),
              ),
            },
            groupValue: theme.fontWeightDelta,
            onValueChanged: (i) {
              theme.fontWeightDelta = i!;
              Vibration.select();
            },
          );
        }),
      ),
    );
  }
}

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
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: Consumer(builder: (context, w, _) {
            final theme = w(dynamicTheme);
            final list = theme.configuration.themes.entries.toList();
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
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                              padding: const EdgeInsets.all(8.0),
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
  }

  Widget buildColorRow(ColorScheme colorScheme) {
    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox.fromSize(
                  size: const Size.square(30),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
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
  }

  Widget colorCircle(Color color) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox.fromSize(
          size: const Size.square(30),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
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
    Key? key,
    required ScrollController controller,
  })   : _controller = controller,
        super(key: key);

  final ScrollController _controller;

  @override
  __ScrollProgressState createState() => __ScrollProgressState();
}

class __ScrollProgressState extends State<_ScrollProgress> {
  double _progress = 0;
  Color? color;

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
        valueColor: AlwaysStoppedAnimation(color!),
        backgroundColor: Colors.transparent,
      );
}

class _ModeWidget extends StatelessWidget {
  const _ModeWidget({
    Key? key,
    required this.theme,
    required this.mode,
    required this.label,
  }) : super(key: key);

  final DynamicTheme theme;
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
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
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

class DiagonalPainter extends CustomPainter {
  final Color? black;
  final Color? white;
  final String? label;

  DiagonalPainter({this.label, this.black, this.white});

  @override
  void paint(Canvas canvas, Size size) {
    final lightP = Paint()..color = white!;
    final blackP = Paint()..color = black!;

    canvas.drawRect(Offset.zero & size, lightP);

    final topLeft = size.topLeft(Offset.zero);
    final bottomRight = size.bottomRight(Offset.zero);
    final bottomLeft = size.bottomLeft(Offset.zero);
    final p1 = Path();
    p1.lineTo(bottomLeft.dx, bottomLeft.dy);
    p1.lineTo(bottomRight.dx, bottomRight.dy);
    p1.lineTo(topLeft.dx, topLeft.dy);

    canvas.drawPath(p1, blackP);

    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
    );
    final textSpan = TextSpan(
      text: label,
      style: textStyle,
    );
    final textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr, textAlign: TextAlign.center);
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = size.center(Offset.zero);
    textPainter.layout();
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class TeamPage extends StatelessWidget {
  const TeamPage({
    Key? key,
  }) : super(key: key);

  static const primaryCoders = <Coder>[
    Coder(
      'Gaëtan Schwartz',
      role: 'Lead Developer\nApp Concept/Design',
      imageUrl: 'assets/profiles/gaetan.jpg',
      isAssets: true,
      website: 'https://gaetanschwartz.com/#/',
      email: 'gaetan.schwartz@gmail.com',
    ),
    Coder(
      'Vincent Tarrit',
      role: 'Icon Design\n',
      imageUrl:
          'https://i2.wp.com/www.tarrit.com/wp-content/uploads/2018/11/cropped-Vincent-Tarrit3petitblanc-2-1.jpg?w=512',
      website: 'https://tarrit.com/',
    ),
  ];

  static const secondaryCoders = <Coder>[
    Coder(
      'Abin W.',
      role: 'Beta-tester',
      imageUrl: 'assets/profiles/abin.jpeg',
      isAssets: true,
    ),
    Coder(
      'Alexandre S.',
      role: 'Beta-tester',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLoc.of(context).our_team),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                enableFeedback: true, padding: const EdgeInsets.symmetric(horizontal: 8)),
            onPressed: () =>
                showLicensePage(context: context, applicationIcon: const FlutterLogo()),
            child: Text(
              'View licenses',
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: primaryCoders.map((c) => _CoderTile(c: c)).toList(),
          ),
          ExpansionTile(
            title: const Text('Helpers'),
            children: secondaryCoders.map((c) => _CoderTile(c: c)).toList(),
          ),
        ],
      ),
    );
  }
}

class _CoderTile extends StatelessWidget {
  const _CoderTile({
    Key? key,
    required this.c,
  }) : super(key: key);

  final Coder c;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(c.name),
      leading: SizedBox(
        height: 48,
        width: 48,
        child: CircleAvatar(
          backgroundImage: c.imageUrl == null
              ? null
              : c.isAssets
                  ? AssetImage(c.imageUrl!) as ImageProvider
                  : NetworkImage(c.imageUrl!),
          child: c.imageUrl == null ? const FaIcon(FontAwesomeIcons.user) : null,
        ),
      ),
      subtitle: c.role == null ? null : Text(c.role!),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        if (c.website != null)
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.paperclip), onPressed: () => launch(c.website!)),
        if (c.twitterUrl != null)
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.twitter), onPressed: () => launch(c.twitterUrl!)),
        if (c.email != null)
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.envelope),
              onPressed: () => launch('mailto:${c.email}')),
      ]),
      isThreeLine: true,
    );
  }
}

@immutable
class Coder {
  final String name;
  final String? twitterUrl;
  final String? role;
  final String? imageUrl;
  final String? website;
  final String? email;
  final bool isAssets;

  const Coder(
    this.name, {
    this.isAssets = false,
    this.twitterUrl,
    this.role,
    this.imageUrl,
    this.website,
    this.email,
  });
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.headline6!.copyWith(color: primaryColor(context)),
        textAlign: TextAlign.left,
        child: title,
      ),
    );
  }
}
