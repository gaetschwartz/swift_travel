import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_free/api/cff/cff_completion.dart';
import 'package:travel_free/blocs/cff.dart';
import 'package:travel_free/blocs/store.dart';
import 'package:travel_free/models/station_states.dart';
import 'package:travel_free/pages/detailsStop.dart';
import 'package:travel_free/widget/icon.dart';

final _stateProvider = StateProvider<StationStates>((_) => const StationStates.empty());

class SearchByName extends StatefulWidget {
  @override
  _SearchByNameState createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> with AutomaticKeepAliveClientMixin {
  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  Timer _debouncer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => context.read(favoritesProvider).getFavorites());
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
              height: 64,
              child: Center(
                  child: Text(
                "Look for a station",
                style: Theme.of(context).textTheme.headline4,
              ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              focusNode: focusNode,
              controller: searchController,
              style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.normal),
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Stop",
                  suffixIcon: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.times),
                      onPressed: () {
                        searchController.text = "";
                        focusNode.unfocus();
                        context.read(_stateProvider).state = const StationStates.empty();
                      })),
              onChanged: (s) async {
                context.read(_stateProvider).state = const StationStates.loading();
                // Debounce
                if (_debouncer?.isActive ?? false) {
                  _debouncer?.cancel();
                  _debouncer = Timer(const Duration(milliseconds: 500), () => load(s));
                } else {
                  await load(s);
                  _debouncer?.cancel();
                  _debouncer = Timer(const Duration(milliseconds: 500), () {});
                }
              },
            ),
          ),
          Expanded(
            child: Consumer(builder: (context, w, _) {
              return w(_stateProvider).state.map(
                    loading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    completions: (c) => ListView.separated(
                      itemBuilder: (context, i) => CffCompletionTile(c.completions[i]),
                      separatorBuilder: (context, i) => const Divider(),
                      itemCount: c.completions == null ? 0 : c.completions.length,
                    ),
                    empty: (_) => Consumer(
                        builder: (context, w, _) => w(favoritesStatesProvider).state.map(
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
                                  : ListView.separated(
                                      itemBuilder: (context, i) => CffCompletionTile(
                                        c.completions[i],
                                        isFav: true,
                                      ),
                                      separatorBuilder: (context, i) => const Divider(),
                                      itemCount: c.completions == null ? 0 : c.completions.length,
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
                            )),
                    error: (value) => Center(
                      child: Text(
                        value.error.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    network: (value) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          Icons.wifi_off,
                          size: 48,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Netork Error",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  );
            }),
          ),
        ],
      ),
    );
  }

  Future<void> load(String s) async {
    try {
      final cs = await context.read(cffProvider).complete(s);
      context.read(_stateProvider).state =
          StationStates.completions(cs.where((c) => c.label != null).toList());
    } on SocketException {
      context.read(_stateProvider).state = const StationStates.network();
    } catch (e) {
      context.read(_stateProvider).state = StationStates.error(e);
    }
  }
}

class CffCompletionTile extends StatelessWidget {
  const CffCompletionTile(
    this.sugg, {
    Key key,
    this.isFav = false,
  }) : super(key: key);

  final CffCompletion sugg;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    if (sugg.label == null) log(sugg.toString());
    return ListTile(
      leading: CffIcon.fromIconClass(sugg.iconclass),
      title: Text(sugg.label ?? ""),
      dense: true,
      subtitle: isFav ? const Text("Favorite") : null,
      onTap: CffIcon.isPrivate(sugg.iconclass)
          ? null
          : () {
              log(sugg.iconclass);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailsStop(
                    stopName: sugg.label,
                  ),
                ),
              );
            },
    );
  }
}
