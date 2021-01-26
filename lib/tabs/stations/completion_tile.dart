import 'dart:collection';
import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:overflow_view/overflow_view.dart';
import 'package:pedantic/pedantic.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/widgets/action_sheet.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/line_icon.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

enum _Actions { favorite }

class CffCompletionTile extends ConsumerWidget {
  const CffCompletionTile({
    Key key,
    @required this.sugg,
  })  : assert(sugg != null),
        super(key: key);

  final CffCompletion sugg;

  static const _kRadius = BorderRadius.all(Radius.circular(16));
  @override
  Widget build(BuildContext context, Reader watch) {
    final iconClass = sugg.icon;
    final isPrivate = CffIcon.isPrivate(iconClass);
    final store = watch(storeProvider) as FavoritesSharedPreferencesStore;
    final favStop = store.stops.firstWhere((f) => f.stop == sugg.label, orElse: () => null);
    final isFav = sugg.favoriteName != null;
    final isFavInStore = favStop != null;
    final isDarwin = Responsive.isDarwin(context);

    final Widget listTile = DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
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
        title: Text(isFav ? sugg.favoriteName : sugg.label),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isFav)
              if (sugg.label != null)
                Text(sugg.label, overflow: TextOverflow.ellipsis)
              else if (sugg.dist != null)
                Text('${sugg.dist.round()}m'),
            if (!isPrivate)
              _LinesWidget(
                sugg: sugg,
                key: Key(sugg.label),
              )
          ],
        ),
        isThreeLine: isFav && (sugg.label != null || sugg.dist != null),
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
                Nav.push(context, (context) => StopDetails(stopName: sugg.label));
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
    @required bool isFav,
    @required FavoriteStop favoriteStop,
    @required FavoritesSharedPreferencesStore store,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    unawaited(Vibration.select());
    final c = await showActionSheet<_Actions>(
        context,
        [
          ActionsSheetAction(
            title: isFav
                ? Text(Strings.of(context).remove_from_favoruites)
                : Text(Strings.of(context).add_to_favs),
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
          title: Text(Strings.of(context).cancel),
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
          await store.addStop(sugg.toFavoriteStop(name: name));
        }
        break;
    }
  }
}

class _LinesWidget extends StatefulWidget {
  const _LinesWidget({
    Key key,
    @required this.sugg,
  }) : super(key: key);

  final CffCompletion sugg;

  @override
  __LinesWidgetState createState() => __LinesWidgetState();
}

final _cache = <String, List<Line>>{};

final _queue = DoubleLinkedQueue<String>();

const _maxCacheSize = 50;

class __LinesWidgetState extends State<_LinesWidget> {
  @override
  void initState() {
    super.initState();
    stationboard();
  }

  Future<void> stationboard() async {
    final s = Stopwatch();
    s.start();
    if (!_cache.containsKey(widget.sugg.label)) {
      final stationboard =
          await context.read(navigationAPIProvider).stationboard(widget.sugg.label);
      // print('End network call: ' + s.elapsedMilliseconds.toString() + ' ms');
      final l = stationboard.connections
          .where((c) => c.line != null)
          .map((c) => Line(c.line, c.color))
          .toSet()
          .toList(growable: false)
            ..sort((a, b) {
              final ai = int.tryParse(a.line);
              final bi = int.tryParse(b.line);
              return ai == null && bi == null
                  ? a.line.compareTo(b.line)
                  : (ai ?? double.infinity).compareTo(bi ?? double.infinity);
            });

      final l2 = l
          .map((l) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: LineIcon.fromLine(l, small: true),
              ))
          .toList(growable: false);
      s.stop();
      //  print('End: ' + s.elapsedMilliseconds.toString() + ' ms');
      setState(() => lines = l2);
      if (_cache.length > _maxCacheSize) {
        _cache.remove(_queue.removeFirst());
      }
      _cache[widget.sugg.label] = l;
      _queue.removeWhere((e) => e == widget.sugg.label);
      _queue.add(widget.sugg.label);
    } else {
      final l = _cache[widget.sugg.label]
          .map((l) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: LineIcon.fromLine(l, small: true),
              ))
          .toList(growable: false);
      setState(() => lines = l);
    }
  }

  List<Widget> lines;

  @override
  Widget build(BuildContext context) {
    return lines == null
        ? const Padding(
            padding: EdgeInsets.only(top: 8),
            child: CupertinoActivityIndicator(),
          )
        : OverflowView.flexible(
            builder: (context, remainingItemCount) => const SizedBox(
                height: 30, child: Align(alignment: Alignment.bottomCenter, child: Text(' ...'))),
            spacing: 2,
            children: lines,
          );
  }
}

class Line {
  final String line;
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
