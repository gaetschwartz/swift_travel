import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/blocs/location.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/models/station_states.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/utils/complete.dart';
import 'package:swift_travel/widget/cff_icon.dart';

import 'completion_tile.dart';

final _stateProvider =
    StateProvider<StationStates>((_) => const StationStates.empty());
final _locatingProvider = StateProvider((_) => false);
final _loadingProvider = StateProvider((_) => false);

class SearchByName extends StatefulWidget {
  const SearchByName();

  @override
  _SearchByNameState createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName>
    with AutomaticKeepAliveClientMixin {
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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: InputWrapperDecoration(
                    child: Stack(
                      children: [
                        TextField(
                          key: const Key("stations-textfield"),
                          focusNode: focusNode,
                          controller: searchController,
                          style: DefaultTextStyle.of(context)
                              .style
                              .copyWith(fontStyle: FontStyle.normal),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            //labelText: "Look for a station",
                            filled: true,
                            fillColor: Theme.of(context).cardColor,
                            contentPadding: const EdgeInsets.only(left: 48),
                          ),
                          onChanged: (s) => debounce(context, s),
                        ),
                        Positioned(
                          left: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: focusNode.hasFocus
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                searchController.text = "";
                                focusNode.unfocus();
                                context.read(_stateProvider).state =
                                    const StationStates.empty();
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
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
                                  builder: (context, w, _) =>
                                      w(_loadingProvider).state
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
                            itemCount: c.completions == null
                                ? 0
                                : c.completions.length,
                          ),
                        ),
                      ],
                    ),
                    empty: (_) => Consumer(
                        builder: (context, w, _) => w(favoritesStatesProvider)
                            .state
                            .map(
                              data: (c) => c.favorites.isEmpty
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "🔎",
                                          style: TextStyle(fontSize: 48),
                                        ),
                                        const SizedBox(height: 24),
                                        Text(
                                          "Search a station",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    )
                                  : ListView.builder(
                                      itemBuilder: (context, i) =>
                                          CffCompletionTile(
                                              sugg: c.favorites[i]
                                                  .toCompletion()),
                                      itemCount: c.favorites == null
                                          ? 0
                                          : c.favorites.length,
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
      final p =
          await context.read(locationProvider).getLocation(context: context);
      if (p == null) return;

      final completions = await context
          .read(navigationAPIProvider)
          .findStation(p.latitude, p.longitude);

      final first = completions.first;
      if (first.dist != null) {
        final public = completions.where((c) => !CffIcon.isPrivate(
            c.iconclass.substring(c.iconclass.lastIndexOf("_") + 1)));
        context.read(_stateProvider).state =
            StationStates.completions(completions);
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
      final compls = await context.read(navigationAPIProvider).complete(query);
      final store =
          context.read(storeProvider) as FavoritesSharedPreferencesStore;

      final List<CffCompletion> completionsWithFavs =
          await completeWithFavorites(store, compls, query);

      log("Completions : ${completionsWithFavs.length}");

      context.read(_stateProvider).state =
          StationStates.completions(completionsWithFavs);
    } on SocketException {
      context.read(_stateProvider).state = const StationStates.network();
    } on Exception catch (e, s) {
      if (isMobile) {
        FirebaseCrashlytics.instance.recordError(e, s, printDetails: true);
      } else {
        log("", error: e, stackTrace: s);
      }
    } finally {
      context.read(_loadingProvider).state = false;
    }
  }
}
