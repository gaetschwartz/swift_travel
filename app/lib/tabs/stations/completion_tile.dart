// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/stationboard.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stop.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/cache.dart';
import 'package:swift_travel/db/favorite_store.dart';
import 'package:swift_travel/db/models/cache.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:swift_travel/widgets/vehicle_icon.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

class CompletionTile extends ConsumerStatefulWidget {
  const CompletionTile(
    this.sugg, {
    super.key,
  });

  final NavigationCompletion sugg;

  static const _kRadius = BorderRadius.all(Radius.circular(16));

  @override
  ConsumerState<CompletionTile> createState() => _CompletionTileState();
}

class _CompletionTileState extends ConsumerState<CompletionTile> {
  @override
  Widget build(BuildContext context) {
    final store = ref.watch(favoritesStoreProvider);
    final iconClass = widget.sugg.iconBuilder?.call(context) ??
        LocationTypeIcon(widget.sugg.type);
    final isNotStation = widget.sugg.type != LocationType.station;

    final favoriteStop =
        store.stops.firstWhereOrNull((f) => f.data.stop == widget.sugg.label);
    final isFav = favoriteStop != null;
    final darwin = isThemeDarwin(context);

    final subtitle = [
      if (isFav) Text(widget.sugg.label, overflow: TextOverflow.ellipsis),
      if (widget.sugg.dist != null) Text('${widget.sugg.dist!.round()}m'),
      if (!isNotStation)
        _LinesWidget(key: Key(widget.sugg.label), compl: widget.sugg)
    ];

    final listTile = DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: shadowListOf(context),
        color: Theme.of(context).cardColor,
        borderRadius: CompletionTile._kRadius,
      ),
      child: ListTile(
        horizontalTitleGap: 0,
        dense: true,
        shape:
            const RoundedRectangleBorder(borderRadius: CompletionTile._kRadius),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isFav)
              darwin
                  ? const Icon(CupertinoIcons.heart_fill)
                  : const Icon(Icons.star)
            else
              iconClass,
          ],
        ),
        title: Text(isFav ? favoriteStop.data.displayName : widget.sugg.label),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: subtitle,
        ),
        isThreeLine: subtitle.length > 1,
        onLongPress: () async => more(context, store: store),
        trailing: isNotStation
            ? IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () async {
                  Vibration.instance.select();
                  await more(context, store: store);
                })
            : const Icon(CupertinoIcons.chevron_forward),
        onTap: isNotStation
            ? null
            : () {
                Vibration.instance.select();

                SideBar.push(
                  context,
                  (context) => StopDetails(
                    SchStop(sbbName: widget.sugg.label, id: widget.sugg.id),
                    key: Key(widget.sugg.label),
                  ),
                  title: widget.sugg.label,
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
    FocusManager.instance.primaryFocus?.unfocus();
    Vibration.instance.select();

    final favoriteStop =
        store.stops.firstWhereOrNull((f) => f.data.stop == widget.sugg.label);
    final isFav = favoriteStop != null;

    await showActionSheet<void>(
        context,
        [
          ActionsSheetAction(
            title: isFav
                ? Text(AppLocalizations.of(context).remove_from_favoruites)
                : Text(AppLocalizations.of(context).add_to_favs),
            icon: isFav
                ? const Icon(CupertinoIcons.heart_slash)
                : const Icon(CupertinoIcons.heart_fill),
            cupertinoIcon: isFav
                ? const Icon(CupertinoIcons.heart_slash)
                : const Icon(CupertinoIcons.heart),
            onPressed: () async {
              if (isFav) {
                await store.removeStop(favoriteStop);
              } else {
                final preferencesBloc = ref.read(preferencesProvider);
                final name = await input(context,
                    title:
                        Text(AppLocalizations.of(context).how_call_this_fav));
                if (name == null) return;

                await store.addStop(FavoriteStop.fromCompletion(
                  widget.sugg,
                  name: name,
                  api: preferencesBloc.api.value,
                ));
              }
            },
            isDestructive: isFav,
          )
        ],
        cancel: ActionsSheetAction(
          title: Text(AppLocalizations.of(context).cancel),
          icon: const Icon(CupertinoIcons.xmark),
        ));
  }
}

class _LinesWidget extends ConsumerStatefulWidget {
  const _LinesWidget({
    required this.compl,
    super.key,
  });

  final NavigationCompletion compl;

  @override
  __LinesWidgetState createState() => __LinesWidgetState();
}

class __LinesWidgetState extends ConsumerState<_LinesWidget> {
  static const numberOfLines = 6;
  final log = Logger('LinesWidget');

  List<Line>? lines;

  @override
  void initState() {
    super.initState();
    unawaited(getData());
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child: lines == null
            ? const SizedBox.square(
                dimension: 8,
                child: CircularProgressIndicator.adaptive(),
              )
            : SizedBox(
                width: double.infinity,
                child: ClipRect(
                  child: Row(
                    children: [
                      ...lines!.take(numberOfLines).map(_LineIcon.new),
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
      setState(() => lines = []);
      log.e('Failed to get lines for ${widget.compl.label}: $e', stackTrace: s);
    }
  }

  Future<void> stationboard() async {
    if (!Env.doCacheLines) {
      log.log('We are not caching lines');
    }
    if (Env.doCacheLines &&
        LineCacheRepository.instance.containsKey(widget.compl.label)) {
      final l = LineCacheRepository.instance
          .get(widget.compl.label)
          .lines
          .take(numberOfLines + 1)
          .toList(growable: false);
      if (mounted) {
        setState(() => lines = l);
      }
    } else {
      final StationBoard sData;
      try {
        sData = await ref
            .read(navigationAPIProvider)
            .stationboard(
              SchStop(
                sbbName: widget.compl.label,
                id: widget.compl.id,
              ),
              when: DateTime.now(),
            )
            .timeout(const Duration(seconds: 2));
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
            final la = a.l ?? a.line ?? '';
            final lb = b.l ?? b.line ?? '';
            return la.compareTo(lb);
          })
          .map((c) => Line(
                line: c.line,
                bgColor: c.bgcolor?.value,
                fgColor: c.fgcolor?.value,
              ))
          .toSet()
          .take(numberOfLines + 1)
          .toList(growable: false);

      if (mounted) {
        setState(() => lines = l);
      }

      if (Env.doCacheLines) {
        await LineCacheRepository.instance.put(
          widget.compl.label,
          LineCacheEntry(
            timestamp: DateTime.now(),
            stop: widget.compl.label,
            lines: l,
          ),
        );
      }
    }
  }

  /// Caches an empty list of lines for 1 hour.
  Future<void> cacheShortLivedErrorEntry() async {
    if (mounted) {
      setState(() => lines = []);
    }
    if (Env.doCacheLines) {
      final entry = LineCacheEntry(
        timestamp: DateTime.now(),
        stop: widget.compl.label,
        lines: [],
        ttl: Duration.minutesPerHour * 1,
      );

      await LineCacheRepository.instance.put(widget.compl.label, entry);
    }
  }
}

class _LineIcon extends StatelessWidget {
  const _LineIcon(this.l);

  final Line l;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: LineIcon.fromLine(l, small: true),
      );
}
