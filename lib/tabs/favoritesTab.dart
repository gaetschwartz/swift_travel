import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_free/api/cff/cff_completion.dart';
import 'package:travel_free/blocs/cff.dart';
import 'package:travel_free/blocs/store.dart';
import 'package:travel_free/widget/input.dart';

class SearchFavorite extends StatefulWidget {
  @override
  _SearchFavoriteState createState() => _SearchFavoriteState();
}

class _SearchFavoriteState extends State<SearchFavorite> with AutomaticKeepAliveClientMixin {
  List<CffCompletion> _favoritesStop = [];
  LocalStore _store;
  CffRepository _cff;

  @override
  void initState() {
    super.initState();
    _store = context.read(storeProvider) as LocalStore;
    _cff = context.read(cffProvider) as CffRepository;
    loadFavorites();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> loadFavorites() async {
    final List<CffCompletion> favs = await _store.getFavorites();
    setState(() => _favoritesStop = favs);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () => loadFavorites(),
      child: Column(
        children: <Widget>[
          RaisedButton(
            shape: const StadiumBorder(),
            onPressed: () async {
              final String s =
                  await showDialog(context: context, builder: (_) => TextInputDialog());
              if (s == null) return;
              final CffCompletion completion = (await _cff.complete(s, showIds: true)).first;
              await _store.addFavorite(completion);
              await loadFavorites();
            },
            child: const Text("Add Fav"),
          ),
          if (_favoritesStop != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: List.generate(
                    _favoritesStop.length,
                    (i) => _FavoriteTile(_favoritesStop[i], loadFavorites),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _FavoriteTile extends StatelessWidget {
  final CffCompletion stop;
  final Future<void> Function() reload;

  const _FavoriteTile(
    this.stop,
    this.reload, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onLongPress: () async {
          await context.read(storeProvider).deleteFavorite(stop);
          reload();
        },
        child: Center(
          child: Text(stop.label),
        ),
      ),
    );
  }
}
