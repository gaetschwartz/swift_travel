import 'dart:math' show min;

import 'package:swift_travel/apis/navigation/models/completion.dart';
import 'package:swift_travel/apis/navigation/search.ch/models/completion.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:swift_travel/utils/strings/strings.dart';

const _kConfidenceThreshold = .9;
const _kMaxFavoritesCount = 3;
const _kMaxHistoryCount = 3;

/// Add similar favorites to the completions
List<Completion> completeWithFavorites({
  required Iterable<FavoriteStop?> favorites,
  required List<Completion> completions,
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
    final leven = scaledLevenshtein(query, c.name.replaceAll(',', ''));
    if (leven < _kConfidenceThreshold) {
      levens[c] = leven;
    }
  }

  final favs = levens.entries.toList(growable: false)..sort((a, b) => a.value.compareTo(b.value));

  return [
    if (currentLocationString != null)
      SbbCompletion(label: currentLocationString, origin: DataOrigin.currentLocation),
    if (prediction != null) SbbCompletion(label: prediction, origin: DataOrigin.prediction),
    if (history.isNotEmpty)
      ...history
          .flatMap((e) => [
                SbbCompletion(label: e.from, origin: DataOrigin.history),
                SbbCompletion(label: e.to, origin: DataOrigin.history),
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
    ;
  }
}
