import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:swift_travel/apis/search.ch/models/cff_completion.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:swift_travel/models/local_route.dart';
import 'package:utils/levenshtein.dart';

const _kConfidenceThreshold = .9;
const _kMaxFavoritesCount = 3;
const _kMaxHistoryCount = 3;

/// Add similar favorites to the completions
List<CffCompletion> completeWithFavorites({
  @required Iterable<FavoriteStop> favorites,
  @required List<CffCompletion> completions,
  @required String query,
  List<LocalRoute> history = const [],
  String currentLocationString,
}) {
  final levens = <FavoriteStop, double>{};

  for (final c in favorites) {
    if (c.stop == null) continue;
    final leven = scaledLevenshtein(query, c.name.replaceAll(',', ''));
    if (leven < _kConfidenceThreshold) {
      levens[c] = leven;
    }
  }

  final favs = levens.entries.toList(growable: false)..sort((a, b) => a.value.compareTo(b.value));

  return [
    if (currentLocationString != null)
      CffCompletion(label: currentLocationString, origin: DataOrigin.currentLocation),
    if (history.isNotEmpty)
      ...history
          .flatMap((e) => [
                CffCompletion(label: e.from, origin: DataOrigin.history),
                CffCompletion(label: e.to, origin: DataOrigin.history),
              ])
          .take(_kMaxHistoryCount)
          .toSet(),
    ...favs
        .take(min(favs.length, _kMaxFavoritesCount))
        .map((e) => CffCompletion.fromFavorite(e.key)),
    ...completions.where((c) => c.label != null),
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
