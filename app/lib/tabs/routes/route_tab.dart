import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/route.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/stop.dart';
import 'package:swift_travel/apis/navigation/switzerland/switzerland.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/l10n/app_localizations_en.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/mocking/mocking.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/search/models.dart';
import 'package:swift_travel/pages/search/search.dart';
import 'package:swift_travel/states/route_states.dart';
import 'package:swift_travel/states/route_textfield_state.dart';
import 'package:swift_travel/tabs/routes/fetcher.dart';
import 'package:swift_travel/tabs/routes/location_text_box_manager.dart';
import 'package:swift_travel/tabs/routes/route_view.dart';
import 'package:swift_travel/theme.dart';
import 'package:swift_travel/utils/definitions.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:theming/dialogs/datepicker.dart';
import 'package:theming/dialogs/input_dialog.dart';
import 'package:theming/responsive.dart';
import 'package:vibration/vibration.dart';

final timeTypeProvider = StateProvider((_) => SearchChMode.departure);
final dateProvider = StateProvider((_) => DateTime.now());

final appLocalizationsProvider =
    Provider<AppLocalizations>((_) => AppLocalizationsEn());

final fromTextfieldProvider = ChangeNotifierProvider(
  (ref) {
    final textStateBinder = LocationTextBoxManager(
      initialState: const RouteTextfieldState.useCurrentLocation(),
      currentLocation: ref.read(appLocalizationsProvider).current_location,
    );
    ref.onDispose(textStateBinder.dispose);
    return textStateBinder;
  },
);

final toTextfieldProvider = ChangeNotifierProvider(
  (ref) {
    final textStateBinder = LocationTextBoxManager(
      currentLocation: ref.read(appLocalizationsProvider).current_location,
    );
    ref.onDispose(textStateBinder.dispose);
    return textStateBinder;
  },
);

class RouteTab extends StatefulWidget {
  const RouteTab({super.key});

  @override
  _RouteTabState createState() => _RouteTabState();
}

class _RouteTabState extends State<RouteTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const RoutePage();
  }

  @override
  bool get wantKeepAlive => true;
}

class RoutePage extends ConsumerStatefulWidget {
  const RoutePage({super.key})
      : favStop = null,
        localRoute = null;

  const RoutePage.route(this.localRoute, {super.key}) : favStop = null;

  const RoutePage.stop(this.favStop, {super.key}) : localRoute = null;

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

class RoutePageState extends ConsumerState<RoutePage> {
  final FocusNode fnFrom = FocusNode();
  final FocusNode fnTo = FocusNode();

  late LocationTextBoxFormatter fromFormatter;
  late LocationTextBoxFormatter toFormatter;
  late BaseFavoritesStore favorites;
  late BaseNavigationApi api;
  final historyRepository = RouteHistoryRepository.instance;

