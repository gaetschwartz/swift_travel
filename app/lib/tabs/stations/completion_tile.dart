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
import 'package:swift_travel/db/models/cache.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
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

class CompletionTile extends ConsumerStatefulWidget {
  const CompletionTile(
    this.sugg, {
    Key? key,
  }) : super(key: key);

  final NavigationCompletion sugg;

  static const _kRadius = BorderRadius.all(Radius.circular(16));

  @override
  ConsumerState<CompletionTile> createState() => _CompletionTileState();
}

class _CompletionTileState extends ConsumerState<CompletionTile> {
  @override
  Widget build(BuildContext context) {
    final store = ref.watch(storeProvider);
    final iconClass = widget.sugg.icon;
    final isPrivate = TransportationModeX.isAnAddress(widget.sugg.type);

    final isFav = widget.sugg.favoriteName != null;
    final darwin = isThemeDarwin(context);

    final subtitle = [
      if (isFav) Text(widget.sugg.label, overflow: TextOverflow.ellipsis),
      if (widget.sugg.dist != null) Text('${widget.sugg.dist!.round()}m'),
      if (!isPrivate)
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
        title: Text(isFav ? widget.sugg.favoriteName! : widget.sugg.label),
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
                  Vibration.instance.select();
                  more(context, store: store);
                })
            : const Icon(CupertinoIcons.chevron_forward),
        onTap: isPrivate
            ? null
            : () {
                Vibration.instance.select();

                SideBar.push(
                  context,
                  (context) => StopDetails(
                    SbbStop(name: widget.sugg.label, id: widget.sugg.id),
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
        store.stops.firstWhereOrNull((f) => f.stop == widget.sugg.label);
    final isFav = favoriteStop != null;

    final c = await showActionSheet<_Actions>(
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
            onPressed: () => _Actions.favorite,
            isDestructive: isFav,
          )
        ],
        cancel: ActionsSheetAction(
          title: Text(AppLocalizations.of(context).cancel),
          icon: const Icon(CupertinoIcons.xmark),
        ));

    switch (c) {
      case _Actions.favorite:
        if (isFav) {
          await store.removeStop(favoriteStop);
        } else {
          final preferencesBloc = ref.read(preferencesProvider);
          final name = await input(context,
              title: const Text('What is the name of this stop'));
          if (name == null) return;

          await store.addStop(FavoriteStop.fromCompletion(
            widget.sugg,
            name: name,
            api: preferencesBloc.api.value,
          ));
        }
        break;
      case null:
        break;
    }
  }
}

class _LinesWidget extends ConsumerStatefulWidget {
  const _LinesWidget({
    required this.compl,
    Key? key,
  }) : super(key: key);

  final NavigationCompletion compl;

  @override
  __LinesWidgetState createState() => __LinesWidgetState();
}

class __LinesWidgetState extends ConsumerState<_LinesWidget> {
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
            ? const SizedBox(
                width: 8,
                height: 8,
                child: CircularProgressIndicator.adaptive())
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
    if (!Env.doCacheLines) {
      log.log('We are not caching lines');
    }
    if (Env.doCacheLines && LineCache.i.containsKey(widget.compl.label)) {
      final l = LineCache.i
          .get(widget.compl.label)
          .lines
          .map(_LineIcon.new)
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
              SbbStop(
                name: widget.compl.label,
                id: widget.compl.id,
              ),
              when: DateTime.now(),
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
          // ignore: deprecated_member_use_from_same_package
          .map((c) => Line(
                line: c.line,
                bgColor: c.bgcolor?.value,
                fgColor: c.fgcolor?.value,
              ))
          .toSet()
          .take(numberOfLines + 1);

      final l2 = l.map(_LineIcon.new).toList(growable: false);

      if (mounted) {
        setState(() => lines = l2);
      }

      if (Env.doCacheLines) {
        await LineCache.i.put(
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
    if (Env.doCacheLines) {
      final entry = LineCacheEntry(
        timestamp: DateTime.now(),
        stop: widget.compl.label,
        lines: [],
        ttl: Duration.minutesPerHour * 6,
      );

      await LineCache.i.put(widget.compl.label, entry);
    }
  }
}

class _LineIcon extends StatelessWidget {
  const _LineIcon(
    this.l, {
    Key? key,
  }) : super(key: key);

  final Line l;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: LineIcon.fromLine(l, small: true),
      );
}
