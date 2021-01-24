import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/utils/no_splash.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
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
    @Deprecated('')
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
        title: Text((isFav ? sugg.favoriteName : sugg.label) ?? '???'),
        subtitle: isFav
            ? sugg.label != null
                ? Text(sugg.label)
                : null
            : sugg.dist != null
                ? Text('${sugg.dist.round()}m')
                : null,
        onLongPress: () => more(context, isFav: isFavInStore, favoriteStop: favStop, store: store),
        trailing: isPrivate
            ? IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {
                  Vibration.select();
                  more(context, favoriteStop: favStop, isFav: isFavInStore, store: store);
                })
            : const Icon(Icons.chevron_right),
        onTap: isPrivate
            ? null
            : () {
                Vibration.select();
                Navigator.of(context).pushNamed('/stopDetails', arguments: sugg.label);
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
    final c = await showCupertinoModalBottomSheet<_Actions>(
        context: context,
        expand: false,
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        builder: (context) => ActionsSheet(
              actions: [
                ActionsSheetAction(
                  title: isFav
                      ? Text(Strings.of(context).remove_from_favoruites)
                      : Text(Strings.of(context).add_to_favs),
                  icon: isFav
                      ? const Icon(CupertinoIcons.heart_slash)
                      : const Icon(CupertinoIcons.heart),
                  onTap: () => Navigator.of(context).pop(_Actions.favorite),
                ),
                ActionsSheetAction(
                  title: Text(Strings.of(context).close),
                  icon: const Icon(CupertinoIcons.xmark),
                  onTap: () => Navigator.of(context).pop(),
                )
              ],
            ));

    switch (c) {
      case _Actions.favorite:
        await deleteOrAddToFav(context, isFav: isFav, favoriteStop: favoriteStop, store: store);
        break;
    }
  }

  Future<void> deleteOrAddToFav(
    BuildContext context, {
    @required bool isFav,
    @required FavoriteStop favoriteStop,
    @required FavoritesSharedPreferencesStore store,
  }) async {
    if (isFav) {
      await store.removeStop(favoriteStop);
    } else {
      final name = await input(context, title: const Text('What is the name of this stop'));
      if (name == null) return;
      await store.addStop(sugg.toFavoriteStop(name: name));
    }
  }
}

@immutable
class ActionsSheetAction {
  final Widget title;
  final VoidCallback onTap;
  final Widget icon;

  const ActionsSheetAction({@required this.title, this.onTap, this.icon});
}

class ActionsSheet extends StatelessWidget {
  const ActionsSheet({
    Key key,
    @required this.actions,
  }) : super(key: key);

  final List<ActionsSheetAction> actions;

  @override
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);

    return IfWrapper(
      condition: isDarwin,
      builder: (context, child) =>
          Theme(data: ThemeData(splashFactory: const NoSplashFactory()), child: child),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          color: Theme.of(context).dialogBackgroundColor.withOpacity(0.8),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (var a in actions) ...[
                  ListTile(
                    leading: IconTheme(
                        data: IconThemeData(color: CupertinoTheme.of(context).primaryColor),
                        child: a.icon),
                    title: isDarwin
                        ? DefaultTextStyle(
                            style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                            child: a.title)
                        : a.title,
                    onTap: a.onTap,
                  ),
                  const Divider(height: 0, indent: 8, endIndent: 8),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
