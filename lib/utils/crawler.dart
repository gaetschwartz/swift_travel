import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell.dart';
import 'package:share/share.dart';
import 'package:swift_travel/apis/search.ch/models/attribute.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/db/database.dart';
import 'package:swift_travel/main.dart';

class CrawlerPage extends StatefulWidget {
  const CrawlerPage();

  @override
  _CrawlerPageState createState() => _CrawlerPageState();
}

class _CrawlerPageState extends State<CrawlerPage> {
  final routes = RouteHistoryRepository.i.routes;
  Map<String, String> handled = {};
  Map<String, String> unHandled = {};

  String current = '';
  String current2 = '';
  String currentSub = '';
  bool isRunning = false;
  int currentI = 1;

  @override
  Widget build(BuildContext context) {
    final uHKeys = unHandled.keys.toList(growable: false);
    final hKeys = handled.keys.toList(growable: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crawler'),
        actions: [
          if (isRunning == false)
            IconButton(
                icon: const Icon(CupertinoIcons.share),
                onPressed: () async {
                  final dir = await getTemporaryDirectory();
                  final f = File(path.join(dir!.path, 'swift_travel', 'crawler', 'crawled.json'));
                  if (!await f.exists()) await f.create(recursive: true);
                  await f.writeAsString(jsonEncode(unHandled));
                  if (kIsWeb) {
                  } else if (isMobile) {
                    await Share.shareFiles([f.path]);
                  } else {
                    final shell = Shell();
                    final folder = path.dirname(f.absolute.path);
                    if (Platform.isWindows) {
                      try {
                        await shell.run('explorer.exe $folder');
                      } on ShellException {}
                    } else if (Platform.isMacOS) {
                      await shell.run('open $folder');
                    }
                  }
                }),
          IconButton(
              onPressed: isRunning
                  ? () => setState(() => isRunning = false)
                  : () async {
                      setState(() {
                        unHandled = {};
                        handled = {};
                        isRunning = true;
                        currentI = 1;
                      });
                      try {
                        for (final lr in routes) {
                          print('Fetching ${lr.from} -> ${lr.to}');
                          for (var i = 0; i < 6; i++) {
                            final timeOfDay = TimeOfDay(hour: 8 + 2 * i, minute: 0);
                            if (mounted) {
                              setState(() {
                                current = lr.from;
                                current2 = lr.to;
                                currentSub = timeOfDay.toString();
                              });
                            }
                            final r = await context.read(navigationAPIProvider).route(
                                  lr.from,
                                  lr.to,
                                  date: DateTime.now(),
                                  time: timeOfDay,
                                );
                            for (final c in r.connections) {
                              for (final l in c.legs) {
                                for (final e in l.attributes.entries) {
                                  if (Attribute.attributes.containsKey(e.key)) {
                                    handled[e.key] = e.value;
                                  } else {
                                    unHandled[e.key] = e.value;
                                  }
                                  if (!isRunning) return;
                                }
                              }
                            }
                          }
                          if (mounted) setState(() => currentI++);
                          print('Done fetching ${lr.from} -> ${lr.to}');
                        }
                      } finally {
                        if (mounted) setState(() => isRunning = false);
                      }
                    },
              icon: isRunning ? const Icon(Icons.stop) : const Icon(Icons.play_arrow))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Text(current)),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Text(current2)),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Text(currentSub)),
          const SizedBox(height: 8),
          if (isRunning)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                value: currentI / routes.length,
              ),
            ),
          const Divider(height: 0),
          Expanded(
            child: ListView(
              primary: true,
              children: [
                if (unHandled.isNotEmpty) ...[
                  const ListTile(title: Text('Unhandled'), dense: true),
                  const Divider(),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: unHandled.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      final key = uHKeys[i];
                      final att = Attribute.attributes[key];
                      return buildListTile(att, key, unHandled[key]!);
                    },
                  ),
                ],
                const ListTile(title: Text('Handled'), dense: true),
                const Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: handled.length,
                  itemBuilder: (context, i) {
                    final key = hKeys[i];
                    final att = Attribute.attributes[key];
                    return buildListTile(att, key, handled[key]!);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(Attribute? att, String key, String value) {
    return ListTile(
      leading: IconTheme(
        data: const IconThemeData(color: Colors.white),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: att == null ? const SizedBox(height: 24, width: 24) : att.icon,
          ),
        ),
      ),
      title: Text(key),
      subtitle: Text(value),
      dense: true,
      onTap: () => Clipboard.setData(ClipboardData(text: key)),
    );
  }
}
