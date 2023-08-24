// ignore_for_file: discarded_futures

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaets_logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/pages/page_not_found.dart';
import 'package:swift_travel/settings/route_history.dart';
import 'package:swift_travel/settings/widgets/settings_page_widget.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/terminal/terminal_widget.dart';
import 'package:swift_travel/utils/crawler.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/dialogs/confirmation_alert.dart';

class DeveloperSettingsPage extends StatefulWidget {
  const DeveloperSettingsPage({super.key});

  @override
  State<DeveloperSettingsPage> createState() => _DeveloperSettingsPageState();
}

class _DeveloperSettingsPageState extends State<DeveloperSettingsPage> {
  final log = Logger.of('DeveloperSettingsPage');
  Future<void> resetSettingsPrompt() async {
    final c = await confirm(
      context,
      title: const Text('Reset settings ?'),
      content: const Text('You will lose all of you favorites!'),
      isConfirmDestructive: true,
      confirm: Text(AppLocalizations.of(context).yes),
      cancel: Text(AppLocalizations.of(context).no),
    );
    if (!c) return;

    final prefs = await SharedPreferences.getInstance();
    final b = await prefs.clear();
    log.log('Done : $b');
    unawaited(SystemNavigator.pop(animated: true));
  }

  void openTerminal() {
    unawaited(Navigator.of(context, rootNavigator: true).push(
      PlatformPageRoute(
        builder: (context) => const TerminalPage(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SettingsPageWidget(
      title: Text(AppLocalizations.of(context).developer),
      children: [
        SwiftSettingsTile(
          leading: const Icon(Icons.restore),
          title: Text(AppLocalizations.of(context).reset_settings),
          onTap: resetSettingsPrompt,
          showChevron: false,
          tileBorders: const TileBorders(top: true),
        ),
        if (kDebugMode)
          SwiftSettingsTile(
            leading: const Icon(CupertinoIcons.search),
            title: const Text('Terminal'),
            onTap: openTerminal,
          ),
        SwiftSettingsTile(
            leading: const Icon(CupertinoIcons.search),
            title: const Text('Attributes crawler'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                PlatformPageRoute(
                  builder: (context) => const CrawlerPage(),
                ),
              );
            }),
        SwiftSettingsTile(
            leading: const Icon(CupertinoIcons.clock),
            title: const Text('Route history'),
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                PlatformPageRoute(
                  builder: (context) => const RouteHistoryPage(),
                ),
              );
            }),
        SwiftSettingsTile(
          leading: const Icon(CupertinoIcons.clear),
          title: const Text('Clear history'),
          onTap: RouteHistoryRepository.instance.clear,
        ),
        SwiftSettingsTile(
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
        SwiftSettingsTile(
            leading: const Icon(Icons.warning_rounded),
            title: const Text('Throw a Flutter error'),
            onTap: () => throw StateError('Debug error')),
        SwiftSettingsTile(
            leading: const Icon(Icons.warning_rounded),
            title: const Text('Throw a Dart error'),
            onTap: () {
              reportDartError(
                const ProcessException('swift_travel', []),
                StackTrace.current,
                library: 'settings',
                context: 'voluntarirly',
              );
            }),
        SwiftSettingsTile(
          leading: const Icon(Icons.open_in_browser),
          title: const Text('Open incorrect page'),
          onTap: () =>
              Navigator.of(context).pushNamed('/thisIsNotACorrectPage'),
          tileBorders: const TileBorders(bottom: true),
        ),
      ],
    );
  }
}

class _ScreenPage extends StatelessWidget {
  const _ScreenPage();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            ErrorDataWidget(
                'Screen size:', MediaQuery.of(context).size.toString()),
            ErrorDataWidget(
                'Orientation:', MediaQuery.of(context).orientation.toString()),
            ErrorDataWidget('Text scale factor:',
                MediaQuery.of(context).textScaler.toString()),
            ErrorDataWidget('Pixel ratio:',
                MediaQuery.of(context).devicePixelRatio.toString()),
          ],
        ),
      );
}
