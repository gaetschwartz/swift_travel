import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/tabs/stations/stop_details.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/input_dialog.dart';
import 'package:utils/widgets/responsive.dart';
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
    final isDarwin = ResponsiveWidget.isDarwin(context);

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
          mainAxisSize: MainAxisSize.min,
          children: [
            isFav
                ? isDarwin
                    ? const Icon(CupertinoIcons.heart_fill)
                    : const Icon(Icons.star)
                : CffIcon.fromIconClass(iconClass),
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
            : const Icon(Icons.arrow_forward_ios),
        onTap: isPrivate
            ? null
            : () {
                Vibration.select();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => StopDetails(stopName: sugg.label)));
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
    final c = await showCupertinoModalBottomSheet<_Actions>(
        context: context,
        duration: Duration(milliseconds: 200),
        expand: false,
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        builder: (context) => Material(
                child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: isFav
                        ? Text(Strings.of(context).remove_from_favoruites)
                        : Text(Strings.of(context).add_to_favs),
                    leading: isFav ? Icon(CupertinoIcons.heart_slash) : Icon(CupertinoIcons.heart),
                    onTap: () => Navigator.of(context).pop(_Actions.favorite),
                  ),
                  ListTile(
                    title: Text(Strings.of(context).close),
                    leading: Icon(CupertinoIcons.xmark),
                    onTap: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            )));

    switch (c) {
      case _Actions.favorite:
        await deleteOrAddToFav(context, isFav: isFav, favoriteStop: favoriteStop, store: store);
        break;
    }
  }

  Future deleteOrAddToFav(
    BuildContext context, {
    @required bool isFav,
    @required FavoriteStop favoriteStop,
    @required FavoritesSharedPreferencesStore store,
  }) async {
    if (isFav) {
      store.removeStop(favoriteStop);
    } else {
      final name = await input(context, title: const Text('What is the name of this stop'));
      if (name == null) return;
      store.addStop(sugg.toFavoriteStop(name: name));
    }
  }
}
