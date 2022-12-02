import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
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
  final engine = CompletionEngine(ref);
  engine.init();
  ref.onDispose(engine.dispose);
  return engine;
});

class CompletionEngine {
  CompletionEngine(
    this.ref, {
    RouteHistoryRepository? routeHistoryRepository,
  }) : routeHistoryRepository =
            routeHistoryRepository ?? RouteHistoryRepository.instance;

  final ProviderRef<CompletionEngine> ref;
  final RouteHistoryRepository routeHistoryRepository;

  Future<void> init() async {}

  Future<List<Completion>> completeNavigation({
    required String query,
    bool doUseHistory = true,
    LocationType locationType = LocationType.any,
  }) async {
    final favorites = ref.read(favoritesStoreProvider).stops;
    final history = doUseHistory
        ? routeHistoryRepository.history
        : const Iterable<LocalRoute>.empty();
    final completions = await ref.read(navigationAPIProvider).complete(
          query,
          locationType: locationType,
        );
    final favs = <MapEntry<FavoriteStop, double>>[];

    for (final c in favorites) {
      final leven = scaledLevenshtein(query, c.data.name);
      if (leven < _kConfidenceThreshold) {
        favs.add(MapEntry(c.data, leven));
      }
    }

    favs.sort((a, b) => a.value.compareTo(b.value));

    return [
      ...favs
          .take(_kMaxFavoritesCount)
          .map((e) => Completion.fromFavoriteStop(e.key)),
      ..._routeHistoryToCompletions(history).toSet().take(_kMaxHistoryCount),
      ...completions.map(Completion.fromApi),
    ];
  }

  Iterable<Completion> _routeHistoryToCompletions(
    Iterable<LocalRoute> history,
  ) sync* {
    for (final e in history) {
      // HACK: we shouldnt use sbb here
      yield Completion.from(
        SbbCompletion(label: e.fromAsString),
        origin: DataOrigin.history,
      );
      yield Completion.from(
        SbbCompletion(label: e.toAsString),
        origin: DataOrigin.history,
      );
    }
  }

  Stream<List<Completion>> complete({
    required String query,
    DateTime? date,
    bool doPredict = false,
    bool doUseCurrentLocation = true,
    bool doUseHistory = true,
  }) async* {
    assert(!doPredict || date != null,
        'If you use prediction, you must provide a date argument');

    final favorites = ref.read(favoritesStoreProvider).stops;
    final history =
        doUseHistory ? routeHistoryRepository.history : const <LocalRoute>[];
    final completions = await ref.read(navigationAPIProvider).complete(query);
    final distances = <MapEntry<FavoriteStop, double>>[];

    for (final c in favorites) {
      final leven = scaledLevenshtein(query, c.data.name.replaceAll(',', ''));
      if (leven < _kConfidenceThreshold) {
        distances.add(MapEntry(c.data, leven));
      }
    }

    distances.sort((a, b) => a.value.compareTo(b.value));

    final historySet =
        _routeHistoryToCompletions(history).toSet().take(_kMaxHistoryCount);

    final favsIter = distances
        .take(_kMaxFavoritesCount)
        .map((e) => Completion.fromFavoriteStop(e.key));

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
        history,
        PredictionArguments.withSource(query, dateTime: date),
      );
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
  List<Completion> _returnedList({
    required String q,
    required bool doUseCurrentLocation,
    required Iterable<Completion> history,
    required Iterable<Completion> favs,
    required Iterable<NavigationCompletion> completions,
    required bool doPredict,
    required RoutePrediction? prediction,
  }) =>
      [
        if (doUseCurrentLocation) Completion.currentLocation,
        if (doPredict)
          if (prediction == null)
            Completion.from(
              SbbCompletion(label: q),
              origin: DataOrigin.loading,
            )
          else if (prediction.prediction != null)
            Completion.from(
              SbbCompletion(label: prediction.prediction!.toAsString),
              origin: DataOrigin.prediction,
            ),
        if (history.isNotEmpty) ...history,
        ...favs,
        ...completions.map(Completion.fromApi),
      ];

  void dispose() {}
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
