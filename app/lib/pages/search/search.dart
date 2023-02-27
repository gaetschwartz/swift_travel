import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/db/favorite_store.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/pages/search/models.dart';
import 'package:swift_travel/prediction/complete.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/prediction/predict.dart';
import 'package:swift_travel/states/station_states.dart';
import 'package:swift_travel/tabs/routes/location_text_box_manager.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/utils/definitions.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/contacts.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/vehicle_icon.dart';
import 'package:vibration/vibration.dart';

class Debouncer {
  Debouncer({this.duration = const Duration(milliseconds: 500)});
  final Duration duration;

  Timer? _debouncer;

  Future<void> debounce(FutureOr<void> Function() fn) async {
    _debouncer?.cancel();
    if (_debouncer != null && _debouncer!.isActive) {
      _debouncer = Timer(duration, fn);
    } else {
      await fn();
      _debouncer = Timer(duration, () {});
    }
  }

  void dispose() {
    _debouncer?.cancel();
  }
}

final _stateProvider =
    StateProvider<StationStates>((_) => const StationStates.empty());

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({
    required this.binder,
    this.heroTag,
    super.key,
    this.configuration = const TextFieldConfiguration(),
    this.isDestination = false,
    this.dateTime,
    this.completeCurrentLocation = true,
    this.completeContacts = true,
    this.completeHistory = true,
    this.completeFavorites = true,
  });

  final LocationTextBoxManager binder;
  // ignore: no-object-declaration
  final Object? heroTag;
  final TextFieldConfiguration configuration;
  final bool isDestination;
  final DateTime? dateTime;
  final bool completeCurrentLocation;
  final bool completeContacts;
  final bool completeHistory;
  final bool completeFavorites;
  static const closeSearchKey = Key('close-search');

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final debouncer = Debouncer();
  final log = Logger.of('SearchPage');

  late BaseFavoritesStore store;
  late BaseNavigationApi api;
  final hist = RouteHistoryRepository.instance;
  String? previousText;

  @override
  void initState() {
    super.initState();
    widget.binder.controller.addListener(onChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) => unawaited(onChanged()));
  }

  @override
  void dispose() {
    unawaited(_sub?.cancel());
    debouncer.dispose();
    widget.binder.controller.removeListener(onChanged);
    if (widget.configuration.focusNode == null) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    api = ref.read(navigationAPIProvider);
    store = ref.read(favoritesStoreProvider);
  }

  Future<void> onChanged() async {
    final text = widget.binder.text;
    if (previousText != text) {
      previousText = text;
      await debouncer.debounce(() => fetch(text));
    }
  }

  StreamSubscription<List<NavigationCompletion>>? _sub;

  Future<void> fetch(String query) async {
    if (_sub != null) {
      await _sub!.cancel();
    }
    if (mounted) {
      final LocationType locationType;

      final searchType = ref.read(_searchTypeProvider);
      switch (searchType) {
        case SearchType.station:
          locationType = LocationType.station;
          break;
        case SearchType.address:
          locationType = LocationType.address;
          break;
      }
      _sub = ref
          .read(completionEngineProvider)
          .complete(
            query: query,
            doPredict: widget.isDestination,
            date: ref.read(dateProvider),
            locationType: locationType,
            doUseCurrentLocation: widget.completeCurrentLocation,
            doUseContacts:
                searchType == SearchType.address && widget.completeContacts,
            doUseHistory: widget.completeHistory,
            doUseFavorites: widget.completeFavorites,
          )
          .listen(
        (c) {
          if (kDebugMode) {
            log.log('Got completions: $c');
          }
          if (mounted) {
            ref.read(_stateProvider.notifier).state =
                StationStates.completions(c);
          }
        },
        onError: (dynamic e, dynamic s) {
          if (e is SocketException) {
            ref.read(_stateProvider.notifier).state =
                const StationStates.network();
          } else if (e is Exception) {
            reportDartError(
              e,
              s as StackTrace,
              library: 'search',
              context: 'while fetching',
            );
          }
        },
      );
    }
  }

  Future<String?> getPrediction(String query) async {
    if (widget.isDestination) {
      final args =
          PredictionArguments.withSource(query, dateTime: widget.dateTime);
      log.log('Predicting the destination with $args');
      final prediction = await predictRoute(hist.history, args);
      log.log(prediction);
      if (prediction.prediction != null && prediction.confidence > .2) {
        return prediction.prediction!
            .map(v1: (v1) => v1.to, v2: (v2) => v2.to.name);
      }
    }
    return null;
  }

  @allowReturningWidgets
  Widget getTextField(
    BuildContext context,
    TextFieldConfiguration configuration, {
    TextEditingController? controller,
  }) =>
      Material(
        child: TextField(
          decoration: InputDecoration(
            hintText: configuration.placeholder,
            prefixIcon: configuration.prefix,
            isDense: true,
          ),
          inputFormatters: configuration.inputFormatters,
          textInputAction: configuration.textInputAction,
          focusNode: configuration.focusNode,
          controller: controller,
          key: configuration.key,
          autocorrect: false,
          onSubmitted: (s) =>
              Navigator.of(context).pop<Completion>(Completion.fromString(s)),
        ),
      );

  @allowReturningWidgets
  Widget getCupertinoTextField(
    BuildContext context,
    TextFieldConfiguration configuration, {
    TextEditingController? controller,
  }) =>
      CupertinoTextField(
        placeholder: configuration.placeholder,
        inputFormatters: configuration.inputFormatters,
        textInputAction: configuration.textInputAction,
        prefix: configuration.prefix,
        focusNode: configuration.focusNode,
        controller: controller,
        key: configuration.key,
        autocorrect: false,
        onSubmitted: (s) =>
            Navigator.of(context).pop<Completion>(Completion.fromString(s)),
      );

  late final focusNode = widget.configuration.focusNode ?? FocusNode();

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: PlatformBuilder(
        cupertinoBuilder: (context, child) {
          Widget cup = getCupertinoTextField(
            context,
            widget.configuration,
            controller: widget.binder.controller,
          );
          if (widget.heroTag != null) {
            cup = Hero(tag: widget.heroTag!, child: cup);
          }
          return Material(
            child: CupertinoPageScaffold(
              navigationBar: SwiftCupertinoBar(
                transitionBetweenRoutes: false,
                middle: cup,
                trailing: _ClearButton(binder: widget.binder),
              ),
              child: child!,
            ),
          );
        },
        materialBuilder: (context, child) {
          Widget txt = getTextField(
            context,
            widget.configuration,
            controller: widget.binder.controller,
          );
          if (widget.heroTag != null) {
            txt = Hero(tag: widget.heroTag!, child: txt);
          }
          return Scaffold(
            appBar: AppBar(
              title: txt,
              actions: [_ClearButton(binder: widget.binder)],
              leading: const CloseButton(key: SearchPage.closeSearchKey),
              // show segmented control to select between stations and addresses
            ),
            body: child,
          );
        },
        child: _Results(
          onTap: onSuggestionTapped,
          focusNode: widget.configuration.focusNode ?? focusNode,
          top: _SearchTypeSelector(
            onTap: (t) async {
              await debouncer.debounce(() => fetch(widget.binder.text));
            },
          ),
        ),
      ),
    );
  }

  void onSuggestionTapped(Completion c) {
    Vibration.instance.select();

    if (c.origin == DataOrigin.currentLocation) {
      log.log('Using current location');
      widget.binder.useCurrentLocation();
    } else if (c is ContactCompletion) {
      final a = c.contact.postalAddresses.firstOrNull;
      if (a != null) {
        log.log('Selecting contact ${c.contact.toMap()}');
        widget.binder.setString(a.toString());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(AppLocalizations.of(context).contact_no_address)));
      }
    } else {
      widget.binder.setString(c.label);
    }
    Navigator.of(context).pop<Completion>(c);
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({
    required this.binder,
  });

  final LocationTextBoxManager binder;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        builder: (context, child) => AnimatedOpacity(
          opacity: binder.controller.text.isEmpty ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          child: IconButton(
            color: CupertinoTheme.of(context).primaryColor,
            onPressed: binder.controller.text.isEmpty ? null : binder.clear,
            icon: const Icon(CupertinoIcons.clear),
          ),
        ),
        animation: binder.controller,
      );
}

