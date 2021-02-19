import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart' hide Position;
import 'package:intl/intl.dart';
import 'package:pedantic/pedantic.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/blocs/location/location.dart';
import 'package:swift_travel/blocs/location/models/models.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/search.dart';
import 'package:swift_travel/states/route_states.dart';
import 'package:swift_travel/states/route_textfield_state.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';
import 'package:swift_travel/tabs/routes/suggested.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/complete.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/predict/predict.dart';
import 'package:swift_travel/utils/string_utils/string_utils.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/route_widget.dart';
import 'package:theming/dialogs/datepicker.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/dynamic_theme.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

final timeTypeProvider = StateProvider((_) => TimeType.depart);
final dateProvider = StateProvider((_) => DateTime.now());

final fromTextfieldProvider = StateProvider((_) => const RouteTextfieldState.useCurrentLocation());
final toTextfieldProvider = StateProvider((_) => const RouteTextfieldState.empty());

final fetcherProvider = Provider<FetcherBase>((_) => Fetcher());
final routeStatesProvider = ChangeNotifierProvider((ref) => ref.watch(fetcherProvider)..fetch(ref));

abstract class FetcherBase extends ChangeNotifier {
  Future<void> fetch(ProviderReference ref);

  RouteStates _state = const RouteStates.empty();

  RouteStates get state => _state;

  set state(RouteStates state) {
    _state = state;
    notifyListeners();
  }
}

class Fetcher extends FetcherBase {
  @override
  Future<void> fetch(ProviderReference ref) async {
    final from = ref.watch(fromTextfieldProvider);
    final to = ref.watch(toTextfieldProvider);
    final date = ref.watch(dateProvider).state;
    final timeType = ref.watch(timeTypeProvider).state;
    final _cff = ref.read(navigationAPIProvider);

    print('Something changed checking if we need to rebuild');

    if (from.state is EmptyRouteState || to.state is EmptyRouteState) {
      if (from.state is EmptyRouteState && to.state is EmptyRouteState) {
        state = const RouteStates.empty();
      }
      return;
    } else if (from.state.maybeWhen(text: (t, l) => t.isEmpty || !l, orElse: () => false) ||
        to.state.maybeWhen(text: (t, l) => t.isEmpty || !l, orElse: () => false)) {
      return;
    } else {
      state = const RouteStates.loading();
    }

    if (kDebugMode) {
      print('From: ${from.state}');
      print('To: ${to.state}');
    }

    Location? p;

    try {
      final departure = await from.state.when<FutureOr<String>?>(
        empty: () => null,
        text: (t, l) => t,
        useCurrentLocation: () async {
          p ??= await LocationRepository.getLocation();
          return '${p!.latitude},${p!.longitude}';
        },
      )!;
      final arrival = await to.state.when<FutureOr<String>?>(
        empty: () => null,
        text: (t, l) => t,
        useCurrentLocation: () async {
          p ??= await LocationRepository.getLocation();
          return '${p!.latitude},${p!.longitude}';
        },
      )!;
      log('Fetching route from $departure to $arrival');
      final it = await _cff.route(
        departure,
        arrival,
        date: date,
        time: TimeOfDay.fromDateTime(date),
        typeTime: timeType,
      );
      state = RouteStates(it);
    } on SocketException catch (e, s) {
      log('', error: e, stackTrace: s);
      state = const RouteStates.networkException();
    } on MissingPluginException {
      state = const RouteStates.missingPluginException();
    } on PermissionDeniedException {
      state = const RouteStates.locationPermissionNotGranted();
    } on LocationServiceDisabledException {
      state = const RouteStates.locationPermissionNotGranted();
    } on Exception catch (e, s) {
      state = RouteStates.exception(e);
      reportDartError(e, s, library: 'fetcher', reason: 'while fetching');
    } on Error catch (e) {
      state = RouteStates.exception(e);
      reportDartError(e, e.stackTrace, library: 'fetcher', reason: 'while fetching');
    }
  }
}

class RouteTab extends StatefulWidget {
  const RouteTab();

  @override
  _RouteTabState createState() => _RouteTabState();
}

class _RouteTabState extends State<RouteTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const RoutePage();
  }

  @override
  bool get wantKeepAlive => true;
}

class MyTextFormatter extends TextInputFormatter {
  final String currentLocation;
  final TextStateBinder binder;
  final StateController<RouteTextfieldState> state;

