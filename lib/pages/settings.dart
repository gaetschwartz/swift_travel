import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/blocs/preferences.dart';
import 'package:swiss_travel/utils/build.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/confirmation_alert.dart';

class Settings extends StatelessWidget {
  const Settings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          leading: const CloseButton(),
        ),
        body: ListView(
          children: [
            const _SectionTitle(title: Text("Options")),
            Consumer(builder: (context, w, _) {
              final theme = w(dynamicTheme);
              return Column(
                children: [
                  const ListTile(
                    title: Text("Mode"),
                    dense: true,
                  ),
                  RadioListTile<ThemeMode>(
                      key: const Key("light"),
                      dense: true,
                      title: const Text("Light mode"),
                      value: ThemeMode.light,
                      groupValue: theme.mode,
                      onChanged: (mode) => theme.mode = mode),
                  RadioListTile<ThemeMode>(
                      key: const Key("dark"),
                      dense: true,
                      title: const Text("Dark mode"),
                      value: ThemeMode.dark,
                      groupValue: theme.mode,
                      onChanged: (mode) => theme.mode = mode),
                  RadioListTile<ThemeMode>(
                      dense: true,
                      title: const Text("System mode"),
                      value: ThemeMode.system,
                      groupValue: theme.mode,
                      onChanged: (mode) => theme.mode = mode),
                ],
              );
            }),
            Consumer(builder: (context, w, _) {
              final theme = w(dynamicTheme);
              return ListTile(
                title: const Text("Theme"),
                trailing: DropdownButton<String>(
                  value: theme.name,
                  items: theme.configuration.themes.keys
                      .map((m) => DropdownMenuItem<String>(
                            value: m,
                            child: Text(theme.configuration.themes[m].name),
                          ))
                      .toList(),
                  onChanged: (n) => theme.name = n,
                ),
              );
            }),
            if (!kReleaseMode || Platform.isIOS)
              Consumer(builder: (context, w, _) {
                final maps = w(mapsAppProvider);
                return Column(
                  children: [
                    const ListTile(title: Text("Maps")),
                    RadioListTile<Maps>(
                      dense: true,
                      title: const Text("Apple Maps"),
                      value: Maps.apple,
                      groupValue: maps.mapsApp,
                      onChanged: (m) => onMapsChanged(maps, m),
                    ),
                    RadioListTile<Maps>(
                      dense: true,
                      title: const Text("Google Maps"),
                      value: Maps.google,
                      groupValue: maps.mapsApp,
                      onChanged: (m) => onMapsChanged(maps, m),
                    ),
                  ],
                );
              }),
            const Divider(
              indent: 16,
              endIndent: 16,
            ),
            const _SectionTitle(title: Text("More")),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.users),
              title: const Text("The team"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TeamPage()));
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.fileCode),
              title: const Text("Open source"),
              onTap: () => showLicensePage(context: context, applicationIcon: const FlutterLogo()),
            ),
            const Divider(
              indent: 16,
              endIndent: 16,
            ),
            const _SectionTitle(title: Text("Developer")),
            if (kDebugMode) ...[
              ListTile(
                  leading: const Icon(Icons.warning),
                  title: const Text("Crash"),
                  onTap: () async {
                    await FirebaseCrashlytics.instance.log("We trigger a crash");
                    FirebaseCrashlytics.instance.crash();
                  }),
            ],
            ListTile(
                leading: const Icon(Icons.restore),
                title: const Text("Reset settings"),
                onTap: () async {
                  final c = await confirm(context,
                      title: const Text("Reset settings ?"),
                      content: const Text("You will lose all of you favorites!"),
                      isConfirmDestructive: true);
                  if (c != true) return;
                  final prefs = await SharedPreferences.getInstance();
                  final b = await prefs.clear();
                  log("Done : $b");
                  SystemNavigator.pop(animated: true);
                }),
            const ListTile(
              isThreeLine: true,
              dense: true,
              title: Text(commitMessage),
              subtitle: Text("$buildNumber • $commitBuildDate\n$commitHash"),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "© Copyright Gaëtan Schwartz 2020",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
          ],
        ));
  }

  void onMapsChanged(PreferencesBloc maps, Maps m) {
    maps.mapsApp = m;
  }
}

class TeamPage extends StatelessWidget {
  const TeamPage({
    Key key,
  }) : super(key: key);

  static const coders = <Coder>[
    Coder(
      "Gaëtan Schwartz",
      role: "Lead Developer,\nApp Designer",
      twitterUrl: "https://twitter.com/gaetschwartz",
      imageUrl: "https://pbs.twimg.com/profile_images/1307716781356834818/kwCKuS7q_400x400.jpg",
      website: "https://gaetanschwartz.com/#/",
    ),
    Coder(
      "Vincent Tarrit",
      role: "Developer",
      imageUrl:
          "https://i2.wp.com/www.tarrit.com/wp-content/uploads/2018/11/cropped-Vincent-Tarrit3petitblanc-2-1.jpg?w=512",
      website: "https://tarrit.com/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("The team")),
      body: ListView.builder(
          itemCount: coders.length,
          itemBuilder: (context, i) {
            final c = coders[i];
            return ListTile(
              title: Text(c.name),
              leading: SizedBox(
                height: 48,
                width: 48,
                child: CircleAvatar(
                  backgroundImage:
                      c.imageUrl == null ? null : CachedNetworkImageProvider(c.imageUrl),
                  child: c.imageUrl == null ? const FaIcon(FontAwesomeIcons.user) : null,
                ),
              ),
              subtitle: c.role == null ? null : Text(c.role),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                if (c.website != null)
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.paperclip),
                      onPressed: () => launch(c.website)),
                if (c.twitterUrl != null)
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.twitter),
                      onPressed: () => launch(c.twitterUrl)),
              ]),
              isThreeLine: true,
            );
          }),
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

  const Coder(this.name, {this.twitterUrl, this.role, this.imageUrl, this.website});
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