enum SearchType { station, address }

final _searchTypeProvider = StateProvider((ref) => SearchType.address);

class _SearchTypeSelector extends ConsumerWidget {
  const _SearchTypeSelector({this.onTap});

  final ValueChanged<SearchType>? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchType = ref.watch(_searchTypeProvider);
    return CupertinoSlidingSegmentedControl<SearchType>(
      groupValue: searchType,
      onValueChanged: (value) {
        ref.read(_searchTypeProvider.notifier).state = value!;
        onTap?.call(value);
      },
      children: const {
        SearchType.address: Text('Address'),
        SearchType.station: Text('Station'),
      },
    );
  }
}

class _Results extends StatelessWidget {
  const _Results({
    required this.onTap,
    required this.focusNode,
    required this.top,
  });

  final void Function(Completion completion) onTap;

  final FocusNode focusNode;
  final Widget top;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, w, _) {
      final state = w.watch(_stateProvider);
      final slivers = state.when(
        completions: (c) => [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => SuggestedTile(c[i], onTap: onTap),
              childCount: c.length,
            ),
          )
        ],
        empty: () => [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  '🔎',
                  style: TextStyle(fontSize: 48),
                  textAlign: TextAlign.center,
                ),
                const Gap(24),
                Text(
                  AppLocalizations.of(context).search_station,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
        network: () => [
          SliverToBoxAdapter(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.wifi_off,
                size: 48,
              ),
              const Gap(16),
              Text(
                'Network Error',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ))
        ],
      );
      return Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                SliverSafeArea(
                  sliver: SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: top,
                  )),
                  bottom: false,
                ),
                ...slivers,
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: AnimatedBuilder(
              animation: focusNode,
              builder: (context, _) {
                return SafeArea(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: focusNode.hasFocus ? 1 : 0,
                    child: Card(
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: () => unawaited(pickContact(context)),
                              icon: const Icon(
                                  FluentIcons.contact_card_group_24_regular),
                              label:
                                  Text(AppLocalizations.of(context).contacts),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }

  Future<void> pickContact(BuildContext context) async {
    Vibration.instance.select();
    final log = Logger('search', 'Result', 'pickContact');
    final c = await showContactPicker(context);
    if (c != null) {
      log.log('Chose ${c.displayName}');
      log.log('with address ${c.postalAddresses.firstOrNull}');
      onTap(ContactCompletion(c));
    }
  }
}

class SuggestedTile extends StatelessWidget {
  const SuggestedTile(
    this.suggestion, {
    super.key,
    this.onTap,
  });

  final Completion suggestion;
  final ValueChanged<Completion>? onTap;

  @override
  Widget build(BuildContext context) {
    final isLoading = suggestion.origin == DataOrigin.loading;
    final label = suggestion.origin == DataOrigin.currentLocation
        ? AppLocalizations.of(context).current_location
        : suggestion.label;
    return IfWrapper(
      condition: isLoading,
      builder: (context, child) => Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: child!,
      ),
      child: ListTile(
        onTap: isLoading ? null : () => onTap?.call(suggestion),
        leading: _SuggestedTileIcon(suggestion: suggestion),
        horizontalTitleGap: 0,
        title: isLoading
            ? Text(
                label,
                style: const TextStyle(
                    backgroundColor: Colors.black, color: Colors.transparent),
              )
            : Text(suggestion.displayName ?? label),
        subtitle:
            suggestion.displayName != null ? Text(suggestion.label) : null,
        dense: true,
      ),
    );
  }
}

class _SuggestedTileIcon extends StatelessWidget {
  const _SuggestedTileIcon({
    required this.suggestion,
  });

  final Completion suggestion;

  @allowReturningWidgets
  Widget icon(BuildContext context) {
    switch (suggestion.origin) {
      case DataOrigin.favorites:
        return const Icon(CupertinoIcons.heart_fill);
      case DataOrigin.history:
        return const Icon(CupertinoIcons.clock);
      case DataOrigin.api:
        return suggestion.iconBuilder?.call(context) ??
            LocationTypeIcon(suggestion.type);
      case DataOrigin.currentLocation:
        return const Icon(CupertinoIcons.location_fill);
      case DataOrigin.prediction:
        return const Icon(CupertinoIcons.wand_stars);
      case DataOrigin.loading:
        return const Icon(CupertinoIcons.wand_stars);
      case DataOrigin.contacts:
        return const Icon(CupertinoIcons.person_fill);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: Theme.of(context).iconTheme.copyWith(size: 20),
      child: icon(context),
    );
  }
}