  MyTextFormatter(this.currentLocation, this.binder, this.state);

  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    if (newValue.text.length != oldValue.text.length && oldValue.text == currentLocation) {
      binder.clearWithoutContext(state);
      return TextEditingValue.empty;
    } else {
      return newValue;
    }
  }
}

class RoutePage extends StatefulWidget {
  final LocalRoute? localRoute;
  final FavoriteStop? favStop;

  const RoutePage({Key? key})
      : favStop = null,
        localRoute = null,
        super(key: key);

  const RoutePage.route(this.localRoute, {Key? key})
      : favStop = null,
        super(key: key);

  const RoutePage.stop(this.favStop, {Key? key})
      : localRoute = null,
        super(key: key);

  @override
  _RoutePageState createState() => _RoutePageState();
}

final TextStateBinder from = TextStateBinder(TextEditingController(), fromTextfieldProvider);
final TextStateBinder to = TextStateBinder(TextEditingController(), toTextfieldProvider);

class _RoutePageState extends State<RoutePage> {
  final FocusNode fnFrom = FocusNode();
  final FocusNode fnTo = FocusNode();

  MyTextFormatter? fromFormatter;
  MyTextFormatter? toFormatter;
  late FavoritesSharedPreferencesStore favorites;
  late NavigationApi api;
  final historyRepository = RouteHistoryRepository.i;

  @override
  void initState() {
    super.initState();
    if (widget.localRoute != null) {
      useLocalRoute();
    } else if (widget.favStop != null) {
      goToDest();
    }

    fnFrom.addListener(_onFocusFromChanged);
    fnTo.addListener(_onFocusToChanged);
  }

