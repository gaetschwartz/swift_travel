import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:gap/gap.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:process_run/shell.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/attribute.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:theming/responsive.dart';

class CrawlerPage extends ConsumerStatefulWidget {
  const CrawlerPage({Key? key}) : super(key: key);

  @override
  _CrawlerPageState createState() => _CrawlerPageState();
}

class _CrawlerPageState extends ConsumerState<CrawlerPage> {
  final routes = RouteHistoryRepository.instance.history;
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
          if (!isRunning)
            IconButton(
                icon: const Icon(CupertinoIcons.share),
                onPressed: () async {
                  final dir = await getTemporaryDirectory();
                  final f = File(path.join(
                      dir.path, 'swift_travel', 'crawler', 'crawled.json'));
                  if (!f.existsSync()) {
                    await f.create(recursive: true);
                  }
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
                      } on ShellException catch (_) {}
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
                          log.log(
                              'Fetching ${lr.fromAsString} -> ${lr.toAsString}');
                          for (var i = 0; i < 6; i++) {
                            final timeOfDay =
                                TimeOfDay(hour: 8 + i * 2, minute: 0);
                            if (mounted) {
                              setState(() {
                                current = lr.fromAsString;
                                current2 = lr.toAsString;
                                currentSub = timeOfDay.toString();
                              });
                            }
                            final r =
                                await ref.read(navigationAPIProvider).route(
                                      lr.fromAsString,
                                      lr.toAsString,
                                      date: DateTime.now(),
                                      time: timeOfDay,
                                    );
                            for (final c in r.connections) {
                              for (final l in c.legs) {
                                for (final e in l.attributes.entries) {
                                  if (AttributeData.isHandled(e.key)) {
                                    handled[e.key] = e.value;
                                  } else {
                                    unHandled[e.key] = e.value;
                                  }
                                  if (!isRunning) {
                                    return;
                                  }
                                }
                              }
                            }
                          }
                          if (mounted) {
                            setState(() => currentI++);
                          }
                          log.log(
                              'Done fetching ${lr.fromAsString} -> ${lr.toAsString}');
                        }
                      } finally {
                        if (mounted) {
                          setState(() => isRunning = false);
                        }
                      }
                    },
              icon: isRunning
                  ? const Icon(Icons.stop)
                  : const Icon(Icons.play_arrow))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(current)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(current2)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(currentSub)),
          const Gap(8),
          if (isRunning)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                value: currentI / routes.length,
              ),
            ),
          const Divider(height: 0),
          Expanded(
            child: CustomScrollView(
              primary: true,
              slivers: [
                if (unHandled.isNotEmpty) ...[
                  const SliverToBoxAdapter(
                    child: ListTile(title: Text('Unhandled'), dense: true),
                  ),
                  const SliverToBoxAdapter(
                    child: Divider(),
                  ),
                  SliverList(
                    // shrinkWrap: true,
                    // itemCount: unHandled.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    // itemBuilder: (context, i) {
                    //   final key = uHKeys[i];
                    //   final att = AttributeData.fromCode(key);
                    //   return _Tile(att, key, unHandled[key]!);
                    // },
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final key = uHKeys[i];
                        final att = AttributeData.fromCode(key);
                        return _Tile(att, key, unHandled[key]!);
                      },
                      childCount: unHandled.length,
                    ),
                  ),
                ],
                const SliverToBoxAdapter(
                  child: ListTile(title: Text('Handled'), dense: true),
                ),
                const SliverToBoxAdapter(
                  child: Divider(),
                ),
                SliverList(
                  // shrinkWrap: true,
                  // itemCount: handled.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  // itemBuilder: (context, i) {
                  //   final key = hKeys[i];
                  //   final att = AttributeData.fromCode(key);
                  //   return _Tile(att, key, handled[key]!);
                  // },
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      final key = hKeys[i];
                      final att = AttributeData.fromCode(key);
                      return _Tile(att, key, handled[key]!);
                    },
                    childCount: handled.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(
    this.att,
    this.mapKey,
    this.value, {
    Key? key,
  }) : super(key: key);

  final AttributeData att;
  final String mapKey;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconTheme(
        data: const IconThemeData(color: Colors.white),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: att.icon ?? const SizedBox(height: 24, width: 24),
          ),
        ),
      ),
      title: Text(mapKey),
      subtitle: Text(value),
      dense: true,
      onTap: () => unawaited(Clipboard.setData(ClipboardData(text: mapKey))),
    );
  }
}
