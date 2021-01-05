import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:swift_travel/apis/cff/cff.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:swift_travel/apis/cff/models/favorite_stop.dart';
import 'package:swift_travel/apis/cff/models/local_route.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/generated/l10n.dart';
import 'package:swift_travel/models/route_states.dart';
import 'package:swift_travel/models/route_textfield_state.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';
import 'package:swift_travel/tabs/routes/suggested.dart';
import 'package:swift_travel/utils/complete.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/page.dart';
import 'package:utils/blocs/theme/dynamic_theme.dart';
import 'package:utils/dialogs/datepicker.dart';
import 'package:utils/dialogs/input_dialog.dart';
import 'package:vibration/vibration.dart';

final _timeTypeProvider = StateProvider((_) => TimeType.depart);
final _dateProvider = StateProvider((_) => DateTime.now());

final _fromTextfieldProvider = StateProvider((_) => const RouteTextfieldState.useCurrentLocation());
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
    final from = ref.watch(_fromTextfieldProvider);
    final to = ref.watch(_toTextfieldProvider);
    final _cff = ref.read(navigationAPIProvider);
    final date = ref.watch(_dateProvider).state;
    final timeType = ref.watch(_timeTypeProvider).state;

    if (from.state is EmptyRouteState || to.state is EmptyRouteState) {
      if (from.state is EmptyRouteState && to.state is EmptyRouteState) {
        state = const RouteStates.empty();
      }
      return;
    } else {
      state = const RouteStates.loading();
    }

    Position p;

    try {
      final departure = await from.state.when<FutureOr<String>>(
        empty: () => null,
        text: (t) => t,
        useCurrentLocation: () async {
          p ??= await Geolocator.getCurrentPosition();
          return "${p.latitude},${p.longitude}";
        },
      );
      final arrival = await to.state.when<FutureOr<String>>(
        empty: () => null,
        text: (t) => t,
        useCurrentLocation: () async {
          p ??= await Geolocator.getCurrentPosition();
          return "${p.latitude},${p.longitude}";
        },
      );
      log('Fetching route from $departure to $arrival');
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
    } on MissingPluginException catch (e) {
      state = RouteStates.exception(e);
    } on Exception catch (e, s) {
      state = RouteStates.exception(e);
      report(e, s, name: 'Fetch');
      // ignore: avoid_catching_errors
    } on Error catch (e) {
      state = RouteStates.exception(e);
      report(e, e.stackTrace, name: 'Fetch');
    }
  }
}

class RouteSearchTab extends StatefulWidget {
  const RouteSearchTab();

  @override
  _RouteSearchTabState createState() => _RouteSearchTabState();
}

