import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swiss_travel/utils/build.dart';
import 'package:utils/blocs/theme_riverpod.dart';
import 'package:utils/dialogs/confirmation_alert.dart';

final _initValue = FutureProvider<Maps>((r) async {
  final prefs = await SharedPreferences.getInstance();
  final i = prefs.getInt("maps_app");
  return Maps.values[i];
});

final _appleMapsProvider = StateProvider<Maps>((r) {
  final watch = r.watch(_initValue);
  return watch.map<Maps>(
      data: (d) => d.data.value,
      loading: (l) => Maps.apple,
      error: (e) => Maps.apple);
});

enum Maps { apple, google }

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
                      dense: true,
                      title: const Text("Light mode"),
                      value: ThemeMode.light,
                      groupValue: theme.mode,
                      onChanged: (mode) => theme.mode = mode),
                  RadioListTile<ThemeMode>(
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
                final maps = w(_appleMapsProvider);
                return Column(
                  children: [
                    const ListTile(title: Text("Maps")),
                    RadioListTile<Maps>(
                      dense: true,
                      title: const Text("Apple Maps"),
                      value: Maps.apple,
                      groupValue: maps.state,
                      onChanged: (m) => onMapsChanged(maps, m),
                    ),
                    RadioListTile<Maps>(
                      dense: true,
                      title: const Text("Google Maps"),
                      value: Maps.google,
                      groupValue: maps.state,
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
            const ListTile(title: Text("The team")),
            ListTile(
              title: const Text("Open source"),
              onTap: () => showLicensePage(
                  context: context, applicationIcon: const FlutterLogo()),
            ),
            const Divider(
              indent: 16,
              endIndent: 16,
            ),
            const _SectionTitle(title: Text("Developer")),
            if (kDebugMode) ...[
              ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text("Test"),
                  onTap: () async {
                    log(Firebase.app().options.toString());
                  }),
              ListTile(
                  leading: const Icon(Icons.warning),
                  title: const Text("Crash"),
                  onTap: () async {
                    await FirebaseCrashlytics.instance
                        .log("We trigger a crash");
                    FirebaseCrashlytics.instance.crash();
                  }),
            ],
            ListTile(
                leading: const Icon(Icons.restore),
                title: const Text("Reset settings"),
                onTap: () async {
                  final c = await confirm(context,
                      title: const Text("Reset settings ?"),
                      content:
                          const Text("You will lose all of you favorites!"),
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

  Future<void> onMapsChanged(StateController<Maps> maps, Maps m) async {
    final prefs = await SharedPreferences.getInstance();
    maps.state = m;
    await prefs.setInt("maps_app", m.index);
  }
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
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Theme.of(context).accentColor),
          child: title),
    );
  }
}
