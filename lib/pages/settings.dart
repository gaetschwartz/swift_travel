import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utils/blocs/theme_riverpod.dart';

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
          ],
        ));
  }
}
