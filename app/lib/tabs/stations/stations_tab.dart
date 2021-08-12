import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/completion.dart';
import 'package:swift_travel/constants/env.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/logic/location/location.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/prediction/complete.dart';
import 'package:swift_travel/states/station_states.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/tabs/stations/completion_tile.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/animated_widget.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/listener.dart';
import 'package:vibration/vibration.dart';

final _stateProvider = StateProvider<StationStates>((_) => const StationStates.empty());
final _locatingProvider = StateProvider((_) => false);
final _loadingProvider = StateProvider((_) => false);

class StationsTab extends StatefulWidget {
  const StationsTab({Key? key}) : super(key: key);

  @override
  _StationsTabState createState() => _StationsTabState();
}

class _StationsTabState extends State<StationsTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _StationsTabWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class _StationsTabWidget extends StatefulWidget {
  const _StationsTabWidget();

  @override
  _StationsTabWidgetState createState() => _StationsTabWidgetState();
}

class _StationsTabWidgetState extends State<_StationsTabWidget> with AutomaticKeepAliveClientMixin {
  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  Timer? _debouncer;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChanged);
  }

  void onFocusChanged() {
    if (focusNode.hasFocus) {
      Vibration.instance.select();
    }
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
    return PlatformBuilder(
      cupertinoBuilder: (context, child) => CupertinoPageScaffold(
        navigationBar: SwiftCupertinoBar(
          middle: Text(AppLoc.of(context).timetable),
        ),
        resizeToAvoidBottomInset: false,
        child: child!,
      ),
      materialBuilder: (context, child) => Scaffold(
        appBar: materialAppBar(context, title: Text(AppLoc.of(context).tabs_search)),
        resizeToAvoidBottomInset: false,
        body: child,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: ShadowsAround(
                      child: Stack(
                        children: [
                          TextField(
                            key: const Key('stations-textfield'),
                            focusNode: focusNode,
                            controller: searchController,
                            style: DefaultTextStyle.of(context)
                                .style
                                .copyWith(fontStyle: FontStyle.normal),
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: AppLoc.of(context).search_station,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                              filled: true,
                              fillColor: Theme.of(context).cardColor,
                            ),
                            onChanged: (s) => debounce(context, s),
                          ),
                          ListenableBuilder<TextEditingController>(
                            listenable: searchController,
                            builder: (context, controller, child) =>
                                controller.text.isEmpty ? const SizedBox() : child!,
                            child: Positioned(
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Center(
                                child: IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () {
                                      Vibration.instance.select();
                                      searchController.text = '';
                                      focusNode.unfocus();
                                      context.read(_stateProvider).state =
                                          const StationStates.empty();
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Consumer(builder: (context, w, _) {
                      final loading = w(_locatingProvider).state;
                      return AnimatedLocation(loading: loading);
                    }),
                    tooltip: AppLoc.of(context).use_current_location,
                    onPressed: _getLocation,
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Consumer(builder: (context, w, _) {
                final itemPositionsListener = ItemPositionsListener.create();

                return w(_stateProvider).state.map(
                      completions: (c) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                            child: ScrollablePositionedList.builder(
                              itemPositionsListener: itemPositionsListener,
                              itemBuilder: (context, i) {
                                final completion = c.completions[i];
                                return IfWrapper(
                                  key: ValueKey(completion),
                                  condition: Env.enableAnimations,
                                  builder: (context, child) => InstantlyAnimatedWidget(
                                    delay: () {
                                      final first = itemPositionsListener
                                              .itemPositions.value.firstOrNull?.index ??
                                          0;
                                      return Duration(
                                        milliseconds: 20 * (i - first),
                                      );
                                    },
                                    builder: InstantlyAnimatedWidget.fadeScale,
                                    start: 0.5,
                                    child: child!,
                                  ),
                                  child: CompletionTile(
                                    completion,
                                    key: Key('stations-key-$i'),
                                  ),
                                );
                              },
                              itemCount: c.completions.length,
                            ),
                          ),
                        ],
                      ),
                      empty: (_) => Consumer(
                          builder: (context, w, _) => w(favoritesStatesProvider).state.map(
                                data: (c) => c.favorites.isEmpty
                                    ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            '🔎',
                                            style: TextStyle(fontSize: 48),
                                          ),
                                          const SizedBox(height: 24),
                                          Text(
                                            'Search a station',
                                            style: Theme.of(context).textTheme.headline6,
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      )
                                    : ListView.builder(
                                        itemBuilder: (context, i) => CompletionTile(
                                          SbbCompletion.fromFavorite(c.favorites[i]),
                                        ),
                                        itemCount: c.favorites.length,
                                      ),
                                loading: (_) =>
                                    const Center(child: CircularProgressIndicator.adaptive()),
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
                            'Network Error',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    );
              }),
            ),
          ],
        ),
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

  Future<void> _getLocation() async {
    Vibration.instance.selectSoft();
    context.read(_locatingProvider).state = true;

    try {
      final p = await getLocation();

      final completions =
          await context.read(navigationAPIProvider).findStation(p.latitude, p.longitude);

      final first = completions.first;
      if (first.dist != null) {
        final public = completions.where((c) => !VehicleX.isAnAddress(c.type));
        context.read(_stateProvider).state = StationStates.completions(completions);
        if (public.isNotEmpty) {
          log('Found : ${public.first}');
          searchController.text = public.first.label;
        }
      }
    } on Exception catch (e) {
      log('', error: e, name: 'Location');
    } finally {
      context.read(_locatingProvider).state = false;
    }
  }

  Future<void> fetch(String query) async {
    try {
      final completionsWithFavs = await context
          .read(completionEngineProvider)
          .complete(query: query, doUseHistory: false)
          .last;

      context.read(_stateProvider).state = StationStates.completions(completionsWithFavs);
    } on SocketException {
      context.read(_stateProvider).state = const StationStates.network();
    } on Exception catch (e, s) {
      reportDartError(e, s);
    } finally {
      context.read(_loadingProvider).state = false;
    }
  }
}

class AnimatedLocation extends StatefulWidget {
  const AnimatedLocation({
    required this.loading,
    Key? key,
  }) : super(key: key);

  final bool loading;

  @override
  _AnimatedLocationState createState() => _AnimatedLocationState();
}

class _AnimatedLocationState extends State<AnimatedLocation> with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
    upperBound: 0.25,
  );

  @override
  void didUpdateWidget(covariant AnimatedLocation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.loading) {
      controller.repeat(reverse: true);
    } else {
      final s = controller.status;
      switch (s) {
        case AnimationStatus.forward:
          controller.forward();
          break;
        case AnimationStatus.reverse:
          controller.reverse();
          break;

        case AnimationStatus.dismissed:
          break;
        case AnimationStatus.completed:
          break;
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RotationTransition(
        turns: ReverseAnimation(controller),
        child: const Icon(CupertinoIcons.location_fill),
      );
}