class _RouteSearchTabState extends State<RouteSearchTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      pages: const [MyPage(SearchRoute())],
      onPopPage: (_, __) => false,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SearchRoute extends StatefulWidget {
  final LocalRoute localRoute;
  final FavoriteStop favStop;

  const SearchRoute({Key key})
      : favStop = null,
        localRoute = null,
        super(key: key);

  const SearchRoute.route(this.localRoute, {Key key})
      : favStop = null,
        super(key: key);

  const SearchRoute.stop(this.favStop, {Key key})
      : localRoute = null,
        super(key: key);

  @override
  _SearchRouteState createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> {
  final FocusNode fnFrom = FocusNode();
  final FocusNode fnTo = FocusNode();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  FavoritesSharedPreferencesStore _store;

  @override
  void initState() {
    super.initState();
    _store = context.read(storeProvider) as FavoritesSharedPreferencesStore;
    if (widget.localRoute != null) {
      useLocalRoute();
    } else if (widget.favStop != null) {
      goToDest();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) => clearProviders());
    }

    fnFrom.addListener(_onFocusFromChanged);
    fnTo.addListener(_onFocusToChanged);
  }

  void _onFocusToChanged() {
    if (fnTo.hasFocus) {
      Vibration.select();
    }
  }

  void _onFocusFromChanged() {
    if (fnFrom.hasFocus) {
      Vibration.select();
    }
  }

  void useLocalRoute() {
    _fromController.text = widget.localRoute.from;
    _toController.text = widget.localRoute.to;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      unFocusFields();
      context.read(_futureRouteProvider).state = const RouteStates.empty();
      context.read(_dateProvider).state = DateTime.now();
      context.read(_fromTextfieldProvider).state = RouteTextfieldState.text(widget.localRoute.from);
      context.read(_toTextfieldProvider).state = RouteTextfieldState.text(widget.localRoute.to);
    });
  }

  void clearProviders() {
    context.read(_futureRouteProvider).state = const RouteStates.empty();
    context.read(_dateProvider).state = DateTime.now();
    context.read(_fromTextfieldProvider).state = const RouteTextfieldState.useCurrentLocation();
    context.read(_toTextfieldProvider).state = const RouteTextfieldState.empty();
  }

  void goToDest() {
    _toController.text = widget.favStop.stop;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      clearProviders();
      unFocusFields();
      context.read(_toTextfieldProvider).state = RouteTextfieldState.text(widget.favStop.stop);
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: widget.localRoute != null || widget.favStop != null
          ? AppBar(
              leading:
                  widget.localRoute != null || widget.favStop != null ? const CloseButton() : null,
              title: Text(widget.localRoute?.displayName ?? Strings.of(context).tabs_route),
              automaticallyImplyLeading: false,
            )
          : swiftTravelAppBar(context),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4, left: 8, top: 8, bottom: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: buildFromField(context),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4, left: 8, top: 4, bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: buildToField(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: IconButton(
                  tooltip: 'Switch inputs',
                  icon: const Icon(CupertinoIcons.arrow_up_arrow_down),
                  onPressed: () {
                    Vibration.select();
                    switchInputs();
                  },
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 40,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    child: IconButton(
                      tooltip: Strings.of(context).fav_route,
                      onPressed: () async {
                        Vibration.select();
                        final _store =
                            context.read(storeProvider) as FavoritesSharedPreferencesStore;
                        log(_store.routes.toString());
                        if (_store.routes.any(
                          (lr) => lr.from == _fromController.text && lr.to == _toController.text,
                        )) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text('This route is already in your favorites !')));
                          return;
                        }

                        final s = await input(context, title: const Text('Enter route name'));
                        if (s == null) return;
                        context.read(storeProvider).addRoute(
                            LocalRoute(_fromController.text, _toController.text, displayName: s));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text('Route starred !')));
                      },
                      icon: Consumer(builder: (context, w, _) {
                        final _store = w(storeProvider) as FavoritesSharedPreferencesStore;
                        w(_futureRouteProvider);

                        return _store.routes.any((lr) =>
                                lr.from == _fromController.text && lr.to == _toController.text)
                            ? const Icon(Icons.star)
                            : const Icon(Icons.star_border);
                      }),
                    )),
                Center(
                  child: SizedBox(
                    height: 48,
                    child: Tooltip(
                      message: 'Change date and time',
                      child: TextButton(
                        onLongPress: kDebugMode
                            ? () {
                                unFocusFields();
                                _fromController.text =
                                    'Université de Genève, Genève, Rue du Général-Dufour 24';
                                _toController.text = 'Badenerstrasse 549, 8048 Zürich';
                                context.read(_fromTextfieldProvider).state =
                                    RouteTextfieldState.text(_fromController.text);
                                context.read(_toTextfieldProvider).state =
                                    RouteTextfieldState.text(_toController.text);
                              }
                            : null,
                        style: TextButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: Theme.of(context).textTheme.button.color),
                        onPressed: () async {
                          Vibration.select();
                          TimeType type = context.read(_timeTypeProvider).state;
                          final _date = context.read(_dateProvider);
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
                          final _time = w(_timeTypeProvider);
                          final dateFormatted = DateFormat('d MMM y').format(_date.state);
                          final timeFormatted = DateFormat('H:mm').format(_date.state);
                          final type = describeEnum(_time.state);
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('${type[0].toUpperCase()}${type.substring(1, 3)}.'),
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
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    tooltip: Strings.of(context).use_current_time,
                    onPressed: () {
                      Vibration.select();
                      unFocusFields();
                      context.read(_dateProvider).state = DateTime.now();
                      context.read(_fromTextfieldProvider).state =
                          RouteTextfieldState.text(_fromController.text);
                      context.read(_toTextfieldProvider).state =
                          RouteTextfieldState.text(_toController.text);
                    },
                    icon: const Icon(Icons.restore),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Expanded(child: RoutesView())
        ],
      ),
    );
  }

  Widget buildFromField(BuildContext context) {
    final _api = context.read(navigationAPIProvider);
    final currentLocationString = Strings.of(context).current_location;

    return ProviderListener<StateController<RouteTextfieldState>>(
      onChange: (context, value) {
        if (value.state is UseCurrentLocation)
          _fromController.text = Strings.of(context).current_location;
      },
      provider: _fromTextfieldProvider,
      child: InputWrapperDecoration(
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TypeAheadField<CffCompletion>(
              key: const Key('route-first-textfield-key'),
              debounceDuration: const Duration(milliseconds: 500),
              textFieldConfiguration: TextFieldConfiguration(
                focusNode: fnFrom,
                controller: _fromController,
                onSubmitted: (_) => fnTo.requestFocus(),
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelText: Strings.of(context).departure,
                  isDense: true,
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  contentPadding: const EdgeInsets.only(left: 8),
                  suffixIcon: const SizedBox(),
                ),
              ),
              suggestionsCallback: (s) async => completeWithFavorites(
                  _store, await _api.complete(s), s,
                  currentLocationString: currentLocationString),
              itemBuilder: (context, suggestion) => SuggestedTile(suggestion),
              onSuggestionSelected: (suggestion) {
                _fromController.text = suggestion.label;
                if (suggestion.isCurrentLocation) {
                  context.read(_fromTextfieldProvider).state =
                      RouteTextfieldState.useCurrentLocation();
                } else {
                  context.read(_fromTextfieldProvider).state =
                      RouteTextfieldState.text(suggestion.label);
                }
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
                Vibration.select();
                _fromController.text = '';
                context.read(_fromTextfieldProvider).state = const RouteTextfieldState.empty();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildToField(BuildContext context) {
    final _api = context.read(navigationAPIProvider);
    final currentLocationString = Strings.of(context).current_location;

    return ProviderListener<StateController<RouteTextfieldState>>(
      onChange: (context, value) {
        if (value.state is UseCurrentLocation)
          _toController.text = Strings.of(context).current_location;
      },
      provider: _toTextfieldProvider,
      child: InputWrapperDecoration(
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TypeAheadField<CffCompletion>(
              key: const Key('route-second-textfield-key'),
              debounceDuration: const Duration(milliseconds: 500),
              textFieldConfiguration: TextFieldConfiguration(
                textInputAction: TextInputAction.search,
                focusNode: fnTo,
                onSubmitted: (_) => unFocusFields(),
                controller: _toController,
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelText: Strings.of(context).destination,
                  isDense: true,
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  contentPadding: const EdgeInsets.only(left: 8),
                  suffixIcon: const SizedBox(),
                ),
              ),
              suggestionsCallback: (s) async => completeWithFavorites(
                  _store, await _api.complete(s), s,
                  currentLocationString: currentLocationString),
              itemBuilder: (context, suggestion) => SuggestedTile(suggestion),
              onSuggestionSelected: (suggestion) {
                _toController.text = suggestion.label;
                if (suggestion.isCurrentLocation) {
                  context.read(_toTextfieldProvider).state =
                      RouteTextfieldState.useCurrentLocation();
                } else {
                  context.read(_toTextfieldProvider).state =
                      RouteTextfieldState.text(suggestion.label);
                }
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
                Vibration.select();
                _toController.text = '';
                context.read(_toTextfieldProvider).state = const RouteTextfieldState.empty();
              },
            ),
          ],
        ),
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

  void unFocusFields() {
    fnFrom.unfocus();
    fnTo.unfocus();
  }
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
          routes: (data) => data.routes.connections.isNotEmpty
              ? ListView.builder(
                  // separatorBuilder: (c, i) => const Divider(height: 0),
                  shrinkWrap: true,
                  itemCount: data.routes == null ? 0 : data.routes.connections.length,
                  itemBuilder: (context, i) => RouteTile(
                        key: Key('routetile-$i'),
                        route: data.routes,
                        i: i,
                      ))
              : Center(
                  child: Text(
                    data.routes.messages.join("\n"),
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
          network: (_) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Image.asset(
                        "assets/pictures/server_down.png",
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Network Error",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
          exception: (e) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Image.asset(
                        "assets/pictures/server_down.png",
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      e.exception.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
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
                    '🔎',
                    style: TextStyle(fontSize: 48),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    Strings.of(context).find_a_route,
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
          Strings.of(context).departure,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        TimeType.arrival: Text(
          Strings.of(context).arrival,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
      },
    );
  }
}
