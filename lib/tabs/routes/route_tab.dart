import 'dart:developer';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/api/cff/models/cff_route.dart';
import 'package:swiss_travel/api/cff/models/local_route.dart';
import 'package:swiss_travel/api/cff/models/stop.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/location.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/models/route_states.dart';
import 'package:swiss_travel/tabs/routes/route_tile.dart';
import 'package:swiss_travel/tabs/routes/suggested.dart';
import 'package:swiss_travel/utils/complete.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/input_dialog.dart';

final _isLocating = StateProvider((_) => false);
final _timeTypeProvider = StateProvider((_) => false);
final _dateProvider = StateProvider((_) => DateTime.now());
final _timeProvider = StateProvider((_) => TimeOfDay.now());
final _routesProvider = StateProvider((_) => const RouteStates.empty());

class SearchRoute extends StatefulWidget {
  final LocalRoute localRoute;
  final String destination;

  const SearchRoute({Key key, this.localRoute, this.destination}) : super(key: key);

  @override
  SearchRouteState createState() => SearchRouteState();
}

class SearchRouteState extends State<SearchRoute> with AutomaticKeepAliveClientMixin {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final FocusNode fnFrom = FocusNode();
  final FocusNode fnTo = FocusNode();
  CffRepository _cff;
  FavoritesSharedPreferencesStore _store;

  @override
  void initState() {
    super.initState();
    _cff = context.read(cffProvider) as CffRepository;
    _store = context.read(storeProvider) as FavoritesSharedPreferencesStore;
    if (widget.localRoute != null) {
      useLocalRoute();
    } else if (widget.destination != null) {
      goToDest();
    }
  }

