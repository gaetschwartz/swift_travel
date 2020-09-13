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
              return ListTile(
                title: const Text("Mode"),
                trailing: DropdownButton<ThemeMode>(
                    value: theme.mode,
                    items: ThemeMode.values
                        .map((m) => DropdownMenuItem<ThemeMode>(
                              value: m,
                              child: Text(_themeModeToString(m)),
                            ))
                        .toList(),
                    onChanged: (mode) => theme.mode = mode),
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
          ],
        ));
  }
}

String _themeModeToString(ThemeMode t) {
  switch (t) {
    case ThemeMode.system:
      return "System";
    case ThemeMode.light:
      return "Light";
    case ThemeMode.dark:
      return "Dark";
    default:
      return "";
  }
}