  void clearProviders() {
    context.read(routeStatesProvider).state = const RouteStates.empty();
    context.read(dateProvider).state = DateTime.now();
    context.read(timeTypeProvider).state = TimeType.depart;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fromFormatter = MyTextFormatter(
        AppLoc.of(context).current_location, from, context.read(fromTextfieldProvider));
    toFormatter = MyTextFormatter(
        AppLoc.of(context).current_location, to, context.read(fromTextfieldProvider));
    favorites = context.read(storeProvider) as FavoritesSharedPreferencesStore;
    api = context.read(navigationAPIProvider);
    from.syncState(context);
    to.syncState(context);
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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      unFocusFields();
      clearProviders();
      from.setString(context, widget.localRoute!.from);
      to.setString(context, widget.localRoute!.to);
    });
  }

  void goToDest() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      unFocusFields();
      clearProviders();
      from.useCurrentLocation(context);
      to.setString(context, widget.favStop!.stop);
    });
  }

  @override
  void dispose() {
    fnFrom.dispose();
    fnTo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarwin = Responsive.isDarwin(context);
    return IfWrapper(
      condition: isDarwin,
      builder: (context, child) => CupertinoPageScaffold(
        navigationBar: cupertinoBar(context),
        resizeToAvoidBottomInset: false,
        child: child!,
      ),
      elseBuilder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: materialAppBar(context,
              title: Text(widget.localRoute?.displayName ?? AppLoc.of(context).tabs_route)),
          body: child,
        );
      },
      child: SafeArea(
        bottom: false,
        child: Column(
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
                              child: buildFromField(context, isDarwin: isDarwin),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4, left: 8, top: 4, bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: buildToField(context, isDarwin: isDarwin),
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
                        tooltip: AppLoc.of(context).fav_route,
                        onPressed: () async {
                          unawaited(Vibration.select());

                          log(favorites.routes.toString());
                          if (favorites.routes.any(
                            (lr) => lr.from == from.text && lr.to == to.text,
                          )) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('This route is already in your favorites !')));
                            return;
                          }

                          final s = await input(context, title: const Text('Enter route name'));
                          if (s == null) return;
                          await favorites.addRoute(LocalRoute(from.text, to.text, displayName: s));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Route starred !')));
                        },
                        icon: Consumer(builder: (context, w, _) {
                          final _store = w(storeProvider) as FavoritesSharedPreferencesStore;
                          w(routeStatesProvider);

                          return _store.routes.any((lr) => lr.from == from.text && lr.to == to.text)
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

                                  final cffRoute = CffRoute.fromJson(mockRoute!);

                                  from.setString(
                                    context,
                                    cffRoute.connections.first.from,
                                    doLoad: false,
                                  );
                                  to.setString(
                                    context,
                                    cffRoute.connections.first.to,
                                    doLoad: false,
                                  );

                                  context.read(routeStatesProvider).state = RouteStates(cffRoute);
                                }
                              : null,
                          style: TextButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Theme.of(context).textTheme.button!.color),
                          onPressed: () async {
                            unawaited(Vibration.select());
                            var type = context.read(timeTypeProvider).state;
                            final _date = context.read(dateProvider);
                            final date = await pickDate(
                              context,
                              initialDateTime:
                                  _date.state.subtract(Duration(minutes: _date.state.minute % 5)),
                              minuteInterval: 5,
                              bottom: _Segmented(
                                onChange: (v) => type = v,
                                initialValue: type,
                              ),
                              textColor: CupertinoColors.activeBlue,
                            );
                            if (date != null) _date.state = date;
                            context.read(timeTypeProvider).state = type;
                          },
                          child: Consumer(builder: (context, w, _) {
                            final _date = w(dateProvider);
                            final _time = w(timeTypeProvider);
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
                      tooltip: AppLoc.of(context).use_current_time,
                      onPressed: () {
                        Vibration.select();
                        unFocusFields();
                        context.read(dateProvider).state = DateTime.now();
                      },
                      icon: const Icon(Icons.restore),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 0),
            const Expanded(child: RoutesView())
          ],
        ),
      ),
    );
  }

  static const _fromHeroTag = 'fromHeroTag';
  static const _toHeroTag = 'toHeroTag';

  static const _suggestionsBoxDecoration =
      SuggestionsBoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)));
  Widget buildFromField(BuildContext context, {required bool isDarwin}) {
    final currentLocationString = AppLoc.of(context).current_location;

    return isDarwin
        ? Hero(
            tag: _fromHeroTag,
            child: CupertinoTextField(
              controller: from.controller,
              focusNode: fnFrom,
              onEditingComplete: () => fnTo.requestFocus(),
              placeholder: AppLoc.of(context).departure,
              textInputAction: TextInputAction.next,
              prefix: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Consumer(
                    builder: (context, w, _) =>
                        iconForState(w(fromTextfieldProvider).state, iconSize: 16)),
              ),
              onTap: () async {
                await Navigator.of(context, rootNavigator: true).push<void>(CupertinoPageRoute(
                    builder: (context) => SearchPage(
                          binder: from,
                          heroTag: _fromHeroTag,
                          configuration: CupertinoTextFieldConfiguration(
                            focusNode: fnFrom,
                            inputFormatters: [fromFormatter],
                            placeholder: AppLoc.of(context).departure,
                            textInputAction: TextInputAction.next,
                          ),
                        )));
              },
            ),
          )
        : ShadowsAround(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TypeAheadField<Completion>(
                  key: const Key('route-first-textfield-key'),
                  debounceDuration: const Duration(milliseconds: 250),
                  textFieldConfiguration: TextFieldConfiguration(
                    inputFormatters: [fromFormatter!],
                    focusNode: fnFrom,
                    controller: from.controller,
                    onEditingComplete: () => fnTo.requestFocus(),
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      prefixIcon: Consumer(
                          builder: (context, w, _) => iconForState(w(fromTextfieldProvider).state)),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      labelText: AppLoc.of(context).departure,
                      isDense: true,
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      contentPadding: const EdgeInsets.only(left: 8),
                      suffixIcon: const SizedBox(),
                    ),
                  ),
                  loadingBuilder: (context) => ListView.builder(
                      itemBuilder: (context, i) => Shimmer.fromColors(
                            child: const SuggestedTile.empty(),
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.white,
                          )),
                  suggestionsCallback: (query) async => completeWithFavorites(
                    favorites: favorites.stops,
                    completions: await api.complete(query),
                    query: query,
                    currentLocationString: currentLocationString,
                    history: historyRepository.history,
                  ),
                  itemBuilder: (context, suggestion) => SuggestedTile(suggestion),
                  onSuggestionSelected: (suggestion) {
                    if (suggestion.origin == DataOrigin.currentLocation) {
                      from.useCurrentLocation(context);
                    } else {
                      from.setString(context, suggestion.label);
                    }
                  },
                  suggestionsBoxDecoration: _suggestionsBoxDecoration,
                  hideOnEmpty: true,
                  transitionBuilder: (context, suggestionsBox, controller) => FadeTransition(
                    opacity: controller!,
                    child: suggestionsBox,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    Vibration.select();
                    from.clear(context);
                  },
                ),
              ],
            ),
          );
  }

  Widget buildToField(BuildContext context, {required bool isDarwin}) {
    final currentLocationString = AppLoc.of(context).current_location;

    return isDarwin
        ? Hero(
            tag: _toHeroTag,
            child: CupertinoTextField(
              focusNode: fnTo,
              controller: to.controller,
              placeholder: AppLoc.of(context).destination,
              textInputAction: TextInputAction.search,
              prefix: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Consumer(
                    builder: (context, w, _) =>
                        iconForState(w(toTextfieldProvider).state, iconSize: 16)),
              ),
              onTap: () async {
                await Navigator.of(context, rootNavigator: true).push<void>(CupertinoPageRoute(
                    builder: (context) => Consumer(
                        builder: (context, w, _) => SearchPage(
                              binder: to,
                              isDestination: true,
                              dateTime: w(dateProvider).state,
                              heroTag: _toHeroTag,
                              configuration: CupertinoTextFieldConfiguration(
                                focusNode: fnTo,
                                inputFormatters: [toFormatter],
                                placeholder: AppLoc.of(context).destination,
                                textInputAction: TextInputAction.search,
                              ),
                            ))));
              },
            ),
          )
        : ShadowsAround(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TypeAheadField<Completion>(
                  key: const Key('route-second-textfield-key'),
                  suggestionsBoxDecoration: _suggestionsBoxDecoration,
                  debounceDuration: const Duration(milliseconds: 250),
                  textFieldConfiguration: TextFieldConfiguration(
                    inputFormatters: [toFormatter!],
                    textInputAction: TextInputAction.search,
                    focusNode: fnTo,
                    onEditingComplete: () => unFocusFields(),
                    controller: to.controller,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      prefixIcon: Consumer(
                          builder: (context, w, _) => iconForState(w(toTextfieldProvider).state)),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      labelText: AppLoc.of(context).destination,
                      isDense: true,
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      contentPadding: const EdgeInsets.only(left: 8),
                      suffixIcon: const SizedBox(),
                    ),
                  ),
                  suggestionsCallback: (query) async => completeWithFavorites(
                    favorites: favorites.stops,
                    completions: await api.complete(query),
                    query: query,
                    currentLocationString: currentLocationString,
                    history: historyRepository.history,
                  ),
                  itemBuilder: (context, suggestion) => SuggestedTile(suggestion),
                  onSuggestionSelected: (suggestion) {
                    if (suggestion.origin == DataOrigin.currentLocation) {
                      to.useCurrentLocation(context);
                    } else {
                      to.setString(context, suggestion.label);
                    }
                  },
                  loadingBuilder: (context) => ListView.builder(
                      itemBuilder: (context, i) => Shimmer.fromColors(
                            child: const SuggestedTile.empty(),
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.white,
                          )),
                  hideOnEmpty: true,
                  transitionBuilder: (context, suggestionsBox, controller) => FadeTransition(
                    opacity: controller!,
                    child: suggestionsBox,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    Vibration.select();
                    to.clear(context);
                  },
                ),
              ],
            ),
          );
  }

  Widget iconForState(RouteTextfieldState state, {double iconSize = 24}) => state.maybeWhen(
        useCurrentLocation: () => Icon(CupertinoIcons.location_fill, size: iconSize),
        orElse: () => Icon(CupertinoIcons.textformat, size: iconSize),
      );

  void switchInputs() {
    final _from = from.state(context);

    from.init(context, to.state(context));
    to.init(context, _from);
  }

  void unFocusFields() {
    fnFrom.unfocus();
    fnTo.unfocus();
  }
}

