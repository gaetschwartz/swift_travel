import 'dart:developer';
import 'dart:math' show min;
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/choice_page.dart';
import 'package:swift_travel/utils/env.dart';
import 'package:swift_travel/utils/route_uri.dart';
import 'package:swift_travel/utils/search.dart';
import 'package:theming/dialogs/confirmation_alert.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

class Settings extends StatefulWidget {
  const Settings();

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final children = <WidgetBuilder>[
    (context) => _SectionTitle(title: Text(Strings.of(context).brightness)),
    (_) => SizedBox(
          height: 100,
          child: Consumer(builder: (context, w, _) {
            final theme = w(dynamicTheme);
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _ModeWidget(
                  theme: theme,
                  label: Strings.of(context).brightness_system,
                  mode: ThemeMode.system,
                ),
                _ModeWidget(
                  theme: theme,
                  label: Strings.of(context).brightness_light,
                  mode: ThemeMode.light,
                ),
                _ModeWidget(
                  theme: theme,
                  label: Strings.of(context).brightness_dark,
                  mode: ThemeMode.dark,
                ),
              ],
            );
          }),
        ),
    (context) => _SectionTitle(title: Text(Strings.of(context).font)),
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
                        theme.font = f;
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
    (_) => const _FontWeightWidget(),
    (context) => _SectionTitle(title: Text(Strings.of(context).themes)),
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
                    title: Text(Strings.of(context).maps_app),
                    onTap: () async {
                      await Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => ChoicePage<Maps>(
                                items: const [
                                  ChoicePageItem(value: Maps.apple, child: Text('Apple Maps')),
                                  ChoicePageItem(value: Maps.google, child: Text('Google Maps')),
                                ],
                                value: maps.mapsApp,
                                title: Text(Strings.of(context).maps_app),
                                onChanged: (a) {
                                  if (a != null) maps.mapsApp = a;
                                },
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
                title: Text(Strings.of(context).navigation_api),
                onTap: () async {
                  await Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => ChoicePage<NavigationApiType>(
                            items: NavigationApiType.values
                                .map((e) => ChoicePageItem(
                                    child: Text(NavigationApi.getFactory(e).name), value: e))
                                .toList(),
                            value: prefs.api,
                            title: Text(Strings.of(context).navigation_api),
                            description: const Text(
                                'BETA: In the future the goal is to add more countries.'),
                            onChanged: (a) {
                              if (a != null) prefs.api = a;
                            },
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
    (context) => _SectionTitle(title: Text(Strings.of(context).more)),
    (context) => ListTile(
          leading: const Icon(CupertinoIcons.person_3_fill),
          title: Text(Strings.of(context).our_team),
          onTap: () => Navigator.of(context).pushNamed('/ourTeam'),
        ),
    (context) => ListTile(
        leading: const Icon(Icons.restore),
        title: Text(Strings.of(context).reset_settings),
        onTap: () async {
          final c = await confirm(
            context,
            title: const Text('Reset settings ?'),
            content: const Text('You will lose all of you favorites!'),
            isConfirmDestructive: true,
            confirm: Text(Strings.of(context).yes),
            cancel: Text(Strings.of(context).no),
          );
          if (c != true) return;
          final prefs = await SharedPreferences.getInstance();
          final b = await prefs.clear();
          log('Done : $b');
          unawaited(SystemNavigator.pop(animated: true));
        }),
    (_) => const Divider(),
    (context) => (isDebugMode)
        ? Column(children: [
            _SectionTitle(title: Text(Strings.of(context).developer)),
            ListTile(
                leading: const Icon(Icons.search),
                title: const Text('texst'),
                onTap: () async {
                  final s = await input(context, title: const Text('la question'));
                  if (s == null) return;
                  print(s);
                  final out = decodeRouteUri(Uri.parse(s));
                  print(out);
                }),
            ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Search'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => SearchPage(
                          controller: TextEditingController(),
                        )))),
            ListTile(
                leading: const Icon(Icons.warning_rounded),
                title: const Text('Throw a Flutter error'),
                onTap: () => throw StateError('Debug error')),
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
          ])
        : const SizedBox(),
    (_) => const ListTile(
          isThreeLine: true,
          dense: true,
          title: Text(commitMessage),
          subtitle: Text('$buildNumber • $commitBuildDate\n$commitHash'),
        ),
    (_) => const SizedBox(height: 32),
    (context) => Padding(
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
    return DividerTheme(
      data: const DividerThemeData(indent: 16, endIndent: 16),
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(Strings.of(context).settings),
            pinned: true,
            snap: true,
            floating: true,
            flexibleSpace: const SizedBox(),
          ),
          SliverSafeArea(
            top: false,
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

String _mapsName(Maps m) {
  switch (m) {
    case Maps.apple:
      return 'Apple Maps';
    case Maps.google:
      return 'Google Maps';
  }
  return '';
}

class _FontWeightWidget extends StatelessWidget {
  const _FontWeightWidget({
    Key key,
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
                style: t.apply(fontWeightDelta: -1),
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
              theme.fontWeightDelta = i;
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
    Key key,
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
                  margin: const EdgeInsets.only(bottom: 16, right: 8, left: 8),
                  width: 120,
                  decoration: BoxDecoration(
                    boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
                    color: Theme.of(context).cardColor,
                    borderRadius: radius,
                    border: ft == theme.theme
                        ? Border.all(width: 2, color: Theme.of(context).accentColor)
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
    Key key,
    @required ScrollController controller,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;

  @override
  __ScrollProgressState createState() => __ScrollProgressState();
}

class __ScrollProgressState extends State<_ScrollProgress> {
  double _progress = 0;
  Color color;

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

class _ModeWidget extends StatelessWidget {
  const _ModeWidget({
    Key key,
    @required this.theme,
    @required this.mode,
    @required this.label,
  }) : super(key: key);

  final DynamicTheme theme;
  final ThemeMode mode;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: DynamicTheme.resolve(context, mode, theme.theme),
      child: Builder(builder: (context) {
        final linearGradient =
            LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
          theme.theme.light.background,
          theme.theme.dark.background,
        ], stops: const [
          0.5,
          0.5
        ]);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: InkWell(
            onTap: () => theme.mode = mode,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                key: Key('mode-$label'),
                decoration: BoxDecoration(
                    boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
                    color: mode == ThemeMode.system ? null : Theme.of(context).cardColor,
                    border: theme.mode == mode
                        ? Border.all(
                            width: 2,
                            color: Theme.of(context).accentColor,
                          )
                        : null,
                    gradient: mode == ThemeMode.system ? linearGradient : null,
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
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 4),
                                child: Text(
                                  label,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        )
                      : buildText(context),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Text buildText(BuildContext context) {
    return Text(label, style: Theme.of(context).textTheme.headline6);
  }
}

class DiagonalPainter extends CustomPainter {
  final Color black;
  final Color white;
  final String label;

  DiagonalPainter({this.label, this.black, this.white});

  @override
  void paint(Canvas canvas, Size size) {
    final lightP = Paint()..color = white;
    final blackP = Paint()..color = black;

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
    Key key,
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
        title: Text(Strings.of(context).our_team),
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
    Key key,
    @required this.c,
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
                  ? AssetImage(c.imageUrl) as ImageProvider
                  : CachedNetworkImageProvider(c.imageUrl),
          child: c.imageUrl == null ? const FaIcon(FontAwesomeIcons.user) : null,
        ),
      ),
      subtitle: c.role == null ? null : Text(c.role),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        if (c.website != null)
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.paperclip), onPressed: () => launch(c.website)),
        if (c.twitterUrl != null)
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.twitter), onPressed: () => launch(c.twitterUrl)),
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
  final String twitterUrl;
  final String role;
  final String imageUrl;
  final String website;
  final String email;
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
    Key key,
    @required this.title,
  }) : super(key: key);
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
      child: DefaultTextStyle(
          style:
              Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).accentColor),
          child: title),
    );
  }
}
