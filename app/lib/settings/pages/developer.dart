import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaets_logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/pages/page_not_found.dart';
import 'package:swift_travel/settings/pages/customization.dart';
import 'package:swift_travel/settings/route_history.dart';
import 'package:swift_travel/settings/widgets/tiles.dart';
import 'package:swift_travel/terminal/terminal_widget.dart';
import 'package:swift_travel/utils/crawler.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/route.dart';
import 'package:theming/dialogs/confirmation_alert.dart';

class DeveloperSettingsPage extends StatefulWidget {
  const DeveloperSettingsPage({Key? key}) : super(key: key);

  @override
  State<DeveloperSettingsPage> createState() => _DeveloperSettingsPageState();
}

class _DeveloperSettingsPageState extends State<DeveloperSettingsPage> {
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

  late final children = [
    SwiftSettingsTile(
      leading: const Icon(Icons.restore),
      title: Text(AppLocalizations.of(context).reset_settings),
      onTap: resetSettingsPrompt,
      showChevron: false,
    ),
    ListTile(
      leading: const Icon(CupertinoIcons.search),
      title: const Text('Terminal'),
      onTap: openTerminal,
    ),
    Builder(builder: (context) {
      return ListTile(
          leading: const Icon(CupertinoIcons.search),
          title: const Text('Attributes crawler'),
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              PlatformPageRoute(
                builder: (context) => const CrawlerPage(),
              ),
            );
          });
    }),
    Builder(builder: (context) {
      return ListTile(
          leading: const Icon(CupertinoIcons.clock),
          title: const Text('Route history'),
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              PlatformPageRoute(
                builder: (context) => const RouteHistoryPage(),
              ),
            );
          });
    }),
    ListTile(
      leading: const Icon(CupertinoIcons.clear),
      title: const Text('Clear history'),
      onTap: RouteHistoryRepository.i.clear,
    ),
    Builder(builder: (context) {
      return ListTile(
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
          });
    }),
    ListTile(
        leading: const Icon(Icons.warning_rounded),
        title: const Text('Throw a Flutter error'),
        onTap: () => throw StateError('Debug error')),
    ListTile(
        leading: const Icon(Icons.warning_rounded),
        title: const Text('Throw a Dart error'),
        // ignore: prefer-extracting-callbacks
        onTap: () {
          try {
            throw const IntegerDivisionByZeroException();
          } on IntegerDivisionByZeroException catch (e, s) {
            reportDartError(e, s, library: 'settings', reason: 'voluntarirly');
          }
        }),
    Builder(builder: (context) {
      return ListTile(
          leading: const Icon(Icons.open_in_browser),
          title: const Text('Open incorrect page'),
          onTap: () =>
              Navigator.of(context).pushNamed('/thisIsNotACorrectPage'));
    }),
    ListTile(
        leading: const Icon(Icons.close),
        title: const Text('Trigger a crash'),
        // ignore: prefer-extracting-callbacks
        onTap: () {
          log.log('We trigger a crash');
          FirebaseCrashlytics.instance.crash();
        }),
  ];

  void openTerminal() {
    Navigator.of(context, rootNavigator: true).push(
      PlatformPageRoute(
        builder: (context) => const TerminalPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DividerTheme(
      data: const DividerThemeData(indent: 16, endIndent: 16, thickness: 0.5),
      child: PlatformScaffold(
          title: Text(AppLocalizations.of(context).developer),
          child: ListView(
            children: children,
          )),
    );
  }
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
            ErrorDataWidget(
                'Screen size:', MediaQuery.of(context).size.toString()),
            ErrorDataWidget(
                'Orientation:', MediaQuery.of(context).orientation.toString()),
            ErrorDataWidget('Text scale factor:',
                MediaQuery.of(context).textScaleFactor.toString()),
            ErrorDataWidget('Pixel ratio:',
                MediaQuery.of(context).devicePixelRatio.toString()),
          ],
        ),
      );
}
