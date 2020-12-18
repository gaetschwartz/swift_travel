import 'dart:developer';
import 'dart:math' show min;
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/blocs/preferences.dart';
import 'package:swift_travel/constants/build.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/confirmation_alert.dart';

class Settings extends StatelessWidget {
  const Settings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          leading: const CloseButton(),
        ),
        body: ListView(
          children: [
            const _SectionTitle(title: Text('Brightness')),
            SizedBox(
              height: 100,
              child: Consumer(builder: (context, w, _) {
                final theme = w(dynamicTheme);
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _ModeWidget(theme: theme, label: 'System', mode: ThemeMode.system),
                    _ModeWidget(theme: theme, label: 'Light', mode: ThemeMode.light),
                    _ModeWidget(theme: theme, label: 'Dark', mode: ThemeMode.dark),
                  ],
                );
              }),
            ),
            const _SectionTitle(title: Text('Themes')),
            const _ThemesSection(),
            if (!kReleaseMode || Theme.of(context).platform == TargetPlatform.iOS)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Consumer(builder: (context, w, _) {
                  final maps = w(preferencesProvider);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _SectionTitle(title: Text('Maps app')),
                      RadioListTile<Maps>(
                        dense: true,
                        title: const Text('Apple Maps'),
                        value: Maps.apple,
                        groupValue: maps.mapsApp,
                        onChanged: (m) => onMapsChanged(maps, m),
                      ),
                      RadioListTile<Maps>(
                        dense: true,
                        title: const Text('Google Maps'),
                        value: Maps.google,
                        groupValue: maps.mapsApp,
                        onChanged: (m) => onMapsChanged(maps, m),
                      ),
                    ],
                  );
                }),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Consumer(builder: (context, w, _) {
                final prefs = w(preferencesProvider);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SectionTitle(title: Text('Navigation API')),
                    RadioListTile<NavigationApiType>(
                      dense: true,
                      title: const Text('CFF'),
                      value: NavigationApiType.cff,
                      groupValue: prefs.api,
                      onChanged: (api) => onAPIChanged(prefs, api),
                    ),
                    RadioListTile<NavigationApiType>(
                      dense: true,
                      title: const Text('SNCF'),
                      value: NavigationApiType.sncf,
                      groupValue: prefs.api,
                      onChanged: (api) => onAPIChanged(prefs, api),
                    ),
                  ],
                );
              }),
            ),
            const Divider(
              indent: 16,
              endIndent: 16,
            ),
            const _SectionTitle(title: Text('More')),
            ListTile(
              leading: const Icon(FontAwesomeIcons.users),
              title: const Text('Our team'),
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TeamPage())),
            ),
            const Divider(
              indent: 16,
              endIndent: 16,
            ),
            const _SectionTitle(title: Text('Developer')),
            if (kDebugMode) ...[
              ListTile(
                  leading: const Icon(Icons.warning_rounded),
                  title: const Text('Throw a Flutter error'),
                  onTap: () => throw StateError('Debug error')),
              ListTile(
                  leading: const Icon(Icons.close),
                  title: const Text('Trigger a crash'),
                  onTap: () async {
                    await FirebaseCrashlytics.instance.log('We trigger a crash');
                    FirebaseCrashlytics.instance.crash();
                  }),
            ],
            ListTile(
                leading: const Icon(Icons.restore),
                title: const Text('Reset settings'),
                onTap: () async {
                  final c = await confirm(
                    context,
                    title: const Text('Reset settings ?'),
                    content: const Text('You will lose all of you favorites!'),
                    isConfirmDestructive: true,
                    confirm: const Text('Yes'),
                    cancel: const Text('No'),
                  );
                  if (c != true) return;
                  final prefs = await SharedPreferences.getInstance();
                  final b = await prefs.clear();
                  log('Done : $b');
                  SystemNavigator.pop(animated: true);
                }),
            const ListTile(
              isThreeLine: true,
              dense: true,
              title: Text(commitMessage),
              subtitle: Text('$buildNumber • $commitBuildDate\n$commitHash'),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '© Copyright Gaëtan Schwartz 2020',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
          ],
        ));
  }

  void onMapsChanged(PreferencesBloc prefs, Maps m) => prefs.mapsApp = m;
  void onAPIChanged(PreferencesBloc prefs, NavigationApiType api) => prefs.api = api;
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
          height: 250,
          child: Consumer(builder: (context, w, _) {
            final theme = w(dynamicTheme);
            final list = theme.configuration.themes.entries.toList();
            return ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, i) {
                final FullTheme ft = list[i].value;
                const BorderRadius radius = BorderRadius.all(Radius.circular(16));
                final String fontFamily = ft.light.textTheme.headline6.fontFamily;
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
                  child: SizedBox(
                    width: 160,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
                        color: Theme.of(context).cardColor,
                        borderRadius: radius,
                        border: ft == theme.theme
                            ? Border.all(width: 2, color: Theme.of(context).accentColor)
                            : null,
                      ),
                      child: InkWell(
                        hoverColor: Theme.of(context).accentColor.withOpacity(0.2),
                        borderRadius: radius,
                        onTap: () => theme.name = list[i].key,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      buildColorRow(ft.light),
                                      buildColorRow(ft.dark),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ft.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontFamily: fontFamily),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _ScrollProgress(controller: _controller),
        ),
      ],
    );
  }

  Widget buildColorRow(ThemeData d) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: d.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: d.accentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: d.cardColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
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

  void update() {
    if (mounted) {
      final __progress =
          widget._controller.position.pixels / widget._controller.position.maxScrollExtent;
      setState(() {
        _progress = min(1, __progress);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    widget._controller.addListener(update);
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(value: _progress);
  }
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
          theme.theme.light.cardColor,
          theme.theme.dark.cardColor,
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
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                              child: Text(label,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Colors.black)),
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
        title: const Text('The team'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(enableFeedback: true),
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