  final log = Logger('RoutePageState');

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
    ref.read(routeStatesProvider.notifier).state = const RouteStates.empty();
    ref.read(dateProvider.notifier).state = DateTime.now();
    ref.read(timeTypeProvider.notifier).state = SearchChMode.departure;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fromFormatter = ref.read(fromTextfieldProvider).inputFormatter;
    toFormatter = ref.read(toTextfieldProvider).inputFormatter;
    favorites = ref.read(favoritesStoreProvider);
    api = ref.read(navigationAPIProvider);
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unFocusFields();
      clearProviders();
      ref
          .read(fromTextfieldProvider)
          .setString(widget.localRoute!.fromAsString);
      ref.read(toTextfieldProvider).setString(widget.localRoute!.toAsString);
    });
  }

  void goToDest() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unFocusFields();
      clearProviders();
      ref.read(fromTextfieldProvider).useCurrentLocation();
      ref.read(toTextfieldProvider).setString(widget.favStop!.stop);
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
            title: Text(widget.localRoute?.displayName ??
                AppLocalizations.of(context).tabs_route)),
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
                        padding: const EdgeInsets.only(
                            right: 4, left: 8, top: 8, bottom: 4),
                        child: buildFromField(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 4, left: 8, top: 4, bottom: 8),
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

                          log.log(favorites.routes.toString());
                          if (favorites.routes.any(
                            (lr) =>
                                lr.data.fromAsString ==
                                    ref.read(fromTextfieldProvider).text &&
                                lr.data.toAsString ==
                                    ref.read(toTextfieldProvider).text,
                          )) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'This route is already in your favorites !')));
                            return;
                          }

                          final s = await input(context,
                              title: const Text('Enter route name'));
                          if (s == null) {
                            return;
                          }
                          await favorites.addRoute(LocalRoute.v2(
                              SbbStop(
                                  name: ref.read(fromTextfieldProvider).text),
                              SbbStop(name: ref.read(toTextfieldProvider).text),
                              displayName: s));

                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Route starred !')));
                        },
                        icon: Consumer(builder: (context, ref, _) {
                          ref.watch(routeStatesProvider);

                          return ref.watch(favoritesStoreProvider).routes.any(
                                  (lr) =>
                                      lr.data.fromAsString ==
                                          ref
                                              .read(fromTextfieldProvider)
                                              .text &&
                                      lr.data.toAsString ==
                                          ref.read(toTextfieldProvider).text)
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
                          style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.onSurface,
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                          ),
                          onLongPress: kDebugMode
                              ? () {
                                  unFocusFields();
                                  final sbbRoute = SbbRoute.fromJson(mockRoute);

                                  ref.read(fromTextfieldProvider).setString(
                                        sbbRoute.connections.first.from,
                                        doLoad: false,
                                      );
                                  ref.read(toTextfieldProvider).setString(
                                        sbbRoute.connections.first.to,
                                        doLoad: false,
                                      );
                                  ref.read(routeStatesProvider.notifier).state =
                                      RouteStates(sbbRoute);
                                }
                              : null,
                          onPressed: () async {
                            Vibration.instance.select();
                            var type = ref.read(timeTypeProvider);
                            final currentDate = ref.read(dateProvider.notifier);
                            final date = await pickDate(
                              context,
                              initialDateTime: currentDate.state.subtract(
                                  Duration(
                                      minutes: currentDate.state.minute % 5)),
                              minuteInterval: 5,
                              bottom: _Segmented(
                                onChange: (v) => type = v,
                                initialValue: type,
                              ),
                              textColor: CupertinoColors.activeBlue,
                            );
                            if (date != null) currentDate.state = date;

                            if (!mounted) return;
                            ref.read(timeTypeProvider.notifier).state = type;
                          },
                          child: Consumer(builder: (context, w, _) {
                            final date = w.watch(dateProvider);
                            final time = w.watch(timeTypeProvider);
                            final dateFormatted =
                                DateFormat('d MMM y').format(date);
                            final timeFormatted =
                                DateFormat('H:mm').format(date);
                            final type = describeEnum(time);
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    '${type[0].toUpperCase()}${type.substring(1, 3)}.'),
                                const VerticalDivider(
                                    indent: 12, endIndent: 12, thickness: 1.5),
                                Text(dateFormatted),
                                const VerticalDivider(
                                    indent: 12, endIndent: 12, thickness: 1.5),
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
                        ref.read(dateProvider.notifier).state = DateTime.now();
                      },
                      icon: const Icon(Icons.restore),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(8),
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
        binder: ref.read(fromTextfieldProvider),
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
          builder: (context, ref, _) => _IconForState(
            ref.watch(fromTextfieldProvider).state,
            iconSize: 16,
          ),
        ),
      );

  @allowReturningWidgets
  Widget buildToField(BuildContext context) => _TextField(
        herotag: _toHeroTag,
        textfieldKey: routeToTextfieldKeyTap,
        binder: ref.read(toTextfieldProvider),
        textFieldConfiguration: TextFieldConfiguration(
          focusNode: fnTo,
          inputFormatters: [toFormatter],
          placeholder: AppLocalizations.of(context).destination,
          textInputAction: TextInputAction.search,
          key: routeToTextfieldKey,
        ),
        icon: Consumer(
          builder: (context, ref, _) => _IconForState(
            ref.watch(toTextfieldProvider).state,
            iconSize: 16,
          ),
        ),
        text: AppLocalizations.of(context).destination,
        textInputAction: TextInputAction.search,
        isDestination: true,
      );

  void switchInputs() {
    final from = ref.read(fromTextfieldProvider).state;
    final to = ref.read(toTextfieldProvider).state;

    ref.read(fromTextfieldProvider).state = to;
    ref.read(toTextfieldProvider).state = from;
  }

  void unFocusFields() {
    fnFrom.unfocus();
    fnTo.unfocus();
  }
}

