import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/location.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/models/station_states.dart';
import 'package:swiss_travel/utils/complete.dart';
import 'package:swiss_travel/widget/cff_icon.dart';

import 'completion_tile.dart';

final _stateProvider = StateProvider<StationStates>((_) => const StationStates.empty());
final _locatingProvider = StateProvider((_) => false);
final _loadingProvider = StateProvider((_) => false);

class SearchByName extends StatefulWidget {
  const SearchByName();

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
  }

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();
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
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    key: const Key("stations-textfield"),
                    focusNode: focusNode,
                    controller: searchController,
                    style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.normal),
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Look for a station",
                        suffixIcon: IconButton(
                            icon: const FaIcon(FontAwesomeIcons.times),
                            onPressed: () {
                              searchController.text = "";
                              focusNode.unfocus();
                              context.read(_stateProvider).state = const StationStates.empty();
                            })),
                    onChanged: (s) => debounce(context, s),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                    icon: Consumer(builder: (context, w, _) {
                      final loading = w(_locatingProvider).state;
                      return loading
                          ? const CircularProgressIndicator()
                          : const FaIcon(FontAwesomeIcons.locationArrow);
                    }),
                    onPressed: () => getLocation())
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Consumer(builder: (context, w, _) {
              return w(_stateProvider).state.map(
                    completions: (c) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            height: 4,
                            child: Center(
                              child: Consumer(
                                  builder: (context, w, _) => w(_loadingProvider).state
                                      ? const LinearProgressIndicator()
                                      : const SizedBox()),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, i) => CffCompletionTile(
                              sugg: c.completions[i],
                              key: Key("stations-key-$i"),
                            ),
                            itemCount: c.completions == null ? 0 : c.completions.length,
                          ),
                        ),
                      ],
                    ),
                    empty: (_) => Consumer(
                        builder: (context, w, _) => w(favoritesStatesProvider).state.map(
                              data: (c) => c.favorites.isEmpty
                                  ? const SizedBox()
                                  : ListView.builder(
                                      itemBuilder: (context, i) =>
                                          CffCompletionTile(sugg: c.favorites[i].toCompletion()),
                                      itemCount: c.favorites == null ? 0 : c.favorites.length,
                                    ),
                              loading: (_) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              exception: (e) => Center(
                                child: Text(
                                  e.exception.toString(),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            )),
                    network: (value) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          Icons.wifi_off,
                          size: 48,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Network Error",
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

  Future<void> debounce(BuildContext context, String s) async {
    context.read(_loadingProvider).state = true;
    // Debounce
    if (_debouncer?.isActive ?? false) {
      _debouncer?.cancel();
      _debouncer = Timer(const Duration(milliseconds: 500), () => fetch(s));
    } else {
      await fetch(s);
      _debouncer?.cancel();
      _debouncer = Timer(const Duration(milliseconds: 500), () {});
    }
  }

  Future<void> getLocation() async {
    context.read(_locatingProvider).state = true;

    try {
      final p = await context.read(locationProvider).getLocation(context: context);
      if (p == null) return;

      final completions = await context.read(cffProvider).findStation(p.latitude, p.longitude);

      final first = completions.first;
      if (first.dist != null) {
        final public = completions.where(
            (c) => !CffIcon.isPrivate(c.iconclass.substring(c.iconclass.lastIndexOf("_") + 1)));
        context.read(_stateProvider).state = StationStates.completions(completions);
        if (public.isNotEmpty) {
          log("Found : ${public.first}");
          searchController.text = public.first.label;
        }
      }
    } on Exception catch (e) {
      log("", error: e, name: "Location");
    } finally {
      context.read(_locatingProvider).state = false;
    }
  }

  Future<void> fetch(String query) async {
    try {
      final compls = await context.read(cffProvider).complete(query);
      final store = context.read(storeProvider) as FavoritesSharedPreferencesStore;

      final List<CffCompletion> completionsWithFavs =
          await completeWithFavorites(store, compls, query);

      context.read(_stateProvider).state = StationStates.completions(completionsWithFavs);
    } on SocketException {
      context.read(_stateProvider).state = const StationStates.network();
    } on Exception catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s, printDetails: true);
    } finally {
      context.read(_loadingProvider).state = false;
    }
  }
}
