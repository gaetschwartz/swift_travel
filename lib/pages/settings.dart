import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
            Consumer(builder: (context, w, _) {
              final theme = w(dynamicTheme);
              return Column(
                children: [
                  const ListTile(title: Text("Mode")),
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
            if (kDebugMode)
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
          ],
        ));
  }

  Future<void> onMapsChanged(StateController<Maps> maps, Maps m) async {
    final prefs = await SharedPreferences.getInstance();
    maps.state = m;
    await prefs.setInt("maps_app", m.index);
  }
}