class _TextField extends ConsumerStatefulWidget {
  const _TextField({
    required this.herotag,
    required this.textfieldKey,
    required this.binder,
    required this.textFieldConfiguration,
    required this.textInputAction,
    required this.text,
    required this.icon,
    this.isDestination = false,
  });

  final String herotag;
  final Key textfieldKey;
  final LocationTextBoxManager binder;
  final TextFieldConfiguration textFieldConfiguration;
  final TextInputAction textInputAction;
  final String text;
  final Widget icon;
  final bool isDestination;

  @override
  ConsumerState<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends ConsumerState<_TextField> {
  void openSearch(BuildContext context) {
    unawaited(Navigator.of(context, rootNavigator: true).push<void>(
      CupertinoPageRoute(
        builder: (context) => SearchPage(
          binder: widget.binder,
          heroTag: widget.herotag,
          configuration: widget.textFieldConfiguration,
          // new params
          isDestination: widget.isDestination,
          dateTime: widget.isDestination ? ref.read(dateProvider) : null,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.herotag,
      child: isThemeDarwin(context)
          ? CupertinoTextField(
              key: widget.textfieldKey,
              focusNode: widget.textFieldConfiguration.focusNode,
              controller: widget.binder.controller,
              placeholder: widget.text,
              textInputAction: widget.textInputAction,
              prefix: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: widget.icon,
              ),
              onTap: () => openSearch(context),
            )
          : Material(
              child: TextField(
                key: widget.textfieldKey,
                focusNode: widget.textFieldConfiguration.focusNode,
                controller: widget.binder.controller,
                decoration: InputDecoration(
                  hintText: widget.text,
                  prefixIcon: widget.icon,
                ),
                textInputAction: widget.textInputAction,
                onTap: () => openSearch(context),
              ),
            ),
    );
  }
}

class _IconForState extends StatelessWidget {
  const _IconForState(this.state, {this.iconSize});

  final RouteTextfieldState state;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return state.maybeWhen(
      useCurrentLocation: () =>
          Icon(CupertinoIcons.location_fill, size: iconSize),
      orElse: () => Icon(CupertinoIcons.textformat, size: iconSize),
    );
  }
}

class ShadowsAround extends StatelessWidget {
  const ShadowsAround({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(boxShadow: shadowListOf(context)),
        child: child,
      );
}

class _Segmented extends StatefulWidget {
  const _Segmented({
    required this.onChange,
    required this.initialValue,
  });

  final ValueChanged<SearchChMode> onChange;
  final SearchChMode initialValue;

  @override
  __SegmentedState createState() => __SegmentedState();
}

class __SegmentedState extends State<_Segmented> {
  late SearchChMode _type = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<SearchChMode>(
      groupValue: _type,
      onValueChanged: onValueChanged,
      children: {
        SearchChMode.departure: Text(
          AppLocalizations.of(context).departure,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
        SearchChMode.arrival: Text(
          AppLocalizations.of(context).arrival,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
      },
    );
  }

  void onValueChanged(SearchChMode? v) {
    if (v != null) {
      setState(() => _type = v);
      widget.onChange(v);
    }
  }
}