  void useLocalRoute() {
    fromController.text = widget.localRoute.from;
    toController.text = widget.localRoute.to;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read(_timeProvider).state = TimeOfDay.now();
      context.read(_dateProvider).state = DateTime.now();
      searchData();
    });
  }

  void goToDest() {
    toController.text = widget.destination;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read(_routesProvider).state = const RouteStates.loading();
      context.read(_timeProvider).state = TimeOfDay.now();
      context.read(_dateProvider).state = DateTime.now();
      await locate();
      await searchData();
    });
  }

  @override
  void dispose() {
    fnFrom.dispose();
    fnTo.dispose();
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: widget.localRoute != null || widget.destination != null
          ? AppBar(
              leading: widget.localRoute != null || widget.destination != null
                  ? const CloseButton()
                  : null,
              title: Text(widget.localRoute?.displayName ?? "Route"),
              automaticallyImplyLeading: false,
            )
          : null,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TypeAheadField<CffCompletion>(
                    key: const Key("route-first-textfield-key"),
                    debounceDuration: const Duration(milliseconds: 500),
                    textFieldConfiguration: TextFieldConfiguration(
                        focusNode: fnFrom,
                        controller: fromController,
                        onSubmitted: (_) => fnTo.requestFocus(),
                        textInputAction: TextInputAction.next,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "From",
                            isDense: true,
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () => fromController.text = ""))),
                    suggestionsCallback: (s) async =>
                        completeWithFavorites(_store, await _cff.complete(s), s),
                    itemBuilder: (context, suggestion) => SuggestedTile(suggestion),
                    onSuggestionSelected: (suggestion) {
                      fromController.text = suggestion.label;
                      searchData();
                    },
                    noItemsFoundBuilder: (_) => const SizedBox(),
                    transitionBuilder: (context, suggestionsBox, controller) => FadeTransition(
                      opacity: controller,
                      child: suggestionsBox,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                    icon: Consumer(builder: (context, w, _) {
                      final loading = w(_isLocating).state;
                      return loading
                          ? const CircularProgressIndicator()
                          : const FaIcon(FontAwesomeIcons.locationArrow);
                    }),
                    onPressed: () => locate())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TypeAheadField<CffCompletion>(
                    key: const Key("route-second-textfield-key"),
                    debounceDuration: const Duration(milliseconds: 500),
                    textFieldConfiguration: TextFieldConfiguration(
                        textInputAction: TextInputAction.search,
                        focusNode: fnTo,
                        onSubmitted: (_) => searchData(),
                        controller: toController,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "To",
                            isDense: true,
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () => toController.text = ""))),
                    suggestionsCallback: (s) async =>
                        completeWithFavorites(_store, await _cff.complete(s), s),
                    itemBuilder: (context, suggestion) => SuggestedTile(suggestion),
                    onSuggestionSelected: (suggestion) {
                      toController.text = suggestion.label;
                      searchData();
                    },
                    noItemsFoundBuilder: (_) => const SizedBox(),
                    transitionBuilder: (context, suggestionsBox, controller) => FadeTransition(
                      opacity: controller,
                      child: suggestionsBox,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                    icon: const FaIcon(FontAwesomeIcons.arrowsAltV),
                    onPressed: () {
                      final from = fromController.text;
                      fromController.text = toController.text;
                      toController.text = from;
                    }),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 48,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer(builder: (context, w, _) {
                  final sw = w(_timeTypeProvider);
                  return DropdownButton<bool>(
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: false,
                        child: Text("Depart."),
                      ),
                      DropdownMenuItem(
                        value: true,
                        child: Text("Arrival"),
                      ),
                    ],
                    onChanged: (v) => sw.state = v,
                    value: sw.state,
                  );
                }),
                FlatButton.icon(
                  padding: const EdgeInsets.only(left: 8, right: 12),
                  onPressed: () async {
                    final _time = context.read(_timeProvider);
                    final time = await showTimePicker(
                      context: context,
                      initialTime: _time.state,
                    );
                    if (time == null) return;
                    _time.state = time;
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.clock,
                    size: 16,
                  ),
                  label: Consumer(builder: (context, w, _) {
                    final _time = w(_timeProvider);
                    return Text(
                        "${_time.state.hour}:${_time.state.minute.toString().padLeft(2, "0")}");
                  }),
                ),
                Consumer(builder: (context, w, _) {
                  final _date = w(_dateProvider);
                  return FlatButton.icon(
                    padding: const EdgeInsets.only(left: 8, right: 12),
                    onPressed: () async {
                      final now = DateTime.now();
                      final dateTime = await showDatePicker(
                        context: context,
                        initialDate: _date.state,
                        firstDate: now.subtract(const Duration(days: 14)),
                        lastDate: now.add(const Duration(days: 28)),
                      );
                      if (dateTime == null) return;
                      _date.state = dateTime;
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.calendar,
                      size: 16,
                    ),
                    label: Text("${_date.state.day}/${_date.state.month}/${_date.state.year}"),
                  );
                }),
                Tooltip(
                  message: "Reset time",
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      final time = context.read(_timeProvider);
                      final nowTime = TimeOfDay.now();
                      time.state = nowTime;
                      final date = context.read(_dateProvider);
                      final nowDate = DateTime.now();
                      date.state = nowDate;
                      searchData();
                    },
                    icon: const Icon(Icons.restore),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Center(
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(boxShadow: [DynamicTheme.shadowOf(context).buttonShadow]),
                  child: FlatButton.icon(
                    key: const Key("search-route"),
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    height: 48,
                    highlightColor: const Color(0x260700b1),
                    icon: const FaIcon(FontAwesomeIcons.search),
                    onPressed: () => searchData(),
                    onLongPress: kReleaseMode
                        ? null
                        : () {
                            fromController.text =
                                "Université de Genève, Genève, Rue du Général-Dufour 24";
                            toController.text = "Badenerstrasse 549, 8048 Zürich";
                            searchData();
                          },
                    shape: const StadiumBorder(),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    label: const Text("Search"),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Consumer(builder: (context, w, _) {
                  final _store = w(storeProvider) as FavoritesSharedPreferencesStore;
                  w(_routesProvider);
                  return FlatButton(
                    shape: const StadiumBorder(),
                    onPressed: () async {
                      log(_store.routes.toString());
                      if (_store.routes.any(
                        (lr) => lr.from == fromController.text && lr.to == toController.text,
                      )) {
                        Scaffold.of(context).showSnackBar(const SnackBar(
                            content: Text("This route is already in your favorites !")));
                        return;
                      }

                      final s = await input(context, title: const Text("Enter route name"));
                      if (s == null) return;
                      context.read(storeProvider).addRoute(
                          LocalRoute(fromController.text, toController.text, displayName: s));
                      Scaffold.of(context)
                          .showSnackBar(const SnackBar(content: Text("Route starred !")));
                    },
                    child: _store.routes.any(
                            (lr) => lr.from == fromController.text && lr.to == toController.text)
                        ? const Icon(Icons.star)
                        : const Icon(Icons.star_border),
                  );
                }),
              ),
              Positioned(
                  left: 0,
                  child: Tooltip(
                    message: "Clear everything",
                    child: FlatButton(
                      shape: const StadiumBorder(),
                      onPressed: () async {
                        fromController.clear();
                        toController.clear();
                        context.read(_routesProvider).state = const RouteStates.empty();
                      },
                      child: const Icon(Icons.clear),
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Consumer(
                builder: (context, w, _) => w(_routesProvider).state.map(
                    routes: (data) => ListView.builder(
                        // separatorBuilder: (c, i) => const Divider(height: 0),
                        shrinkWrap: true,
                        itemCount: data.routes == null ? 0 : data.routes.connections.length,
                        itemBuilder: (context, i) => RouteTile(
                              key: Key("routetile-$i"),
                              route: data.routes,
                              i: i,
                            )),
                    network: (_) => Column(
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
                    exception: (e) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(
                              Icons.bug_report,
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              e.exception.toString(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                    loading: (_) => const CustomScrollView(
                          slivers: [
                            SliverFillRemaining(child: Center(child: CircularProgressIndicator()))
                          ],
                        ),
                    empty: (_) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "🔎",
                              style: TextStyle(fontSize: 48),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Search a route",
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ))),
          )
        ],
      ),
    );
  }

  Future<void> locate() async {
    context.read(_isLocating).state = true;
    try {
      final p = await context.read(locationProvider).getLocation(context: context);
      log("Position is : $p");
      if (p == null) throw StateError("We got no location");
      final completions = await context.read(cffProvider).findStation(p.latitude, p.longitude);
      final first = completions.first;
      log("Found : $first");
      if (first.dist != null) {
        fromController.text = completions.first.label;
      }
    } finally {
      context.read(_isLocating).state = false;
      fnFrom.unfocus();
    }
  }

  Future<void> searchData() async {
    fnFrom.unfocus();
    fnTo.unfocus();
    if (fromController.text.length > 2 && toController.text.length > 2) {
      context.read(_routesProvider).state = const RouteStates.loading();
      try {
        final CffRoute it = await _cff.route(
          Stop(fromController.text),
          Stop(toController.text),
          date: context.read(_dateProvider).state,
          time: context.read(_timeProvider).state,
          typeTime: context.read(_timeTypeProvider).state ? TimeType.arrival : TimeType.depart,
        );
        context.read(_routesProvider).state = RouteStates.routes(it);
      } on SocketException {
        context.read(_routesProvider).state = const RouteStates.network();
      } on Exception catch (e, s) {
        context.read(_routesProvider).state = RouteStates.exception(e);
        FirebaseCrashlytics.instance.recordError(e, s, printDetails: true);
      }
    } else {
      context.read(_routesProvider).state = const RouteStates.empty();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
