import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart' hide Position;
import 'package:intl/intl.dart';
import 'package:pedantic/pedantic.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/logic/location/location.dart';
import 'package:swift_travel/logic/location/models/models.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/search/search.dart';
import 'package:swift_travel/states/route_states.dart';
import 'package:swift_travel/states/route_textfield_state.dart';
import 'package:swift_travel/tabs/routes/route_tile.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/models/coordinates.dart';
import 'package:swift_travel/utils/predict/models/models.dart';
import 'package:swift_travel/utils/predict/predict.dart';
import 'package:swift_travel/utils/strings/strings.dart';
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

    if (kDebugMode) {
      log('Something changed checking if we need to rebuild');
    }

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
      log('From: ${from.state}');
      log('To: ${to.state}');
    }

    GeoLocation? p;

    try {
      final departure = await from.state.when<FutureOr<String>?>(
        empty: () => null,
        text: (t, l) => t,
        useCurrentLocation: () async {
          p ??= await getLocation();
          return '${p!.latitude},${p!.longitude}';
        },
      )!;
      final arrival = await to.state.when<FutureOr<String>?>(
        empty: () => null,
        text: (t, l) => t,
        useCurrentLocation: () async {
          p ??= await getLocation();
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
    }
  }
}

class RouteTab extends StatefulWidget {
  const RouteTab({Key? key}) : super(key: key);

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
  MyTextFormatter(this.currentLocation, this.binder, this.state);

  final String currentLocation;
  final TextStateBinder binder;
  final StateController<RouteTextfieldState> state;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length != oldValue.text.length && oldValue.text == currentLocation) {
      binder.clearWithoutContext(state);
      return TextEditingValue.empty;
    } else {
      return newValue;
    }
  }
}

class RoutePage extends StatefulWidget {
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

  final LocalRoute? localRoute;
  final FavoriteStop? favStop;

  @override
  RoutePageState createState() => RoutePageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<LocalRoute?>('localRoute', localRoute))
      ..add(DiagnosticsProperty<FavoriteStop?>('favStop', favStop));
  }
}

final TextStateBinder from = TextStateBinder(TextEditingController(), fromTextfieldProvider);
final TextStateBinder to = TextStateBinder(TextEditingController(), toTextfieldProvider);

class RoutePageState extends State<RoutePage> {
  final FocusNode fnFrom = FocusNode();
  final FocusNode fnTo = FocusNode();

