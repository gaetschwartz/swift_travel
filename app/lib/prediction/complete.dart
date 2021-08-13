import 'dart:async';
import 'dart:math' show min;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/completion.dart';
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
  final completionEngine = CompletionEngine(ref);
  ref.onDispose(completionEngine.dispose);
  return completionEngine;
});

typedef UseCompletionEngineCallback = Stream<List<Completion>> Function(CompletionEngine engine);

final completionStreamProvider =
    StreamProvider.family<List<Completion>, UseCompletionEngineCallback>(
        (r, cb) => cb(r.watch(completionEngineProvider)));

class CompletionEngine {
  CompletionEngine(this.ref, {this.routeHistoryRepository});

  final ProviderReference ref;
  final RouteHistoryRepository? routeHistoryRepository;

  Stream<List<Completion>> complete({
    required String query,
    DateTime? date,
    bool doPredict = false,
    String? currentLocationString,
    bool doUseHistory = true,
  }) async* {
    final favorites = ref.read(storeProvider).stops;
    final history = doUseHistory
        ? (routeHistoryRepository ?? RouteHistoryRepository.i).history
        : <LocalRoute>[];
    final completions = await ref.read(navigationAPIProvider).complete(query);
    final distances = <FavoriteStop, double>{};

    for (final c in favorites) {
      final leven = scaledLevenshtein(query, c.name.replaceAll(',', ''));
      if (leven < _kConfidenceThreshold) {
        distances[c] = leven;
      }
    }

    final favs = distances.entries.toList(growable: false)
      ..sort((a, b) => a.value.compareTo(b.value));

    final list =
        returnedList(query, currentLocationString, null, history, favs, completions, doPredict);
    yield list;

    if (doPredict) {
      assert(date != null, 'If you use prediction, you must provide a date argument');
      final prediction =
          await predictRoute(history, PredictionArguments.withSource(query, dateTime: date));
      final event = returnedList(
          query, currentLocationString, prediction, history, favs, completions, doPredict);
      yield event;
    }
  }

  List<Completion> returnedList(
    String query,
    String? currentLocationString,
    RoutePrediction? prediction,
    Iterable<LocalRoute> history,
    Iterable<MapEntry<FavoriteStop, double>> favs,
    Iterable<Completion> completions,
    // ignore: avoid_positional_boolean_parameters
    bool doPredict,
  ) =>
      [
        if (currentLocationString != null)
          SbbCompletion(label: currentLocationString, origin: DataOrigin.currentLocation),
        if (doPredict)
          if (prediction == null)
            SbbCompletion(label: query, origin: DataOrigin.loading)
          else if (prediction.prediction != null)
            SbbCompletion(label: prediction.prediction!.toAsString, origin: DataOrigin.prediction),
        if (history.isNotEmpty)
          ...history
              .flatMap((e) => [
                    SbbCompletion(label: e.fromAsString, origin: DataOrigin.history),
                    SbbCompletion(label: e.toAsString, origin: DataOrigin.history),
                  ])
              .take(_kMaxHistoryCount)
              .toSet(),
        ...favs
            .take(min(favs.length, _kMaxFavoritesCount))
            .map((e) => SbbCompletion.fromFavorite(e.key)),
        ...completions,
      ];

  void dispose() {}
}

@Deprecated('Use CompletionEngine instead.')

/// Add similar favorites to the completions
List<Completion> completeWithFavorites({
  required Iterable<FavoriteStop> favorites,
  required List<Completion> completions,
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
      SbbCompletion(label: currentLocationString, origin: DataOrigin.currentLocation),
    if (prediction != null) SbbCompletion(label: prediction, origin: DataOrigin.prediction),
    if (history.isNotEmpty)
      ...history
          .flatMap((e) => [
                SbbCompletion(label: e.fromAsString, origin: DataOrigin.history),
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
