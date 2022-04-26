import 'dart:async';
import 'dart:math' show min;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/completion.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/db/store.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/prediction/predict.dart';
import 'package:swift_travel/utils/strings/strings.dart';

const _kConfidenceThreshold = .9;
const _kMaxFavoritesCount = 3;
const _kMaxHistoryCount = 3;

final completionEngineProvider = Provider<CompletionEngine>((ref) {
  final completionEngine = CompletionEngine(ref.read);
  ref.onDispose(completionEngine.dispose);
  return completionEngine;
});

typedef UseCompletionEngineCallback = Stream<List<NavigationCompletion>>
    Function(CompletionEngine engine);

final completionStreamProvider = StreamProvider.family<
        List<NavigationCompletion>, UseCompletionEngineCallback>(
    (r, cb) => cb(r.watch(completionEngineProvider)));

class CompletionEngine {
  CompletionEngine(
    this.read, {
    RouteHistoryRepository? routeHistoryRepository,
  }) : routeHistoryRepository =
            routeHistoryRepository ?? RouteHistoryRepository.instance;

  final T Function<T>(ProviderBase<T> provider) read;
  final RouteHistoryRepository routeHistoryRepository;

  Future<List<NavigationCompletion>> completeNavigation({
    required String query,
    bool doUseHistory = true,
  }) async {
    final favorites = read(storeProvider).stops;
    final history = doUseHistory
        ? routeHistoryRepository.history
        : const Iterable<LocalRoute>.empty();
    final completions = await read(navigationAPIProvider).complete(query);
    final distances = <MapEntry<FavoriteStop, double>>[];

    for (final c in favorites) {
      final leven = scaledLevenshtein(query, c.name.replaceAll(',', ''));
      if (leven < _kConfidenceThreshold) {
        distances.add(MapEntry(c, leven));
      }
    }

    final favs = distances..sort((a, b) => a.value.compareTo(b.value));

    return [
      if (history.isNotEmpty)
        ...history
            .flatMap((e) => [
                  SbbCompletion(
                      label: e.fromAsString, origin: DataOrigin.history),
                  SbbCompletion(
                      label: e.toAsString, origin: DataOrigin.history),
                ])
            .take(_kMaxHistoryCount)
            .toSet(),
      ...favs
          .take(_kMaxFavoritesCount)
          .map((e) => SbbCompletion.fromFavorite(e.key)),
      ...completions,
    ];
  }

  Stream<List<NavigationCompletion>> complete({
    required String query,
    DateTime? date,
    bool doPredict = false,
    bool doUseCurrentLocation = true,
    bool doUseHistory = true,
  }) async* {
    assert(!doPredict || date != null,
        'If you use prediction, you must provide a date argument');

    final favorites = read(storeProvider).stops;
    final history =
        doUseHistory ? routeHistoryRepository.history : const <LocalRoute>[];
    final completions = await read(navigationAPIProvider).complete(query);
    final distances = <FavoriteStop, double>{};

    for (final c in favorites) {
      final leven = scaledLevenshtein(query, c.name.replaceAll(',', ''));
      if (leven < _kConfidenceThreshold) {
        distances[c] = leven;
      }
    }

    final favs = distances.entries.toList(growable: false)
      ..sort((a, b) => a.value.compareTo(b.value));

    final historySet = history
        .flatMap((e) => [
              SbbCompletion(label: e.fromAsString, origin: DataOrigin.history),
              SbbCompletion(label: e.toAsString, origin: DataOrigin.history),
            ])
        .take(_kMaxHistoryCount)
        .toSet();

    final favsIter = favs
        .take(min(favs.length, _kMaxFavoritesCount))
        .map((e) => SbbCompletion.fromFavorite(e.key));

    final list = _returnedList(
      q: query,
      doUseCurrentLocation: doUseCurrentLocation,
      history: historySet,
      favs: favsIter,
      completions: completions,
      doPredict: doPredict,
      prediction: null,
    );
    yield list;

    if (doPredict) {
      final prediction = await predictRoute(
          history, PredictionArguments.withSource(query, dateTime: date));
      final event = _returnedList(
        q: query,
        doUseCurrentLocation: doUseCurrentLocation,
        history: historySet,
        favs: favsIter,
        completions: completions,
        doPredict: doPredict,
        prediction: prediction,
      );
      yield event;
    }
  }

// ignore: long-parameter-list
  List<NavigationCompletion> _returnedList({
    required String q,
    required bool doUseCurrentLocation,
    required Iterable<SbbCompletion> history,
    required Iterable<SbbCompletion> favs,
    required Iterable<NavigationCompletion> completions,
    required bool doPredict,
    required RoutePrediction? prediction,
  }) =>
      [
        if (doUseCurrentLocation) const CurrentLocationCompletion(),
        if (doPredict)
          if (prediction == null)
            SbbCompletion(label: q, origin: DataOrigin.loading)
          else if (prediction.prediction != null)
            SbbCompletion(
                label: prediction.prediction!.toAsString,
                origin: DataOrigin.prediction),
        if (history.isNotEmpty) ...history,
        ...favs,
        ...completions,
      ];

  void dispose() {}
}

@Deprecated('Use CompletionEngine instead.')

/// Add similar favorites to the completions
List<NavigationCompletion> completeWithFavorites({
  required Iterable<FavoriteStop> favorites,
  required List<NavigationCompletion> completions,
  required String query,
  required List<LocalRoute> history,
  String? currentLocationString,
  String? prediction,
}) {
  final distances = <FavoriteStop?, double>{};

  for (final c in favorites) {
    final leven = scaledLevenshtein(query, c.name.replaceAll(',', ''));
    if (leven < _kConfidenceThreshold) {
      distances[c] = leven;
    }
  }

  final favs = distances.entries.toList(growable: false)
    ..sort((a, b) => a.value.compareTo(b.value));

  return [
    if (currentLocationString != null)
      SbbCompletion(
          label: currentLocationString, origin: DataOrigin.currentLocation),
    if (prediction != null)
      SbbCompletion(label: prediction, origin: DataOrigin.prediction),
    if (history.isNotEmpty)
      ...history
          .flatMap((e) => [
                SbbCompletion(
                    label: e.fromAsString, origin: DataOrigin.history),
                SbbCompletion(label: e.toAsString, origin: DataOrigin.history),
              ])
          .take(_kMaxHistoryCount)
          .toSet(),
    ...favs
        .take(min(favs.length, _kMaxFavoritesCount))
        .map((e) => SbbCompletion.fromFavorite(e.key!)),
    ...completions,
  ];
}

extension IterableX<T> on Iterable<T> {
  Iterable<R> flatMap<R>(Iterable<R> Function(T e) map) sync* {
    for (final e in this) {
      for (final e2 in map(e)) {
        yield e2;
      }
    }
  }
}