  late MyTextFormatter fromFormatter;
  late MyTextFormatter toFormatter;
  late BaseFavoritesStore favorites;
  late BaseNavigationApi api;
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
    favorites = context.read(storeProvider);
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
      from.setString(context, widget.localRoute!.fromAsString);
      to.setString(context, widget.localRoute!.toAsString);
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
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => CupertinoPageScaffold(
        navigationBar: const SwiftCupertinoBar(),
        resizeToAvoidBottomInset: false,
        child: child!,
      ),
      materialBuilder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: materialAppBar(context,
            title: Text(widget.localRoute?.displayName ?? AppLoc.of(context).tabs_route)),
        body: child,
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 4),
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
                            (lr) => lr.fromAsString == from.text && lr.toAsString == to.text,
                          )) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('This route is already in your favorites !')));
                            return;
                          }

                          final s = await input(context, title: const Text('Enter route name'));
                          if (s == null) {
                            return;
                          }
                          await favorites.addRoute(
                              LocalRoute.v2(SbbStop(from.text), SbbStop(to.text), displayName: s));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Route starred !')));
                        },
                        icon: Consumer(builder: (context, w, _) {
                          final _store = w(storeProvider);
                          w(routeStatesProvider);

                          return _store.routes.any(
                                  (lr) => lr.fromAsString == from.text && lr.toAsString == to.text)
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
                            if (date != null) {
                              _date.state = date;
                            }
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

  static const _fromHeroTag = '_fromHeroTag_';
  static const _toHeroTag = '_toHeroTag_';
  static const routeFromTextfieldKey = Key('route-from-textfield-key');
  static const routeFromTextfieldKeyTap = Key('route-from-textfield-key-tap');
  static const routeToTextfieldKey = Key('route-to-textfield-key');
  static const routeToTextfieldKeyTap = Key('route-to-textfield-key-tap');

  Widget buildFromField(BuildContext context, {required bool isDarwin}) {
    late final cupertinoTextFieldConfiguration = CupertinoTextFieldConfiguration(
      focusNode: fnFrom,
      inputFormatters: [fromFormatter],
      placeholder: AppLoc.of(context).departure,
      textInputAction: TextInputAction.next,
      key: routeFromTextfieldKey,
    );

    void openSearch() => Navigator.of(context, rootNavigator: true).push<void>(CupertinoPageRoute(
        builder: (context) => SearchPage(
              binder: from,
              heroTag: _fromHeroTag,
              configuration: cupertinoTextFieldConfiguration,
            )));

    if (isDarwin) {
      return Hero(
        tag: _fromHeroTag,
        child: CupertinoTextField(
          key: routeFromTextfieldKeyTap,
          controller: from.controller,
          focusNode: fnFrom,
          onEditingComplete: fnTo.requestFocus,
          placeholder: AppLoc.of(context).departure,
          textInputAction: TextInputAction.next,
          prefix: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Consumer(
                builder: (context, w, _) =>
                    iconForState(w(fromTextfieldProvider).state, iconSize: 16)),
          ),
          onTap: openSearch,
        ),
      );
    } else {
      return Hero(
        tag: _fromHeroTag,
        child: Material(
          child: TextField(
            key: routeFromTextfieldKeyTap,
            controller: from.controller,
            focusNode: fnFrom,
            onEditingComplete: fnTo.requestFocus,
            decoration: InputDecoration(
                hintText: AppLoc.of(context).departure,
                prefixIcon: Consumer(
                    builder: (context, w, _) =>
                        iconForState(w(fromTextfieldProvider).state, iconSize: 16))),
            textInputAction: TextInputAction.next,
            onTap: openSearch,
          ),
        ),
      );
    }
  }

  Widget buildToField(BuildContext context, {required bool isDarwin}) {
    late final cupertinoTextFieldConfiguration = CupertinoTextFieldConfiguration(
      focusNode: fnTo,
      inputFormatters: [toFormatter],
      placeholder: AppLoc.of(context).destination,
      textInputAction: TextInputAction.search,
      key: routeToTextfieldKey,
    );

    void openSearch() => Navigator.of(context, rootNavigator: true).push<void>(CupertinoPageRoute(
        builder: (context) => SearchPage(
              binder: to,
              isDestination: true,
              dateTime: context.read(dateProvider).state,
              heroTag: _toHeroTag,
              configuration: cupertinoTextFieldConfiguration,
            )));

    if (isDarwin) {
      return Hero(
        tag: _toHeroTag,
        child: CupertinoTextField(
          key: routeToTextfieldKeyTap,
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
          onTap: openSearch,
        ),
      );
    } else {
      return Hero(
        tag: _toHeroTag,
        child: Material(
          child: TextField(
            key: routeToTextfieldKeyTap,
            focusNode: fnTo,
            controller: to.controller,
            decoration: InputDecoration(
              hintText: AppLoc.of(context).destination,
              prefixIcon: Consumer(
                  builder: (context, w, _) =>
                      iconForState(w(toTextfieldProvider).state, iconSize: 16)),
            ),
            textInputAction: TextInputAction.search,
            onTap: openSearch,
          ),
        ),
      );
    }
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

final _locationProvider = FutureProvider((ref) => getLocation());

final _predictionProvider = FutureProvider<RoutePrediction>((ref) {
  final pos = ref.watch(_locationProvider).maybeWhen(
        data: (loc) => LatLon.fromGeoLocation(loc),
        orElse: () => null,
      );
  final dateTime = ref.watch(dateProvider).state;
  final routes = RouteHistoryRepository.i.history;
  return predictRoute(
    routes,
    PredictionArguments.from(dateTime, pos: pos),
  );
});

final _locationNotFound = RegExp(r'Stop ([\d\.,-\s]*) not found\.');

class RoutesView extends StatelessWidget {
  const RoutesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(builder: (context, w, _) {
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
                          padding: const EdgeInsets.all(8),
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
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    '😢',
                    style: TextStyle(fontSize: 96),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
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
                      padding: EdgeInsets.all(16),
                      child: Center(
                          child: Text(
                        '🗺',
                        style: TextStyle(fontSize: 80),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
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
                    ? const CupertinoButton.filled(
                        onPressed: Geolocator.openAppSettings,
                        child: Text('Open settings'),
                      )
                    : ElevatedButton(
                        onPressed: Geolocator.openAppSettings,
                        style: ElevatedButton.styleFrom(
                          shadowColor: ShadowTheme.of(context).buttonShadow?.color,
                          elevation: 8,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Open settings'),
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
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    '😢',
                    style: TextStyle(fontSize: 80),
                  )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
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
          empty: () => Align(
            alignment: Alignment.topCenter,
            child: Consumer(
              builder: (context, watch, child) {
                final data = watch(_predictionProvider);
                return data.when(
                  data: (pred) {
                    if (pred.prediction != null) {
                      return RouteWidget(
                        from: Text(pred.prediction!.fromAsString.stripAt()),
                        to: Text(pred.prediction!.toAsString.stripAt()),
                        onTap: () {
                          from.setString(context, pred.prediction!.fromAsString);
                          to.setString(context, pred.prediction!.toAsString);
                        },
                        title: Text(AppLoc.of(context).suggestion),
                      );
                    } else {
                      return child!;
                    }
                  },
                  loading: () => Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: const RouteWidget(
                      from: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.black),
                            child: Text('                           '),
                          ),
                        ),
                      ),
                      to: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.black),
                            child: Text('           '),
                          ),
                        ),
                      ),
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 16,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.black),
                            child: Text('               '),
                          ),
                        ),
                      ),
                    ),
                  ),
                  error: (e, s) {
                    print(e);
                    debugPrintStack(stackTrace: s);
                    return child!;
                  },
                );
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
            ),
          ),
          missingPluginException: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    '😢',
                    style: TextStyle(fontSize: 80),
                  )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
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

class TextStateBinder {
  const TextStateBinder(
    this.controller,
    this.provider, [
    this.computeCurrentLocation = _computeCurrentLocation,
  ]);

  final TextEditingController controller;
  final StateProvider<RouteTextfieldState>? provider;
  final String Function(BuildContext) computeCurrentLocation;

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
  const ShadowsAround({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          boxShadow: shadowListOf(context),
        ),
        child: child,
      );
}

class _Segmented extends StatefulWidget {
  const _Segmented({
    required this.onChange,
    required this.initialValue,
    Key? key,
  }) : super(key: key);

  final ValueChanged<TimeType> onChange;
  final TimeType initialValue;

  @override
  __SegmentedState createState() => __SegmentedState();
}

class __SegmentedState extends State<_Segmented> {
  late TimeType _type = widget.initialValue;

  @override
  Widget build(BuildContext context) => CupertinoSlidingSegmentedControl<TimeType>(
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