final _predictionProvider = Provider.family<Prediction<LocalRoute?>, DateTime>(
    (_, date) => predictRoute(RouteHistoryRepository.i.history, PredictionArguments(date)));

final _locationNotFound = RegExp('Stop ([\d\.,-\s]*) not found\.');

class RoutesView extends StatelessWidget {
  const RoutesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, w, _) {
      final fetcher = w(routeStatesProvider);

      return fetcher.state.when(
        (routes) => CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            SliverSafeArea(
              sliver: routes.connections.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) => RouteTile(
                          key: Key('routetile-$i'),
                          route: routes,
                          i: i,
                        ),
                        childCount: routes.connections.length,
                      ),
                    )
                  : SliverFillRemaining(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: routes.messages.isEmpty ||
                                  _locationNotFound.hasMatch(routes.messages.first)
                              ? Text(
                                  "You don't seem to be in a supported area.",
                                  style: Theme.of(context).textTheme.headline6,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  routes.messages.join('\n'),
                                  style: Theme.of(context).textTheme.headline6,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
        networkException: () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                    child: Text(
                  '😢',
                  style: TextStyle(fontSize: 96),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Network Error',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
        locationPermissionNotGranted: () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                        child: Text(
                      '🗺',
                      style: TextStyle(fontSize: 80),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'This app requires location permissions !',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Center(
              child: Responsive.isDarwin(context)
                  ? CupertinoButton.filled(
                      onPressed: () => Geolocator.openAppSettings(),
                      child: const Text('Open settings'))
                  : ElevatedButton(
                      onPressed: () => Geolocator.openAppSettings(),
                      child: const Text('Open settings'),
                      style: ElevatedButton.styleFrom(
                        shadowColor: DynamicTheme.shadowOf(context).buttonShadow?.color,
                        elevation: 8,
                        shape: const StadiumBorder(),
                      ),
                    ),
            )),
          ],
        ),
        exception: (e) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                    child: Text(
                  '😢',
                  style: TextStyle(fontSize: 80),
                )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  e.toString(),
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        empty: () {
          return Consumer(
            builder: (context, watch, child) {
              final date = watch(dateProvider).state;
              final pred = watch(_predictionProvider(date));
              if (pred.prediction != null && pred.confidence > .2) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: RouteWidget(
                    from: Text('${pred.prediction!.from.stripAt()}'),
                    to: Text('${pred.prediction!.to.stripAt()}'),
                    onTap: () {
                      from.setString(context, pred.prediction!.from);
                      to.setString(context, pred.prediction!.to);
                    },
                    icon: const Text('💡', style: TextStyle(fontSize: 24)),
                    title: const Text('Suggestion'),
                  ),
                );
              } else {
                return child!;
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '🔎',
                  style: TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 24),
                Text(
                  AppLoc.of(context).find_a_route,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
        missingPluginException: () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                    child: Text(
                  '😢',
                  style: TextStyle(fontSize: 80),
                )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Location is not supported on this device',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class TextStateBinder {
  final TextEditingController controller;
  final StateProvider<RouteTextfieldState>? provider;
  final String Function(BuildContext) computeCurrentLocation;

  const TextStateBinder(
    this.controller,
    this.provider, [
    this.computeCurrentLocation = _computeCurrentLocation,
  ]);

  void syncState(BuildContext context) => _setController(context.read(provider!).state, context);

  void clear(BuildContext context) {
    context.read(provider!).state = const RouteTextfieldState.empty();
    controller.clear();
  }

  void clearWithoutContext(StateController<RouteTextfieldState> sc) {
    sc.state = const RouteTextfieldState.empty();
    controller.clear();
  }

  void setString(BuildContext context, String s, {bool doLoad = true}) {
    context.read(provider!).state = RouteTextfieldState.text(s, doLoad: doLoad);
    controller.text = s;
  }

  void init(BuildContext context, RouteTextfieldState state) {
    _setController(state, context);
    context.read(provider!).state = state;
  }

  void _setController(RouteTextfieldState state, BuildContext context) {
    controller.text = state.when(
      empty: () => '',
      text: (t, l) => t,
      useCurrentLocation: () => computeCurrentLocation(context),
    );
  }

  void useCurrentLocation(BuildContext context) {
    context.read(provider!).state = const RouteTextfieldState.useCurrentLocation();
    controller.text = computeCurrentLocation(context);
  }

  RouteTextfieldState state(BuildContext context) => context.read(provider!).state;

  String get text => controller.text;

  static String _computeCurrentLocation(BuildContext context) =>
      AppLoc.of(context).current_location;
}

class ShadowsAround extends StatelessWidget {
  final Widget? child;

  const ShadowsAround({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: shadowListOf(context),
      ),
      child: child,
    );
  }
}

class _Segmented extends StatefulWidget {
  const _Segmented({
    Key? key,
    required this.onChange,
    required this.initialValue,
  }) : super(key: key);

  final ValueChanged<TimeType> onChange;
  final TimeType initialValue;

  @override
  __SegmentedState createState() => __SegmentedState();
}

class __SegmentedState extends State<_Segmented> {
  late TimeType _type = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<TimeType>(
      groupValue: _type,
      onValueChanged: (v) {
        if (v != null) {
          setState(() => _type = v);
          widget.onChange(v);
        }
      },
      children: {
        TimeType.depart: Text(
          AppLoc.of(context).departure,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        TimeType.arrival: Text(
          AppLoc.of(context).arrival,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
      },
    );
  }
}
