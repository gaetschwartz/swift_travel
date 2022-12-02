import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/db/store.dart';
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
import 'package:swift_travel/widgets/listener.dart';
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
    required this.heroTag,
    super.key,
    this.configuration = const TextFieldConfiguration(),
    this.isDestination = false,
    this.dateTime,
  });

  final LocationTextBoxManager binder;
  // ignore: no-object-declaration
  final Object heroTag;
  final TextFieldConfiguration configuration;
  final bool isDestination;
  final DateTime? dateTime;
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
      _sub = ref
          .read(completionEngineProvider)
          .complete(
            query: query,
            doPredict: widget.isDestination,
            date: ref.read(dateProvider),
          )
          .listen(
        (c) {
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
            reportDartError(e, s as StackTrace,
                library: 'search', reason: 'while fetching');
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
  Widget toTextField(
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
          onSubmitted: (s) => Navigator.of(context).pop(s),
        ),
      );

  @allowReturningWidgets
  Widget toCupertino(
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
        onSubmitted: (s) => Navigator.of(context).pop(s),
      );

  @override
  Widget build(BuildContext context) => CupertinoScaffold(
        body: PlatformBuilder(
          cupertinoBuilder: (context, child) => Material(
            child: CupertinoPageScaffold(
              navigationBar: SwiftCupertinoBar(
                transitionBetweenRoutes: false,
                middle: Hero(
                  tag: widget.heroTag,
                  child: toCupertino(
                    context,
                    widget.configuration,
                    controller: widget.binder.controller,
                  ),
                ),
                trailing: _ClearButton(binder: widget.binder),
              ),
              child: child!,
            ),
          ),
          materialBuilder: (context, child) => Scaffold(
            appBar: AppBar(
              title: Hero(
                  tag: widget.heroTag,
                  child: toTextField(
                    context,
                    widget.configuration,
                    controller: widget.binder.controller,
                  )),
              actions: [_ClearButton(binder: widget.binder)],
              leading: const CloseButton(key: SearchPage.closeSearchKey),
            ),
            body: child,
          ),
          child: _Results(
            onTap: onSuggestionTapped,
            focusNode: widget.configuration.focusNode,
          ),
        ),
      );

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
    Navigator.of(context).pop();
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({
    required this.binder,
  });

  final LocationTextBoxManager binder;

  @override
  Widget build(BuildContext context) =>
      ListenableBuilder<TextEditingController>(
        builder: (context, listenable, child) => AnimatedOpacity(
          opacity: listenable.text.isEmpty ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          child: IconButton(
            color: CupertinoTheme.of(context).primaryColor,
            onPressed: listenable.text.isEmpty ? null : binder.clear,
            icon: const Icon(CupertinoIcons.clear),
          ),
        ),
        listenable: binder.controller,
      );
}

class _Results extends StatelessWidget {
  const _Results({
    required this.onTap,
    required this.focusNode,
  });

  final void Function(Completion completion) onTap;

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, w, _) {
      final state = w.watch(_stateProvider);
      return state.when(
        completions: (c) => Stack(
          children: [
            Positioned.fill(
              child: ListView.builder(
                itemBuilder: (context, i) => SuggestedTile(c[i], onTap: onTap),
                itemCount: c.length,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: ListenableBuilder(
                listenable: focusNode!,
                builder: (context, _, __) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: focusNode!.hasFocus ? 1 : 0,
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
                  );
                },
              ),
            ),
          ],
        ),
        empty: () => Column(
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
        network: () => Column(
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
        ),
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
