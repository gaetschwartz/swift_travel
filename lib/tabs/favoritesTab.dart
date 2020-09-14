import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/api/cff/cff_completion.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/widget/input.dart';
import 'package:utils/dialogs/confirmation_alert.dart';

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
          final String s = await Navigator.of(context).push<String>(MaterialPageRoute(
            builder: (_) => const StopInputDialog(title: "Add a favorite"),
            fullscreenDialog: true,
          ));
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
                      : ListView.builder(
                          itemCount: c.completions.length,
                          itemBuilder: (context, i) => _FavoriteTile(c.completions[i]),
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

  const _FavoriteTile(
    this.stop, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
          icon: const FaIcon(FontAwesomeIcons.star),
          onPressed: () async {
            final b = await confirm(context,
                title: const Text("Delete favorite ?"),
                content: Text('Do you really want to delete "${stop.label}"'),
                confirm: const Text("Yes"),
                cancel: const Text("No"));
            if (!b) return;
            return context.read(favoritesProvider).deleteFavorite(stop);
          }),
      title: Text(stop.label),
    );
  }
}
