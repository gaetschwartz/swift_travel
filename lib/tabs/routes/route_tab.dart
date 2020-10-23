import 'dart:developer';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:swiss_travel/api/cff/models/cff_completion.dart';
import 'package:swiss_travel/api/cff/models/cff_route.dart';
import 'package:swiss_travel/api/cff/models/local_route.dart';
import 'package:swiss_travel/blocs/cff.dart';
import 'package:swiss_travel/blocs/location.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:swiss_travel/models/route_states.dart';
import 'package:swiss_travel/models/route_textfield_state.dart';
import 'package:swiss_travel/tabs/routes/route_tile.dart';
import 'package:swiss_travel/tabs/routes/suggested.dart';
import 'package:swiss_travel/utils/complete.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/datepicker.dart';
import 'package:utils/dialogs/input_dialog.dart';

final _isLocating = StateProvider((_) => false);
final _timeTypeProvider = StateProvider((_) => TimeType.depart);
final _dateProvider = StateProvider((_) => DateTime.now());

final _fromTextfieldProvider = StateProvider((_) => const RouteTextfieldState.empty());
final _toTextfieldProvider = StateProvider((_) => const RouteTextfieldState.empty());

final _fetcher = Fetcher();
final _futureRouteProvider = ChangeNotifierProvider<Fetcher>((ref) {
  _fetcher.fetch(ref);
  return _fetcher;
});

class Fetcher extends ChangeNotifier {
  RouteStates _state = const RouteStates.empty();

  RouteStates get state => _state;

  set state(RouteStates state) {
    _state = state;
    notifyListeners();
  }

  Future<void> fetch(ProviderReference ref) async {
    final from = ref.watch(_fromTextfieldProvider).state;
    final to = ref.watch(_toTextfieldProvider).state;
    final _cff = ref.read(cffProvider);
    final date = ref.watch(_dateProvider).state;
    final timeType = ref.watch(_timeTypeProvider).state;

    if (from is RouteTextfieldStateEmpty || to is RouteTextfieldStateEmpty) {
      return;
    }

    state = const RouteStates.loading();
    final departure = from.when(
        empty: () => null, text: (t) => t, currentLocation: (loc, lat, lon) => "$lat,$lon");
    final arrival =
        to.when(empty: () => null, text: (t) => t, currentLocation: (loc, lat, lon) => "$lat,$lon");
    log("Fetching route from $departure to $arrival");
    try {
      final CffRoute it = await _cff.route(
        departure,
        arrival,
        date: date,
        time: TimeOfDay.fromDateTime(date),
        typeTime: timeType,
      );
      state = RouteStates.routes(it);
    } on SocketException {
      state = const RouteStates.network();
    } on Exception catch (e, s) {
      FirebaseCrashlytics.instance.recordError(e, s, printDetails: true);
      state = RouteStates.exception(e);
    }
  }
}

class SearchRoute extends StatefulWidget {
  final LocalRoute localRoute;
  final String destination;

  const SearchRoute({Key key, this.localRoute, this.destination}) : super(key: key);

  @override
  SearchRouteState createState() => SearchRouteState();
}

