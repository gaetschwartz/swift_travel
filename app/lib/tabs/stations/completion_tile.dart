import 'dart:async';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedantic/pedantic.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/cache.dart';
import 'package:swift_travel/db/models/cache.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

enum _Actions { favorite }

class CompletionTile extends ConsumerWidget {
  const CompletionTile(
    this.sugg, {
    Key? key,
  }) : super(key: key);

  final Completion sugg;

  static const _kRadius = BorderRadius.all(Radius.circular(16));

  @override
  Widget build(BuildContext context, Reader watch) {
    final store = watch(storeProvider);
    final iconClass = sugg.getIcon();
    final isPrivate = VehicleX.isAnAddress(sugg.type);

    final isFav = sugg.favoriteName != null;
    final isDarwin = Responsive.isDarwin(context);

    final subtitle = [
      if (isFav) Text(sugg.label, overflow: TextOverflow.ellipsis),
      if (sugg.dist != null) Text('${sugg.dist!.round()}m'),
      if (!isPrivate)
        _LinesWidget(
          compl: sugg,
          key: Key(sugg.label),
        )
    ];

    final listTile = DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: shadowListOf(context),
        color: Theme.of(context).cardColor,
        borderRadius: _kRadius,
      ),
      child: ListTile(
        horizontalTitleGap: 0,
        dense: true,
        shape: const RoundedRectangleBorder(borderRadius: _kRadius),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isFav)
              isDarwin ? const Icon(CupertinoIcons.heart_fill) : const Icon(Icons.star)
            else
              iconClass,
          ],
        ),
        title: Text(isFav ? sugg.favoriteName! : sugg.label),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: subtitle,
        ),
        isThreeLine: subtitle.length > 1,
        onLongPress: () => more(context, store: store),
        trailing: isPrivate
            ? IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {
                  Vibration.select();
                  more(context, store: store);
                })
            : const Icon(CupertinoIcons.chevron_forward),
        onTap: isPrivate
            ? null
            : () {
                Vibration.select();

                Nav.push(
                  context,
                  (context) => StopDetails(
                    SbbStop(sugg.label, id: sugg.id),
                    key: Key(sugg.label),
                  ),
                  title: sugg.label,
                );
                FocusManager.instance.primaryFocus?.unfocus();
              },
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Center(
        child: listTile,
      ),
    );
  }

  Future<void> more(
    BuildContext context, {
    required BaseFavoritesStore store,
  }) async {
    final favoriteStop = store.stops.firstWhereOrNull((f) => f.stop == sugg.label);
    final isFav = favoriteStop != null;

    FocusManager.instance.primaryFocus?.unfocus();
    unawaited(Vibration.select());
    final c = await showActionSheet<_Actions>(
        context,
        [
          ActionsSheetAction(
            title: isFav
                ? Text(AppLoc.of(context).remove_from_favoruites)
                : Text(AppLoc.of(context).add_to_favs),
            icon: isFav
                ? const Icon(CupertinoIcons.heart_slash)
                : const Icon(CupertinoIcons.heart_fill),
            cupertinoIcon:
                isFav ? const Icon(CupertinoIcons.heart_slash) : const Icon(CupertinoIcons.heart),
            onPressed: () => _Actions.favorite,
            isDestructive: isFav,
          )
        ],
        cancel: ActionsSheetAction(
          title: Text(AppLoc.of(context).cancel),
          icon: const Icon(CupertinoIcons.xmark),
        ));

    switch (c) {
      case _Actions.favorite:
        if (isFav) {
          await store.removeStop(favoriteStop!);
        } else {
          final name = await input(context, title: const Text('What is the name of this stop'));
          if (name == null) {
            return;
          }
          await store.addStop(FavoriteStop.fromCompletion(
            sugg,
            name: name,
            api: context.read(preferencesProvider).api.value,
          ));
        }
        break;
      case null:
        break;
    }
  }
}

class _LinesWidget extends StatefulWidget {
  const _LinesWidget({
    required this.compl,
    Key? key,
  }) : super(key: key);

  final Completion compl;

  @override
  __LinesWidgetState createState() => __LinesWidgetState();
}

class __LinesWidgetState extends State<_LinesWidget> {
  static final _cache = LineCache.i;
  static const numberOfLines = 6;

  List<Widget>? lines;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child: lines == null
            ? const SizedBox(width: 8, height: 8, child: CircularProgressIndicator.adaptive())
            : SizedBox(
                width: double.infinity,
                child: ClipRect(
                  child: Row(
                    children: [
                      ...lines!.take(numberOfLines),
                      if (lines!.length > numberOfLines)
                        const Text(' ...', overflow: TextOverflow.fade)
                    ],
                  ),
                ),
              ),
      );

  Future<void> getData() async {
    try {
      await stationboard();
    } on Exception catch (e, s) {
      debugPrintStack(stackTrace: s, label: e.toString());
      setState(() => lines = []);
    }
  }

  Future<void> stationboard() async {
    if (!Env.cacheLinesInDebug) {
      print('We are not caching lines');
    }
    if (Env.cacheLinesInDebug && _cache.containsKey(widget.compl.label)) {
      final l = _cache
          .get(widget.compl.label)
          .lines
          .map(_LineIcon.line)
          .take(numberOfLines + 1)
          .toList(growable: false);
      if (mounted) {
        setState(() => lines = l);
      }
    } else {
      final StationBoard sData;
      try {
        sData = await context
            .read(navigationAPIProvider)
            .stationboard(
              SbbStop(
                widget.compl.label,
                id: widget.compl.id,
              ),
              showSubsequentStops: false,
              showDelays: false,
            )
            .timeout(const Duration(seconds: 1));
      } on TimeoutException {
        await cacheShortLivedErrorEntry();
        return;
      }

      if (sData.errors.isNotEmpty) {
        await cacheShortLivedErrorEntry();
        return;
      }

      final connections = sData.connections.where((c) => c.line != null);

      final l = connections
          .sorted((a, b) {
            final la = int.tryParse((a.l ?? a.line)!);
            final lb = int.tryParse((b.l ?? b.line)!);
            if (la == null && lb == null) {
              return a.line!.compareTo(b.line!);
            } else {
              return (la ?? double.infinity).compareTo(lb ?? double.infinity);
            }
          })
          .map((c) => Line(c.line, c.color))
          .toSet()
          .take(numberOfLines + 1);

      final l2 = l.map(_LineIcon.line).toList(growable: false);

      if (mounted) {
        setState(() => lines = l2);
      }

      if (Env.cacheLinesInDebug) {
        await _cache.put(
            widget.compl.label,
            LineCacheEntry(
                timestamp: DateTime.now(),
                stop: widget.compl.label,
                lines: l.toList(growable: false)));
      }
    }
  }

  Future<void> cacheShortLivedErrorEntry() async {
    if (mounted) {
      setState(() => lines = []);
    }
    if (Env.cacheLinesInDebug) {
      final entry = LineCacheEntry(
        timestamp: DateTime.now(),
        stop: widget.compl.label,
        lines: [],
        ttl: Duration.minutesPerHour * 6,
      );

      await _cache.put(widget.compl.label, entry);
    }
  }
}

class _LineIcon extends StatelessWidget {
  const _LineIcon(
    this.l, {
    Key? key,
  }) : super(key: key);

  // ignore: prefer_constructors_over_static_methods
  static _LineIcon line(Line l) => _LineIcon(l);

  final Line l;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: LineIcon.fromLine(l, small: true),
      );
}
