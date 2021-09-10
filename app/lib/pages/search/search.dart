import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
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
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/contacts.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/listener.dart';
import 'package:theming/responsive.dart';
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

final _stateProvider = StateProvider<StationStates>((_) => const StationStates.empty());

class SearchPage extends StatefulWidget {
  const SearchPage({
    required this.binder,
    required this.heroTag,
    Key? key,
    this.configuration = const TextFieldConfiguration(),
    this.isDestination = false,
    this.dateTime,
  }) : super(key: key);

  final TextStateBinder binder;
  // ignore: no-object-declaration
  final Object heroTag;
  final TextFieldConfiguration configuration;
  final bool isDestination;
  final DateTime? dateTime;
  static const closeSearchKey = Key('close-search');

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final debouncer = Debouncer();

  late BaseFavoritesStore store;
  late BaseNavigationApi api;
  final hist = RouteHistoryRepository.i;
  String? previousText;

  @override
  void initState() {
    super.initState();
    widget.binder.controller.addListener(onChanged);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => onChanged());
  }

  @override
  void dispose() {
    _sub?.cancel();
    debouncer.dispose();
    widget.binder.controller.removeListener(onChanged);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    api = context.read(navigationAPIProvider);
    store = context.read(storeProvider);
  }

  Future<void> onChanged() async {
    final text = widget.binder.text;
    if (previousText != text) {
      previousText = text;
      await debouncer.debounce(() => fetch(text));
    }
  }

  StreamSubscription? _sub;

  Future<void> fetch(String query) async {
    if (_sub != null) {
      await _sub!.cancel();
    }
    if (mounted) {
      _sub = context
          .read(completionEngineProvider)
          .complete(
            query: query,
            doPredict: widget.isDestination,
            date: context.read(dateProvider).state,
          )
          .listen(
        (c) {
          if (mounted) {
            context.read(_stateProvider).state = StationStates.completions(c);
          }
        },
        onError: (dynamic e, dynamic s) {
          if (e is SocketException) {
            context.read(_stateProvider).state = const StationStates.network();
          } else if (e is Exception) {
            reportDartError(e, s as StackTrace, library: 'search', reason: 'while fetching');
          }
        },
      );
    }
  }

  Future<String?> getPrediction(String query) async {
    if (widget.isDestination) {
      final args = PredictionArguments.withSource(query, dateTime: widget.dateTime);
      print('Predicting the destination with $args');
      final prediction = await predictRoute(hist.history, args);
      print(prediction);
      if (prediction.prediction != null && prediction.confidence > .2) {
        return prediction.prediction!.map(v1: (v1) => v1.to, v2: (v2) => v2.to.name);
      }
    }
  }

  @override
  Widget build(BuildContext context) => CupertinoScaffold(
        body: PlatformBuilder(
          cupertinoBuilder: (context, child) => Material(
            child: CupertinoPageScaffold(
              navigationBar: SwiftCupertinoBar(
                transitionBetweenRoutes: false,
                middle: Hero(
                  tag: widget.heroTag,
                  child: widget.configuration.toCupertino(controller: widget.binder.controller),
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
                  child: widget.configuration.toTextField(controller: widget.binder.controller)),
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

  void onSuggestionTapped(NavigationCompletion c) {
    Vibration.instance.select();

    if (c.origin == DataOrigin.currentLocation) {
      print('Using current location');
      widget.binder.useCurrentLocation(context);
    } else if (c is ContactCompletion) {
      final a = c.contact.postalAddresses.firstOrNull;
      if (a != null) {
        print(c.contact.toMap());
        widget.binder.setString(context, a.toString());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).contact_no_address)));
      }
    } else {
      widget.binder.setString(context, c.label);
    }
    Navigator.of(context).pop();
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({
    required this.binder,
    Key? key,
  }) : super(key: key);

  final TextStateBinder binder;

  @override
  Widget build(BuildContext context) => ListenableBuilder<TextEditingController>(
        builder: (context, listenable, child) => AnimatedOpacity(
          opacity: listenable.text.isEmpty ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          child: IconButton(
            color: CupertinoTheme.of(context).primaryColor,
            onPressed: listenable.text.isEmpty ? null : () => binder.clear(context),
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
    Key? key,
  }) : super(key: key);

  final void Function(NavigationCompletion completion) onTap;

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => Consumer(builder: (context, w, _) {
        final state = w(_stateProvider);
        return state.state.when(
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
                                onPressed: () => pickContact(context),
                                icon: const Icon(FluentIcons.contact_card_group_24_regular),
                                label: Text(AppLocalizations.of(context).contacts),
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
                style: Theme.of(context).textTheme.headline6,
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
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        );
      });

  void pickContact(BuildContext context) async {
    Vibration.instance.select();
    final c = await showContactPicker(context);
    if (c != null) {
      print("Chose ${c.displayName}");
      print("with address ${c.postalAddresses.firstOrNull}");
      onTap(ContactCompletion(c));
    }
  }
}

class SuggestedTile extends StatelessWidget {
  const SuggestedTile(
    this.suggestion, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  final NavigationCompletion suggestion;
  final ValueChanged<NavigationCompletion>? onTap;

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
        horizontalTitleGap: 8,
        title: isLoading
            ? Text(
                label,
                style: const TextStyle(backgroundColor: Colors.black, color: Colors.transparent),
              )
            : Text(suggestion.favoriteName ?? label),
        subtitle: suggestion.favoriteName != null ? Text(label) : null,
        trailing: suggestion.favoriteName != null
            ? (isThemeDarwin(context)
                ? const Icon(CupertinoIcons.heart_fill)
                : const Icon(Icons.star))
            : null,
        dense: true,
      ),
    );
  }
}

class _SuggestedTileIcon extends StatelessWidget {
  const _SuggestedTileIcon({
    required this.suggestion,
    Key? key,
  }) : super(key: key);

  final NavigationCompletion suggestion;

  @override
  Widget build(BuildContext context) {
    switch (suggestion.origin) {
      case DataOrigin.favorites:
        return const Icon(
          CupertinoIcons.heart_fill,
          size: 20,
        );
      case DataOrigin.history:
        return const Icon(
          CupertinoIcons.clock,
          size: 20,
        );
      case DataOrigin.data:
        return suggestion.getIcon(size: 20);
      case DataOrigin.currentLocation:
        return const Icon(
          CupertinoIcons.location_fill,
          size: 20,
        );
      case DataOrigin.prediction:
        return const Icon(
          CupertinoIcons.wand_stars,
          size: 20,
        );
      case DataOrigin.loading:
        return const Icon(
          CupertinoIcons.wand_stars,
          size: 20,
        );
      case DataOrigin.contacts:
        return const Icon(
          CupertinoIcons.person,
          size: 20,
        );
    }
  }
}

extension AddressX on Address {
  String toDetailedString() => [
        if (addressLine != null) ...addressLine!,
        if (postcode != null || city != null)
          "${postcode ?? ''}${city != null && postcode != null ? ' ' : ''}${city ?? ''}",
        if (country != null) country,
      ].join(", ");
}