class SearchRouteState extends State<SearchRoute> with AutomaticKeepAliveClientMixin {
  final FocusNode fnFrom = FocusNode();
  final FocusNode fnTo = FocusNode();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
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
    _fromController.text = widget.localRoute.from;
    _toController.text = widget.localRoute.to;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      unFocusFields();
      context.read(_dateProvider).state = DateTime.now();
    });
  }

  void goToDest() {
    _toController.text = widget.destination;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      unFocusFields();
      context.read(_dateProvider).state = DateTime.now();
      await locate();
    });
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    fnFrom.dispose();
    fnTo.dispose();
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
                  child: buildFromField(context),
                ),
                const SizedBox(width: 8),
                Tooltip(
                  message: "Use current location",
                  child: IconButton(
                      icon: Consumer(builder: (context, w, _) {
                        final loading = w(_isLocating).state;
                        return loading
                            ? const CircularProgressIndicator()
                            : const FaIcon(FontAwesomeIcons.locationArrow);
                      }),
                      onPressed: () => locate()),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: buildToField(context),
                ),
                const SizedBox(width: 8),
                Tooltip(
                  message: 'Switch inputs',
                  child: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.arrowsAltV),
                    onPressed: () => switchInputs(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 48,
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: 48,
                    child: FlatButton(
                      shape: const StadiumBorder(),
                      onPressed: () async {
                        final _date = context.read(_dateProvider);
                        TimeType type = context.read(_timeTypeProvider).state;
                        final date = await pickDate(context,
                            initialDateTime:
                                _date.state.subtract(Duration(minutes: _date.state.minute % 5)),
                            minuteInterval: 5,
                            bottom: _Segmented(
                              onChange: (v) => type = v,
                              initialValue: type,
                            ));
                        if (date != null) _date.state = date;
                        if (type != null) context.read(_timeTypeProvider).state = type;
                      },
                      child: Consumer(builder: (context, w, _) {
                        final _date = w(_dateProvider);
                        final time = w(_timeTypeProvider);
                        final dateFormatted = DateFormat("d MMM y").format(_date.state);
                        final timeFormatted = DateFormat("H:mm").format(_date.state);
                        final type = describeEnum(time.state);
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("${type[0].toUpperCase()}${type.substring(1, 3)}."),
                            const VerticalDivider(indent: 12, endIndent: 12, thickness: 1.5),
                            Text(dateFormatted),
                            const VerticalDivider(indent: 12, endIndent: 12, thickness: 1.5),
                            Text(timeFormatted),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Tooltip(
                    message: "Reset time",
                    child: IconButton(
                      onPressed: () {
                        final date = context.read(_dateProvider);
                        final nowDate = DateTime.now();
                        date.state = nowDate;
                        unFocusFields();
                      },
                      icon: const Icon(Icons.restore),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 48,
            child: Stack(
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
                      onPressed: () {
                        unFocusFields();
                        searchFromText();
                      },
                      onLongPress: kReleaseMode
                          ? null
                          : () {
                              unFocusFields();
                              _fromController.text =
                                  "Université de Genève, Genève, Rue du Général-Dufour 24";
                              _toController.text = "Badenerstrasse 549, 8048 Zürich";
                              searchFromText();
                            },
                      shape: const StadiumBorder(),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      label: const Text("Search"),
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    child: Tooltip(
                      message: "Favorite route",
                      child: IconButton(
                        onPressed: () async {
                          final _store =
                              context.read(storeProvider) as FavoritesSharedPreferencesStore;
                          log(_store.routes.toString());
                          if (_store.routes.any(
                            (lr) => lr.from == _fromController.text && lr.to == _toController.text,
                          )) {
                            Scaffold.of(context).showSnackBar(const SnackBar(
                                content: Text("This route is already in your favorites !")));
                            return;
                          }

                          final s = await input(context, title: const Text("Enter route name"));
                          if (s == null) return;
                          context.read(storeProvider).addRoute(
                              LocalRoute(_fromController.text, _toController.text, displayName: s));
                          Scaffold.of(context)
                              .showSnackBar(const SnackBar(content: Text("Route starred !")));
                        },
                        icon: Consumer(builder: (context, w, _) {
                          final _store = w(storeProvider) as FavoritesSharedPreferencesStore;
                          w(_futureRouteProvider);

                          return _store.routes.any((lr) =>
                                  lr.from == _fromController.text && lr.to == _toController.text)
                              ? const Icon(Icons.star)
                              : const Icon(Icons.star_border);
                        }),
                      ),
                    )),
                Positioned(
                    left: 0,
                    child: Tooltip(
                      message: "Clear everything",
                      child: IconButton(
                        onPressed: () async {
                          _fromController.clear();
                          _toController.clear();
                          context.read(_futureRouteProvider).state = const RouteStates.empty();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Expanded(child: RoutesView())
        ],
      ),
    );
  }

  void searchFromText() {
    context.read(_fromTextfieldProvider).state = RouteTextfieldState.text(_fromController.text);
    context.read(_toTextfieldProvider).state = RouteTextfieldState.text(_toController.text);
  }

  Widget buildFromField(BuildContext context) {
    return InputWrapperDecoration(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TypeAheadField<CffCompletion>(
            key: const Key("route-first-textfield-key"),
            debounceDuration: const Duration(milliseconds: 500),
            textFieldConfiguration: TextFieldConfiguration(
              focusNode: fnFrom,
              controller: _fromController,
              onSubmitted: (_) => fnTo.requestFocus(),
              textInputAction: TextInputAction.next,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: "From",
                isDense: true,
                filled: true,
                fillColor: Theme.of(context).cardColor,
                contentPadding: const EdgeInsets.only(left: 8, right: 48),
                suffixIcon: const SizedBox(),
              ),
            ),
            suggestionsCallback: (s) async =>
                completeWithFavorites(_store, await _cff.complete(s), s),
            itemBuilder: (context, suggestion) => SuggestedTile(suggestion),
            onSuggestionSelected: (suggestion) {
              _fromController.text = suggestion.label;
              context.read(_fromTextfieldProvider).state =
                  RouteTextfieldState.text(suggestion.label);
            },
            noItemsFoundBuilder: (_) => const SizedBox(),
            transitionBuilder: (context, suggestionsBox, controller) => FadeTransition(
              opacity: controller,
              child: suggestionsBox,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _fromController.text = "";
              context.read(_fromTextfieldProvider).state = const RouteTextfieldState.empty();
            },
          ),
        ],
      ),
    );
  }

  Widget buildToField(BuildContext context) {
    return InputWrapperDecoration(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TypeAheadField<CffCompletion>(
            key: const Key("route-second-textfield-key"),
            debounceDuration: const Duration(milliseconds: 500),
            textFieldConfiguration: TextFieldConfiguration(
              textInputAction: TextInputAction.search,
              focusNode: fnTo,
              onSubmitted: (_) => unFocusFields(),
              controller: _toController,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: "To",
                isDense: true,
                filled: true,
                fillColor: Theme.of(context).cardColor,
                contentPadding: const EdgeInsets.only(left: 8, right: 48),
                suffixIcon: const SizedBox(),
              ),
            ),
            suggestionsCallback: (s) async =>
                completeWithFavorites(_store, await _cff.complete(s), s),
            itemBuilder: (context, suggestion) => SuggestedTile(suggestion),
            onSuggestionSelected: (suggestion) {
              _toController.text = suggestion.label;
              context.read(_toTextfieldProvider).state = RouteTextfieldState.text(suggestion.label);
            },
            noItemsFoundBuilder: (_) => const SizedBox(),
            transitionBuilder: (context, suggestionsBox, controller) => FadeTransition(
              opacity: controller,
              child: suggestionsBox,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _toController.text = "";
              context.read(_toTextfieldProvider).state = const RouteTextfieldState.empty();
            },
          ),
        ],
      ),
    );
  }

  void switchInputs() {
    final String from = _fromController.text;
    final String to = _toController.text;
    _fromController.text = to;
    _toController.text = from;
    final StateController<RouteTextfieldState> fromState = context.read(_fromTextfieldProvider);
    final StateController<RouteTextfieldState> toState = context.read(_toTextfieldProvider);
    final RouteTextfieldState fromS = fromState.state;
    fromState.state = toState.state;
    toState.state = fromS;
  }

  Future<void> locate() async {
    context.read(_isLocating).state = true;
    unFocusFields();
    try {
      final Position p = await context.read(locationProvider).getLocation(context: context);
      log("Position is : $p");
      if (p == null) throw StateError("We got no location");
      final List<CffCompletion> completions =
          await context.read(cffProvider).findStation(p.latitude, p.longitude);
      final CffCompletion first = completions.first;
      log("Found : $first");
      if (first.dist != null) {
        _fromController.text = completions.first.label;
        context.read(_fromTextfieldProvider).state =
            RouteTextfieldState.currentLocation(first.label, lat: p.latitude, lon: p.longitude);
      }
    } finally {
      context.read(_isLocating).state = false;
      fnFrom.unfocus();
    }
  }

  void unFocusFields() {
    fnFrom.unfocus();
    fnTo.unfocus();
  }

  @override
  bool get wantKeepAlive => true;
}

class RoutesView extends StatelessWidget {
  const RoutesView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, w, _) {
      final Fetcher fetcher = w(_futureRouteProvider);
      return fetcher.state.map(
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
                slivers: [SliverFillRemaining(child: Center(child: CircularProgressIndicator()))],
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
              ));
    });
  }
}

class InputWrapperDecoration extends StatelessWidget {
  final Widget child;

  const InputWrapperDecoration({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [DynamicTheme.shadowOf(context).buttonShadow],
      ),
      child: child,
    );
  }
}

class _Segmented extends StatefulWidget {
  const _Segmented({
    Key key,
    @required this.onChange,
    @required this.initialValue,
  }) : super(key: key);

  final ValueChanged<TimeType> onChange;
  final TimeType initialValue;

  @override
  __SegmentedState createState() => __SegmentedState();
}

class __SegmentedState extends State<_Segmented> {
  TimeType _type;

  @override
  void initState() {
    super.initState();
    _type = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<TimeType>(
      groupValue: _type,
      onValueChanged: (v) {
        setState(() => _type = v);
        widget.onChange(v);
      },
      children: {
        TimeType.depart: Text(
          "Departure",
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        TimeType.arrival: Text(
          "Arrival",
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
      },
    );
  }
}
