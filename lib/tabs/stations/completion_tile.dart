import 'dart:collection';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overflow_view/overflow_view.dart';
import 'package:pedantic/pedantic.dart';
import 'package:swift_travel/apis/search.ch/models/completion.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

enum _Actions { favorite }

class NavCompletionTile extends ConsumerWidget {
  const NavCompletionTile({
    Key? key,
    required this.sugg,
  }) : super(key: key);

  final NavCompletion sugg;

  static const _kRadius = BorderRadius.all(Radius.circular(24));
  @override
  Widget build(BuildContext context, Reader watch) {
    final iconClass = sugg.icon;
    final isPrivate = CffIcon.isPrivate(iconClass);
    final store = watch(storeProvider) as FavoritesSharedPreferencesStore;
    final favStop = store.stops.firstWhereOrNull((f) => f.stop == sugg.label);
    final isFav = sugg.favoriteName != null;
    final isFavInStore = favStop != null;
    final isDarwin = Responsive.isDarwin(context);

    final Widget listTile = DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: shadowListOf(context),
        color: Theme.of(context).cardColor,
        borderRadius: _kRadius,
      ),
      child: ListTile(
        shape: const RoundedRectangleBorder(borderRadius: _kRadius),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isFav)
              isDarwin ? const Icon(CupertinoIcons.heart_fill) : const Icon(Icons.star)
            else
              CffIcon.fromIconClass(iconClass),
          ],
        ),
        title: Text(isFav ? sugg.favoriteName! : sugg.label),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isFav) Text(sugg.label, overflow: TextOverflow.ellipsis),
            if (sugg.dist != null) Text('${sugg.dist!.round()}m'),
            if (!isPrivate)
              _LinesWidget(
                sugg: sugg,
                key: Key(sugg.label),
              )
          ],
        ),
        isThreeLine: isFav && sugg.dist != null,
        onLongPress: () => more(context, isFav: isFavInStore, favoriteStop: favStop, store: store),
        trailing: isPrivate
            ? IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {
                  Vibration.select();
                  more(context, favoriteStop: favStop, isFav: isFavInStore, store: store);
                })
            : const Icon(CupertinoIcons.chevron_forward),
        onTap: isPrivate
            ? null
            : () {
                Vibration.select();

                Nav.push(
                  context,
                  (context) => StopDetails(stopName: sugg.label),
                  title: sugg.label,
                );
                FocusManager.instance.primaryFocus?.unfocus();
              },
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Center(
        child: listTile,
      ),
    );
  }

  Future<void> more(
    BuildContext context, {
    required bool isFav,
    required FavoriteStop? favoriteStop,
    required FavoritesSharedPreferencesStore store,
  }) async {
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
                ? const Icon(FluentIcons.star_off_24_regular)
                : const Icon(FluentIcons.star_add_24_regular),
            cupertinoIcon:
                isFav ? const Icon(CupertinoIcons.heart_slash) : const Icon(CupertinoIcons.heart),
            onPressed: () => _Actions.favorite,
            isDestructive: isFav,
          )
        ],
        cancel: ActionsSheetAction(
          title: Text(AppLoc.of(context).cancel),
          icon: const Icon(CupertinoIcons.xmark),
          onPressed: () => null,
        ));

    switch (c) {
      case _Actions.favorite:
        if (isFav) {
          await store.removeStop(favoriteStop);
        } else {
          final name = await input(context, title: const Text('What is the name of this stop'));
          if (name == null) return;
          await store.addStop(FavoriteStop.fromCompletion(sugg, name: name));
        }
        break;
      case null:
        break;
    }
  }
}

class _LinesWidget extends StatefulWidget {
  const _LinesWidget({
    Key? key,
    required this.sugg,
  }) : super(key: key);

  final NavCompletion sugg;

  @override
  __LinesWidgetState createState() => __LinesWidgetState();
}

final _cache = <String, List<Line>>{};

final _queue = DoubleLinkedQueue<String>();

const _maxCacheSize = 100;

class __LinesWidgetState extends State<_LinesWidget> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      await stationboard();
    } catch (e) {
      setState(() => lines = []);
    }
  }

  Future<void> stationboard() async {
    final s = Stopwatch();
    s.start();
    if (!_cache.containsKey(widget.sugg.label)) {
      final sData = await context
          .read(navigationAPIProvider)
          .stationboard(widget.sugg.label)
          .timeout(const Duration(seconds: 1));

      final l = sData.map<List<Line>>(
        (board) => board.connections
            .where((c) => c.line != null)
            .map((c) => Line(c.line, c.color))
            .toSet()
            .sorted((a, b) {
          final ai = int.tryParse(a.line!);
          final bi = int.tryParse(b.line!);
          return ai == null && bi == null
              ? a.line!.compareTo(b.line!)
              : (ai ?? double.infinity).compareTo(bi ?? double.infinity);
        }),
        error: (_) => [],
      );

      final l2 = l
          .map((l) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: LineIcon.fromLine(l, small: true),
              ))
          .toList(growable: false);
      s.stop();
      //  print('End: ' + s.elapsedMilliseconds.toString() + ' ms');
      if (mounted) setState(() => lines = l2);
      if (_cache.length > _maxCacheSize) {
        _cache.remove(_queue.removeFirst());
      }
      _cache[widget.sugg.label] = l;
      _queue.removeWhere((e) => e == widget.sugg.label);
      _queue.add(widget.sugg.label);
    } else {
      final l = _cache[widget.sugg.label]!
          .map((l) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: LineIcon.fromLine(l, small: true),
              ))
          .toList(growable: false);
      if (mounted) setState(() => lines = l);
    }
  }

  List<Widget>? lines;

  @override
  Widget build(BuildContext context) {
    return lines == null
        ? const Padding(
            padding: EdgeInsets.only(top: 8),
            child: CupertinoActivityIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 2),
            child: OverflowView.flexible(
              builder: (context, remainingItemCount) => const SizedBox(
                  height: 30, child: Align(alignment: Alignment.bottomCenter, child: Text(' ...'))),
              spacing: 2,
              children: lines!,
            ),
          );
  }
}

class Line {
  final String? line;
  final String colors;

  const Line(this.line, this.colors);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Line && o.line == line && o.colors == colors;
  }

  @override
  int get hashCode => line.hashCode ^ colors.hashCode;
}
