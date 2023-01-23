import 'dart:async';

import 'package:collection/collection.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/models/vehicle_iconclass.dart';
import 'package:swift_travel/apis/navigation/switzerland/models/completion.dart';
import 'package:swift_travel/db/db.dart';
import 'package:swift_travel/db/favorite_store.dart';
import 'package:swift_travel/db/history.dart';
import 'package:swift_travel/logic/contacts.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/models/favorites.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/prediction/predict.dart';
import 'package:swift_travel/utils/strings/strings.dart';

const _kConfidenceThreshold = .5;
const _kMaxSuggestedCount = 3;

final completionEngineProvider = Provider<CompletionEngine>((ref) {
  final engine = CompletionEngine(ref);
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

  Iterable<Completion> _routeHistoryToCompletions(
    Iterable<LocalRoute> history,
  ) sync* {
    for (final e in history) {
      yield Completion.from(
        SchCompletion(label: e.fromAsString),
        origin: DataOrigin.history,
      );
      yield Completion.from(
        SchCompletion(label: e.toAsString),
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
    bool doUseContacts = true,
    bool doUseFavorites = true,
    LocationType? locationType,
  }) async* {
    if (kDebugMode) {
      print('complete(query: $query, date: $date, doPredict: $doPredict, '
          'doUseCurrentLocation: $doUseCurrentLocation, doUseHistory: $doUseHistory, '
          'doUseContacts: $doUseContacts, doUseFavorites: $doUseFavorites, '
          'locationType: $locationType)');
    }
    assert(!doPredict || date != null,
        'If you use prediction, you must provide a date argument');

    final favoriteStops = doUseFavorites
        ? ref.read(favoritesStoreProvider).stops
        : const Iterable<DataWithId<FavoriteStop>>.empty();

    final history =
        doUseHistory ? routeHistoryRepository.history : const <LocalRoute>[];
    final all = await Future.wait([
      ref
          .read(navigationAPIProvider)
          .complete(query, locationType: locationType),
      if (doUseContacts)
        ContactsRepository.instance.getAll()
      else
        Future.value(<Contact>[]),
    ]);
    final completions = all[0] as List<NavigationCompletion>;
    final contacts = all[1] as List<Contact>;
    final distances = <MapEntry<Completion, double>>[];
    final queryLower = query.toLowerCase();

    for (final c in favoriteStops) {
      final dist = jaroDistance(query, c.data.name);
      if (dist < _kConfidenceThreshold ||
          c.data.name.toLowerCase().startsWith(queryLower)) {
        distances.add(MapEntry(Completion.fromFavoriteStop(c.data), dist));
      }
    }

    for (final c in contacts) {
      final contactName = ContactsRepository.contactName(c);
      // skip contacts that don't have an address
      if (c.postalAddresses.isEmpty) {
        continue;
      }

      final dist = jaroDistance(query, contactName);
      if (dist < _kConfidenceThreshold ||
          contactName.toLowerCase().startsWith(queryLower)) {
        distances.add(MapEntry(ContactCompletion(c), dist));
      }
    }

    for (final c in _routeHistoryToCompletions(history)) {
      final dist = jaroDistance(query, c.label);
      if (dist < _kConfidenceThreshold ||
          c.label.toLowerCase().startsWith(queryLower)) {
        distances.add(MapEntry(c, dist));
      }
    }

    // get top k smallest distances
    final topK = distances
        .topK(_kMaxSuggestedCount, (a, b) => b.value.compareTo(a.value))
        .map((e) => e.key);

    final list = _returnedList(
      q: query,
      doUseCurrentLocation: doUseCurrentLocation,
      suggested: topK,
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
        suggested: topK,
        completions: completions,
        doPredict: doPredict,
        prediction: prediction,
      );
      yield event;
    }
  }

  Future<List<Completion>> completeNavigation({
    required String query,
    bool doUseHistory = true,
    LocationType? locationType,
  }) async {
    final favoriteStops = ref.read(favoritesStoreProvider).stops;
    final history = doUseHistory
        ? routeHistoryRepository.history
        : const Iterable<LocalRoute>.empty();
    final completions = await ref.read(navigationAPIProvider).complete(
          query,
          locationType: locationType,
        );
    final distances = <MapEntry<Completion, double>>[];

    for (final c in favoriteStops) {
      final dist = jaroDistance(query, c.data.name);
      if (dist < _kConfidenceThreshold) {
        distances.add(MapEntry(Completion.fromFavoriteStop(c.data), dist));
      }
    }

    for (final c in _routeHistoryToCompletions(history)) {
      final dist = jaroDistance(query, c.label);
      if (dist < _kConfidenceThreshold) {
        distances.add(MapEntry(c, dist));
      }
    }

    return [
      ...distances
          .topK(_kMaxSuggestedCount, (a, b) => b.value.compareTo(a.value))
          .map((e) => e.key),
      ...completions.map(Completion.fromApi),
    ];
  }

// ignore: long-parameter-list
  List<Completion> _returnedList({
    required String q,
    required bool doUseCurrentLocation,
    required Iterable<Completion> suggested,
    required Iterable<NavigationCompletion> completions,
    required bool doPredict,
    required RoutePrediction? prediction,
  }) =>
      [
        if (doUseCurrentLocation) Completion.currentLocation,
        if (doPredict)
          if (prediction == null)
            Completion.from(
              SchCompletion(label: q),
              origin: DataOrigin.loading,
            )
          else if (prediction.prediction != null)
            Completion.from(
              SchCompletion(label: prediction.prediction!.toAsString),
              origin: DataOrigin.prediction,
            ),
        ...suggested,
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

extension ListX<T> on List<T> {
  List<T> topK(int k, int Function(T a, T b) compare) {
    final pq = HeapPriorityQueue<T>(compare);

    for (final e in this) {
      pq.add(e);
      if (pq.length > k) {
        pq.removeFirst();
      }
    }

    return pq.toUnorderedList()..sort((a, b) => compare(b, a));
  }
}
