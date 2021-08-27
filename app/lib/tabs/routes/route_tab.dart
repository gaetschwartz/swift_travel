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
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/route.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/stop.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/location/location.dart';
import 'package:swift_travel/logic/location/models/models.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/search/models.dart';
import 'package:swift_travel/pages/search/search.dart';
import 'package:swift_travel/states/route_states.dart';
import 'package:swift_travel/states/route_textfield_state.dart';
import 'package:swift_travel/tabs/routes/route_view.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/types.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/dialogs/datepicker.dart';
import 'package:theming/dialogs/input_dialog.dart';
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
    final api = ref.read(navigationAPIProvider);

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
      final it = await api.route(
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

final TextStateBinder fromBinder = TextStateBinder(TextEditingController(), fromTextfieldProvider);
final TextStateBinder toBinder = TextStateBinder(TextEditingController(), toTextfieldProvider);

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
    fromFormatter = MyTextFormatter(AppLocalizations.of(context).current_location, fromBinder,
        context.read(fromTextfieldProvider));
    toFormatter = MyTextFormatter(AppLocalizations.of(context).current_location, toBinder,
        context.read(fromTextfieldProvider));
    favorites = context.read(storeProvider);
    api = context.read(navigationAPIProvider);
    fromBinder.syncState(context);
    toBinder.syncState(context);
  }

  void _onFocusToChanged() {
    if (fnTo.hasFocus) {
      Vibration.instance.select();
    }
  }

  void _onFocusFromChanged() {
    if (fnFrom.hasFocus) {
      Vibration.instance.select();
    }
  }

  void useLocalRoute() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      unFocusFields();
      clearProviders();
      fromBinder.setString(context, widget.localRoute!.fromAsString);
      toBinder.setString(context, widget.localRoute!.toAsString);
    });
  }

  void goToDest() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      unFocusFields();
      clearProviders();
      fromBinder.useCurrentLocation(context);
      toBinder.setString(context, widget.favStop!.stop);
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
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => CupertinoPageScaffold(
        navigationBar: const SwiftCupertinoBar(),
        resizeToAvoidBottomInset: false,
        child: child!,
      ),
      materialBuilder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MaterialAppBar(
            title: Text(widget.localRoute?.displayName ?? AppLocalizations.of(context).tabs_route)),
        body: child,
      ),
      builder: (_, d) => SafeArea(
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
                        child: buildFromField(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4, left: 8, top: 4, bottom: 8),
                        child: buildToField(context),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: IconButton(
                    tooltip: 'Switch inputs',
                    icon: const Icon(CupertinoIcons.arrow_up_arrow_down),
                    onPressed: () {
                      Vibration.instance.select();
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
                        tooltip: AppLocalizations.of(context).fav_route,
                        onPressed: () async {
                          Vibration.instance.select();

                          log(favorites.routes.toString());
                          if (favorites.routes.any(
                            (lr) =>
                                lr.fromAsString == fromBinder.text &&
                                lr.toAsString == toBinder.text,
                          )) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('This route is already in your favorites !')));
                            return;
                          }

                          final s = await input(context, title: const Text('Enter route name'));
                          if (s == null) {
                            return;
                          }
                          await favorites.addRoute(LocalRoute.v2(
                              SbbStop(name: fromBinder.text), SbbStop(name: toBinder.text),
                              displayName: s));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Route starred !')));
                        },
                        icon: Consumer(builder: (context, w, _) {
                          final _store = w(storeProvider);
                          w(routeStatesProvider);

                          return _store.routes.any((lr) =>
                                  lr.fromAsString == fromBinder.text &&
                                  lr.toAsString == toBinder.text)
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
                                  final sbbRoute = SbbRoute.fromJson(mockRoute);

                                  fromBinder.setString(
                                    context,
                                    sbbRoute.connections.first.from,
                                    doLoad: false,
                                  );
                                  toBinder.setString(
                                    context,
                                    sbbRoute.connections.first.to,
                                    doLoad: false,
                                  );

                                  context.read(routeStatesProvider).state = RouteStates(sbbRoute);
                                }
                              : null,
                          style: TextButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Theme.of(context).textTheme.button!.color),
                          onPressed: () async {
                            Vibration.instance.select();
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
                      tooltip: AppLocalizations.of(context).use_current_time,
                      onPressed: () {
                        Vibration.instance.select();
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

  @allowReturningWidgets
  Widget buildFromField(BuildContext context) => _TextField(
        herotag: _fromHeroTag,
        textfieldKey: routeFromTextfieldKeyTap,
        binder: fromBinder,
        textFieldConfiguration: TextFieldConfiguration(
          focusNode: fnFrom,
          inputFormatters: [fromFormatter],
          placeholder: AppLocalizations.of(context).departure,
          textInputAction: TextInputAction.next,
          key: routeFromTextfieldKey,
        ),
        textInputAction: TextInputAction.next,
        text: AppLocalizations.of(context).departure,
        icon: Consumer(
            builder: (context, w, _) =>
                _IconForState(w(fromTextfieldProvider).state, iconSize: 16)),
      );

  @allowReturningWidgets
  Widget buildToField(BuildContext context) => _TextField(
        herotag: _toHeroTag,
        textfieldKey: routeToTextfieldKeyTap,
        binder: toBinder,
        textFieldConfiguration: TextFieldConfiguration(
          focusNode: fnTo,
          inputFormatters: [toFormatter],
          placeholder: AppLocalizations.of(context).destination,
          textInputAction: TextInputAction.search,
          key: routeToTextfieldKey,
        ),
        icon: Consumer(
          builder: (context, w, _) => _IconForState(w(toTextfieldProvider).state, iconSize: 16),
        ),
        text: AppLocalizations.of(context).destination,
        textInputAction: TextInputAction.search,
        isDestination: true,
      );

  void switchInputs() {
    final _from = fromBinder.state(context);

    fromBinder.init(context, toBinder.state(context));
    toBinder.init(context, _from);
  }

  void unFocusFields() {
    fnFrom.unfocus();
    fnTo.unfocus();
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    Key? key,
    required this.herotag,
    required this.textfieldKey,
    required this.binder,
    required this.textFieldConfiguration,
    required this.textInputAction,
    required this.text,
    required this.icon,
    this.isDestination = false,
  }) : super(key: key);

  final String herotag;
  final Key textfieldKey;
  final TextStateBinder binder;
  final TextFieldConfiguration textFieldConfiguration;
  final TextInputAction textInputAction;
  final String text;
  final Widget icon;
  final bool isDestination;

  void openSearch(BuildContext context) => Navigator.of(context, rootNavigator: true).push<void>(
        CupertinoPageRoute(
          builder: (context) => SearchPage(
            binder: binder,
            heroTag: herotag,
            configuration: textFieldConfiguration,
            // new params
            isDestination: isDestination,
            dateTime: isDestination ? context.read(dateProvider).state : null,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: herotag,
      child: isDarwin(context)
          ? CupertinoTextField(
              key: textfieldKey,
              focusNode: textFieldConfiguration.focusNode,
              controller: binder.controller,
              placeholder: text,
              textInputAction: textInputAction,
              prefix: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: icon,
              ),
              onTap: () => openSearch(context),
            )
          : Material(
              child: TextField(
                key: textfieldKey,
                focusNode: textFieldConfiguration.focusNode,
                controller: binder.controller,
                decoration: InputDecoration(
                  hintText: text,
                  prefixIcon: icon,
                ),
                textInputAction: textInputAction,
                onTap: () => openSearch(context),
              ),
            ),
    );
  }
}

