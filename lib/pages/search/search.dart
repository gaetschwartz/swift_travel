import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/l10n.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/states/station_states.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/utils/predict/complete.dart';
import 'package:swift_travel/utils/predict/models/models.dart';
import 'package:swift_travel/utils/predict/predict.dart';
import 'package:swift_travel/widgets/if_wrapper.dart';
import 'package:swift_travel/widgets/listener.dart';
import 'package:theming/responsive.dart';

const _heroTag = 0xabcd;

class CupertinoTextFieldConfiguration {
  const CupertinoTextFieldConfiguration({
    this.key,
    this.focusNode,
    this.prefix,
    this.textInputAction,
    this.inputFormatters,
    this.placeholder,
  });

  final String? placeholder;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Widget? prefix;
  final FocusNode? focusNode;
  final Key? key;

  CupertinoTextField toCupertino({TextEditingController? controller}) {
    return CupertinoTextField(
      placeholder: placeholder,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      prefix: prefix,
      focusNode: focusNode,
      controller: controller,
      key: key,
    );
  }

  Widget toTextField({TextEditingController? controller}) {
    return Material(
      child: TextField(
        decoration: InputDecoration(
          hintText: placeholder,
          prefixIcon: prefix,
        ),
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        focusNode: focusNode,
        controller: controller,
        key: key,
      ),
    );
  }
}

extension CupertinoTextFieldX on CupertinoTextField {
  static CupertinoTextField fromConfiguration(CupertinoTextFieldConfiguration c) => c.toCupertino();
}

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
    Key? key,
    this.heroTag = _heroTag,
    this.configuration = const CupertinoTextFieldConfiguration(),
    this.isDestination = false,
    this.dateTime,
  }) : super(key: key);

  final TextStateBinder binder;
  final Object heroTag;
  final CupertinoTextFieldConfiguration configuration;
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
  late String currentLocation;
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
    currentLocation = AppLoc.of(context).current_location;
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
    _sub = context
        .read(completionEngineProvider)
        .complete(
          query: query,
          doPredict: widget.isDestination,
          currentLocationString: currentLocation,
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

  Future<String?> getPrediction(String query) async {
    if (widget.isDestination) {
      final args = PredictionArguments.source(widget.dateTime!, query);
      print('Predicting the destination with $args');
      final prediction = await predictRoute(hist.history, args);
      print(prediction);
      if (prediction.prediction != null && prediction.confidence > .2) {
        return prediction.prediction!.to;
      }
    }
  }

  late final isDarwin = Responsive.isDarwin(context);

  @override
  Widget build(BuildContext context) {
    return IfWrapper(
      condition: isDarwin,
      builder: (context, child) => Material(
        child: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          navigationBar: cupertinoBar(
            context,
            transitionBetweenRoutes: false,
            middle: Hero(
              tag: widget.heroTag,
              child: widget.configuration.toCupertino(controller: widget.binder.controller),
            ),
            trailing: IconButton(
              color: CupertinoTheme.of(context).primaryColor,
              onPressed: () => widget.binder.clear(context),
              icon: ListenerWidget<TextEditingController>(
                builder: (context, listenable, child) => Offstage(
                  offstage: listenable.text.isEmpty,
                  child: const Icon(CupertinoIcons.clear),
                ),
                listenable: widget.binder.controller,
              ),
            ),
          ),
          child: child!,
        ),
      ),
      elseBuilder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Hero(
                tag: widget.heroTag,
                child: widget.configuration.toTextField(controller: widget.binder.controller)),
            actions: [CloseButton(onPressed: () => Navigator.of(context).pop())],
            leading: const CloseButton(key: SearchPage.closeSearchKey),
          ),
          body: child,
        );
      },
      child: _Results(onTap: onSuggestionTapped),
    );
  }

  void onSuggestionTapped(Completion c) {
    if (c.origin == DataOrigin.currentLocation) {
      print('It is current location');
      widget.binder.useCurrentLocation(context);
    } else {
      widget.binder.setString(context, c.label);
    }
    Navigator.of(context).pop();
  }
}

class _Results extends StatelessWidget {
  const _Results({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function(Completion completion) onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, w, _) {
      final state = w(_stateProvider);
      return state.state.map(
        completions: (c) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  height: 4,
                  child: Center(
                    child: Consumer(
                      builder: (context, w, _) => const SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
            SliverSafeArea(
              bottom: false,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => SuggestedTile(c.completions[i], onTap: onTap),
                  childCount: c.completions.length,
                ),
              ),
            ),
          ],
        ),
        empty: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '🔎',
              style: TextStyle(fontSize: 48),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              AppLoc.of(context).search_station,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            )
          ],
        ),
        network: (value) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
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
    });
  }
}

class SuggestedTile extends StatelessWidget {
  const SuggestedTile(
    this.suggestion, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Completion suggestion;
  final ValueChanged<Completion>? onTap;

  Widget buildIcon(BuildContext context) {
    switch (suggestion.origin) {
      case DataOrigin.favorites:
        return Icon(
          CupertinoIcons.heart_fill,
          size: 20,
          color: IconTheme.of(context).color,
        );
      case DataOrigin.history:
        return Icon(
          CupertinoIcons.clock,
          size: 20,
          color: IconTheme.of(context).color,
        );
      case DataOrigin.data:
        return suggestion.getIcon(size: 20);
      case DataOrigin.currentLocation:
        return Icon(
          CupertinoIcons.location_fill,
          size: 20,
          color: IconTheme.of(context).color,
        );
      case DataOrigin.prediction:
        return Icon(
          CupertinoIcons.wand_stars,
          size: 20,
          color: IconTheme.of(context).color,
        );
      case DataOrigin.loading:
        return const SizedBox(
          height: 20,
          width: 20,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.black),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = suggestion.origin == DataOrigin.loading;
    return IfWrapper(
      condition: isLoading,
      builder: (context, child) => Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: child!,
      ),
      child: ListTile(
        onTap: isLoading ? null : () => onTap?.call(suggestion),
        leading: buildIcon(context),
        horizontalTitleGap: 8,
        title: isLoading
            ? Text(
                suggestion.label,
                style: const TextStyle(backgroundColor: Colors.black, color: Colors.transparent),
              )
            : Text(suggestion.favoriteName ?? suggestion.label),
        subtitle: suggestion.favoriteName != null ? Text(suggestion.label) : null,
        trailing: suggestion.favoriteName != null
            ? (Responsive.isDarwin(context)
                ? const Icon(CupertinoIcons.heart_fill)
                : const Icon(Icons.star))
            : null,
        dense: true,
      ),
    );
  }
}
