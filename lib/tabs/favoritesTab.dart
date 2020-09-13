import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_free/api/cff/cff_completion.dart';
import 'package:travel_free/blocs/cff.dart';
import 'package:travel_free/blocs/store.dart';
import 'package:travel_free/widget/input.dart';

class SearchFavorite extends StatefulWidget {
  @override
  _SearchFavoriteState createState() => _SearchFavoriteState();
}

class _SearchFavoriteState extends State<SearchFavorite> with AutomaticKeepAliveClientMixin {
  LocalStore _store;
  CffRepository _cff;

  @override
  void initState() {
    super.initState();
    _store = context.read(favoritesProvider) as LocalStore;
    _cff = context.read(cffProvider) as CffRepository;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _store.getFavorites();
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: () async {
          final String s = await showDialog(context: context, builder: (_) => StopInputDialog());
          if (s == null) return;
          final CffCompletion completion = (await _cff.complete(s, showIds: true)).first;
          await _store.addFavorite(completion);
        },
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      body: RefreshIndicator(
          onRefresh: () => _store.getFavorites(notify: false),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Consumer(builder: (context, w, _) {
                final favs = w(favoritesStatesProvider);
                return favs.state.map(
                  data: (c) => c.completions.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.star,
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "No favorites !",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        )
                      : GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          children: List.generate(
                            c.completions.length,
                            (i) => _FavoriteTile(c.completions[i], () => _store.getFavorites()),
                          ),
                        ),
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (e) => Center(
                    child: Text(
                      e.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              }),
            ),
          )),
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
        onLongPress: () => context.read(favoritesProvider).deleteFavorite(stop),
        child: Center(
          child: Text(stop.label),
        ),
      ),
    );
  }
}