class _IconForState extends StatelessWidget {
  const _IconForState(this.state, {Key? key, this.iconSize}) : super(key: key);

  final RouteTextfieldState state;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return state.maybeWhen(
      useCurrentLocation: () => Icon(CupertinoIcons.location_fill, size: iconSize),
      orElse: () => Icon(CupertinoIcons.textformat, size: iconSize),
    );
  }
}

class TextStateBinder {
  const TextStateBinder(
    this.controller,
    this.provider, [
    this.computeCurrentLocation = _computeCurrentLocation,
  ]);

  final TextEditingController controller;
  final StateProvider<RouteTextfieldState> provider;
  final String Function(BuildContext) computeCurrentLocation;

  void syncState(BuildContext context) => _setController(context.read(provider).state, context);

  void clear(BuildContext context) {
    context.read(provider).state = const RouteTextfieldState.empty();
    controller.clear();
  }

  void clearWithoutContext(StateController<RouteTextfieldState> sc) {
    sc.state = const RouteTextfieldState.empty();
    controller.clear();
  }

  void setString(BuildContext context, String s, {bool doLoad = true}) {
    context.read(provider).state = RouteTextfieldState.text(s, doLoad: doLoad);
    controller.text = s;
  }

  void init(BuildContext context, RouteTextfieldState state) {
    _setController(state, context);
    context.read(provider).state = state;
  }

  void _setController(RouteTextfieldState state, BuildContext context) {
    controller.text = state.when(
      empty: () => '',
      text: (t, l) => t,
      useCurrentLocation: () => computeCurrentLocation(context),
    );
  }

  void useCurrentLocation(BuildContext context) {
    context.read(provider).state = const RouteTextfieldState.useCurrentLocation();
    controller.text = computeCurrentLocation(context);
  }

  RouteTextfieldState state(BuildContext context) => context.read(provider).state;

  String get text => controller.text;

  static String _computeCurrentLocation(BuildContext context) =>
      AppLocalizations.of(context).current_location;
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
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<TimeType>(
      groupValue: _type,
      onValueChanged: onValueChanged,
      children: {
        TimeType.depart: Text(
          AppLocalizations.of(context).departure,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        TimeType.arrival: Text(
          AppLocalizations.of(context).arrival,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
      },
    );
  }

  void onValueChanged(TimeType? v) {
    if (v != null) {
      setState(() => _type = v);
      widget.onChange(v);
    }
  }
}
