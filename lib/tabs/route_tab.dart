import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swiss_travel/api/cff/cff_completion.dart';
import 'package:swiss_travel/api/cff/cff_route.dart';
import 'package:swiss_travel/api/cff/leg.dart';
import 'package:swiss_travel/api/cff/local_route.dart';
import 'package:swiss_travel/api/cff/route_connection.dart';
import 'package:swiss_travel/api/cff/stop.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/models/route_states.dart';
import 'package:swiss_travel/pages/route_details.dart';
import 'package:swiss_travel/utils/conplete.dart';
import 'package:swiss_travel/utils/format.dart';
import 'package:swiss_travel/widget/icon.dart';
import 'package:utils/dialogs/input_dialog.dart';

final _loadingProvider = StateProvider((_) => false);
final _switchProvider = StateProvider((_) => false);
final _dateProvider = StateProvider((_) => DateTime.now());
final _timeProvider = StateProvider((_) => TimeOfDay.now());
final _routesProvider = StateProvider((_) => const RouteStates.empty());

class SearchRoute extends StatefulWidget {
  final LocalRoute localRoute;

  const SearchRoute({Key key, this.localRoute}) : super(key: key);
  @override
  _SearchRouteState createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> with AutomaticKeepAliveClientMixin {
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
      fromController.text = widget.localRoute.from;
      toController.text = widget.localRoute.to;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        searchData();
      });
    }
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
      appBar: widget.localRoute != null
          ? AppBar(
              title: const Text("Route"),
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
                    debounceDuration: const Duration(milliseconds: 500),
                    textFieldConfiguration: TextFieldConfiguration(
                        focusNode: fnFrom,
                        controller: fromController,
                        onSubmitted: (_) => fnTo.requestFocus(),
                        textInputAction: TextInputAction.next,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "From",
                          isDense: true,
                        )),
                    suggestionsCallback: (s) async =>
                        completeWithFavorites(_store, await _cff.complete(s), s),
                    itemBuilder: (context, suggestion) => _SuggestedTile(suggestion),
                    onSuggestionSelected: (suggestion) => fromController.text = suggestion.label,
                    noItemsFoundBuilder: (_) => const SizedBox(),
                    transitionBuilder: (context, suggestionsBox, controller) => FadeTransition(
                      opacity: controller,
                      child: suggestionsBox,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(icon: Consumer(builder: (context, w, _) {
                  final loading = w(_loadingProvider).state;
                  return loading
                      ? const CircularProgressIndicator()
                      : const FaIcon(FontAwesomeIcons.locationArrow);
                }), onPressed: () async {
                  context.read(_loadingProvider).state = true;
                  try {
                    final p = await getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.bestForNavigation);

                    log("Position is : $p");
                    final completions =
                        await context.read(cffProvider).findStation(p.latitude, p.longitude);

                    final first = completions.first;
                    log("Found : $first");
                    if (first.dist != null) {
                      fromController.text = completions.first.label;
                    }
                  } finally {
                    context.read(_loadingProvider).state = false;
                  }
                })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TypeAheadField<CffCompletion>(
                    debounceDuration: const Duration(milliseconds: 500),
                    textFieldConfiguration: TextFieldConfiguration(
                        textInputAction: TextInputAction.search,
                        focusNode: fnTo,
                        onSubmitted: (_) => search(),
                        controller: toController,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "To",
                          isDense: true,
                        )),
                    suggestionsCallback: (s) async =>
                        completeWithFavorites(_store, await _cff.complete(s), s),
                    itemBuilder: (context, suggestion) => _SuggestedTile(suggestion),
                    onSuggestionSelected: (suggestion) => toController.text = suggestion.label,
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
                  final sw = w(_switchProvider);
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
                Consumer(builder: (context, w, _) {
                  final _time = w(_timeProvider);
                  return FlatButton.icon(
                    onPressed: () async {
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
                    label: Text(
                        "${_time.state.hour}:${_time.state.minute.toString().padLeft(2, "0")}"),
                  );
                }),
                Consumer(builder: (context, w, _) {
                  final _date = w(_dateProvider);
                  return FlatButton.icon(
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
                Expanded(
                    child: FlatButton(
                  shape: const StadiumBorder(),
                  onPressed: () {
                    final time = context.read(_timeProvider);
                    final nowTime = TimeOfDay.now();
                    time.state = nowTime;
                    final date = context.read(_dateProvider);
                    final nowDate = DateTime.now();
                    date.state = nowDate;
                    search();
                  },
                  child: const Icon(Icons.restore),
                )),
              ],
            ),
          ),
          Stack(
            children: [
              Center(
                child: DecoratedBox(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(blurRadius: 16, color: Color(0x260700b1), offset: Offset(0, 8))
                  ]),
                  child: FlatButton.icon(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    height: 48,
                    highlightColor: const Color(0x260700b1),
                    icon: const FaIcon(FontAwesomeIcons.search),
                    onPressed: search,
                    onLongPress: kReleaseMode
                        ? null
                        : () {
                            fromController.text =
                                "Université de Genève, Genève, Rue du Général-Dufour 24";
                            toController.text = "Badenerstrasse 549, 8048 Zürich";
                            search();
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
                        Scaffold.of(context)
                            .showSnackBar(const SnackBar(content: Text("Already added")));
                        return;
                      }

                      final s = await input(context, title: const Text("Enter route name"));
                      if (s == null) return;
                      context
                          .read(storeProvider)
                          .addRoute(LocalRoute(s, fromController.text, toController.text));
                      Scaffold.of(context).showSnackBar(const SnackBar(content: Text("Added")));
                    },
                    child: _store.routes.any(
                            (lr) => lr.from == fromController.text && lr.to == toController.text)
                        ? const Icon(Icons.star)
                        : const Icon(Icons.star_border),
                  );
                }),
              ),
            ],
          ),
          Expanded(
            child: Consumer(
                builder: (context, w, _) => w(_routesProvider).state.map(
                      routes: (data) => ListView.separated(
                          separatorBuilder: (c, i) => const Divider(),
                          shrinkWrap: true,
                          itemCount: data.routes == null ? 0 : data.routes.connections.length,
                          itemBuilder: (context, i) => RouteTile(c: data.routes.connections[i])),
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
                      error: (e) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            Icons.bug_report,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            e.error.toString(),
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
                          const FaIcon(
                            Icons.search,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Search a route",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Future<void> search() async {
    fnFrom.unfocus();
    fnTo.unfocus();
    await searchData();
  }

  Future<void> searchData() async {
    if (fromController.text.length > 2 && toController.text.length > 2) {
      context.read(_routesProvider).state = const RouteStates.loading();
      try {
        final CffRoute it = await _cff.route(
          Stop(fromController.text),
          Stop(toController.text),
          date: context.read(_dateProvider).state,
          time: context.read(_timeProvider).state,
          typeTime: context.read(_switchProvider).state ? TimeType.arrival : TimeType.depart,
        );
        context.read(_routesProvider).state = RouteStates.routes(it);
      } on SocketException {
        context.read(_routesProvider).state = const RouteStates.network();
      } catch (e) {
        context.read(_routesProvider).state = RouteStates.error(e);
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class _SuggestedTile extends StatelessWidget {
  const _SuggestedTile(
    this.suggestion, {
    Key key,
  }) : super(key: key);
  final CffCompletion suggestion;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CffIcon.fromIconClass(suggestion.iconclass),
      title: Text(suggestion.label),
      trailing: suggestion.isFavorite ? const Text("⭐") : null,
      dense: true,
    );
  }
}

class RouteTile extends StatelessWidget {
  const RouteTile({
    Key key,
    @required this.c,
  }) : super(key: key);

  final RouteConnection c;

  Widget rowIcon() {
    final List<Widget> listWidget = [];

    for (int i = 0; i < c.legs.length - 1; i++) {
      final Leg l = c.legs[i];
      listWidget.add(CffIcon(l.type, size: 18));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Wrap(spacing: 8, children: listWidget),
        ),
        const SizedBox(height: 4),
        Text("${Format.dateTime(c.departure)} - ${Format.dateTime(c.arrival)}")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${c.legs.length - 1} steps"),
      subtitle: rowIcon(),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(Format.intToDuration(c.duration)),
          const SizedBox(width: 4),
          const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
        ],
      ),
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsRoute(c: c))),
    );
  }
}
