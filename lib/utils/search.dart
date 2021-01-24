import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/blocs/navigation.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/states/station_states.dart';
import 'package:swift_travel/utils/complete.dart';
import 'package:swift_travel/utils/errors.dart';
import 'package:swift_travel/widgets/cff_icon.dart';
import 'package:theming/responsive.dart';

final _stateProvider = StateProvider<StationStates>((_) => const StationStates.empty());
final _loadingProvider = StateProvider((_) => false);

class SearchPage extends StatefulWidget {
  final TextEditingController controller;

  const SearchPage({
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
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

class _SearchPageState extends State<SearchPage> {
  final debouncer = Debouncer();
  FavoritesSharedPreferencesStore store;
  NavigationApi api;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    debouncer.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    api = context.read(navigationAPIProvider);
    store = context.read(storeProvider) as FavoritesSharedPreferencesStore;
  }

  void onChanged(String s) {
    log('Changed');
    debouncer.debounce(() => fetch(s));
  }

  Future<void> fetch(String query) async {
    try {
      final compls = await api.complete(query);

      final completionsWithFavs =
          await completeWithFavorites(store, compls, query, currentLocationString: null);

      log('Completions : ${completionsWithFavs.length}');

      context.read(_stateProvider).state = StationStates.completions(completionsWithFavs);
    } on SocketException {
      context.read(_stateProvider).state = const StationStates.network();
    } on Exception catch (e, s) {
      if (isMobile) {
        reportDartError(e, s, name: 'search', reason: 'while fetching');
      } else {
        log('', error: e, stackTrace: s);
      }
    } finally {
      // context.read(_loadingProvider).state = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDarwin(context)) {
      return Material(
        child: Builder(
            builder: (context) => CupertinoPageScaffold(
                  resizeToAvoidBottomInset: false,
                  navigationBar: CupertinoNavigationBar(
                    backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
                    leading: BackButton(
                      color: CupertinoTheme.of(context).primaryColor,
                      onPressed: () =>
                          Navigator.of(context).pop(CffCompletion(label: widget.controller.text)),
                    ),
                    middle: CupertinoTextField(
                      controller: widget.controller,
                      onChanged: onChanged,
                      style: CupertinoTheme.of(context).textTheme.textStyle,
                    ),
                    trailing: CloseButton(
                      color: CupertinoTheme.of(context).primaryColor,
                      onPressed: () =>
                          context.read(_stateProvider).state = const StationStates.empty(),
                    ),
                  ),
                  child: const _Results(),
                )),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const TextField(),
          actions: [CloseButton(onPressed: () {})],
        ),
      );
    }
  }
}

class _Results extends StatelessWidget {
  const _Results({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer(builder: (context, w, _) {
      final state = w(_stateProvider);
      return state.state.map(
        completions: (c) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              child: ListView.builder(
                itemBuilder: (context, i) =>
                    _SuggestedTile(c.completions[i], onTap: (c) => Navigator.of(context).pop(c)),
                itemCount: c.completions == null ? 0 : c.completions.length,
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
    }));
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
