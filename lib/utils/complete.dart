import 'dart:math' show min;

import 'package:swift_travel/apis/search.ch/models/completion.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:utils/levenshtein.dart';

const _kConfidenceThreshold = .9;
const _kMaxFavoritesCount = 3;
const _kMaxHistoryCount = 3;

/// Add similar favorites to the completions
List<NavCompletion> completeWithFavorites({
  required Iterable<FavoriteStop?> favorites,
  required List<NavCompletion> completions,
  required String query,
  required List<LocalRoute> history,
  String? currentLocationString,
  String? prediction,
}) {
  final levens = <FavoriteStop?, double>{};

  for (final c in favorites) {
    if (c == null) {
      continue;
    }
    final leven = scaledLevenshtein(query, c.name!.replaceAll(',', ''));
    if (leven < _kConfidenceThreshold) {
      levens[c] = leven;
    }
  }

  final favs = levens.entries.toList(growable: false)..sort((a, b) => a.value.compareTo(b.value));

  return [
    if (currentLocationString != null)
      NavCompletion(label: currentLocationString, origin: DataOrigin.currentLocation),
    if (prediction != null) NavCompletion(label: prediction, origin: DataOrigin.prediction),
    if (history.isNotEmpty)
      ...history
          .flatMap((e) => [
                NavCompletion(label: e.from, origin: DataOrigin.history),
                NavCompletion(label: e.to, origin: DataOrigin.history),
              ])
          .take(_kMaxHistoryCount)
          .toSet(),
    ...favs
        .take(min(favs.length, _kMaxFavoritesCount))
        .map((e) => NavCompletion.fromFavorite(e.key!)),
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
    ;
  }
}
