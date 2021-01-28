import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/pages/home_page.dart';
import 'package:swift_travel/states/station_states.dart';
import 'package:swift_travel/utils/complete.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:theming/responsive.dart';

const _heroTag = 0xabcd;

class CupertinoTextFieldConfiguration {
  final String placeholder;
  final List<TextInputFormatter> inputFormatters;
  final TextInputAction textInputAction;

  const CupertinoTextFieldConfiguration(
      {this.textInputAction, this.inputFormatters, this.placeholder});
}

class Debouncer {
  Timer _debouncer;

  Future<void> debounce(FutureOr<void> Function() fn) async {
    // Debounce
    if (_debouncer?.isActive ?? false) {
      _debouncer?.cancel();
      _debouncer = Timer(const Duration(milliseconds: 500), fn);
    } else {
      await fn();
      _debouncer?.cancel();
      _debouncer = Timer(const Duration(milliseconds: 500), () {});
    }
  }

  void dispose() {
    _debouncer?.cancel();
  }
}

final _stateProvider = StateProvider<StationStates>((_) => const StationStates.empty());

class SearchPage extends StatefulWidget {
  final TextEditingController controller;
  final Object heroTag;
  final FocusNode focus;
  final CupertinoTextFieldConfiguration configuration;

  const SearchPage({
    @required this.controller,
    Key key,
    this.heroTag = _heroTag,
    @required this.focus,
    this.configuration = const CupertinoTextFieldConfiguration(),
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final debouncer = Debouncer();

  FavoritesSharedPreferencesStore store;
  NavigationApi api;
  String currentLocation;

  @override
  void dispose() {
    debouncer.dispose();
    widget.controller.removeListener(onChanged);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    api = context.read(navigationAPIProvider);
    store = context.read(storeProvider) as FavoritesSharedPreferencesStore;
    currentLocation = S.of(context).current_location;
  }

  void onChanged() {
    debouncer.debounce(() => fetch(widget.controller.text));
  }

  Future<void> fetch(String query) async {
    try {
      final compls = await api.complete(query);

      final completionsWithFavs = completeWithFavorites(
        store,
        compls,
        query,
        currentLocationString: currentLocation,
      );

      if (mounted) {
        context.read(_stateProvider).state = StationStates.completions(completionsWithFavs);
      }
    } on SocketException {
      context.read(_stateProvider).state = const StationStates.network();
    } on Exception catch (e, s) {
      reportDartError(e, s, library: 'search', reason: 'while fetching');
    } finally {}
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onChanged);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => onChanged());
  }

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDarwin(context)) {
      return Material(
        child: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          navigationBar: cupertinoBar(
            context,
            transitionBetweenRoutes: false,
            middle: Hero(
              tag: widget.heroTag,
              child: CupertinoTextField(
                focusNode: widget.focus,
                controller: widget.controller,
                placeholder: widget.configuration.placeholder,
                textInputAction: widget.configuration.textInputAction,
                inputFormatters: widget.configuration.inputFormatters,
              ),
            ),
            trailing: IconButton(
              color: CupertinoTheme.of(context).primaryColor,
              onPressed: () => widget.controller.clear(),
              icon: const Icon(CupertinoIcons.clear),
            ),
          ),
          child: _Results(
            onTap: (c) {
              widget.controller.text = c.label;
              Navigator.of(context).pop();
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const TextField(),
          actions: [
            CloseButton(onPressed: () {
              Navigator.of(context).pop();
            })
          ],
        ),
      );
    }
  }
}

class _Results extends StatelessWidget {
  const _Results({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  final void Function(CffCompletion completion) onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, w, _) {
      final state = w(_stateProvider);
      return state.state.map(
        completions: (c) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  (context, i) => _SuggestedTile(c.completions[i], onTap: onTap),
                  childCount: c.completions == null ? 0 : c.completions.length,
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
              'Search a station',
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

class _SuggestedTile extends StatelessWidget {
  const _SuggestedTile(
    this.suggestion, {
    Key key,
    this.onTap,
  }) : super(key: key);

  final CffCompletion suggestion;

  final ValueChanged<CffCompletion> onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(suggestion),
      leading: suggestion.isCurrentLocation
          ? const Icon(CupertinoIcons.location_fill, size: 20)
          : CffIcon.fromIconClass(suggestion.icon, size: 20),
      title: Text(suggestion.favoriteName ?? suggestion.label),
      subtitle: suggestion.favoriteName != null ? Text(suggestion.label) : null,
      trailing: suggestion.favoriteName != null
          ? (Responsive.isDarwin(context)
              ? const Icon(CupertinoIcons.heart_fill)
              : const Icon(Icons.star))
          : null,
      dense: true,
    );
  }
}
