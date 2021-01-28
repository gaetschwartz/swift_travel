import 'dart:math' show min;

import 'package:flutter/foundation.dart';
import 'package:swift_travel/apis/cff/models/cff_completion.dart';
import 'package:swift_travel/blocs/store.dart';
import 'package:swift_travel/models/favorite_stop.dart';
import 'package:utils/levenshtein.dart';

const _kConfidenceThreshold = .9;
const _kMaxFavoritesCount = 3;

/// Add similar favorites to the completions
Future<List<CffCompletion>> completeWithFavorites(
    FavoritesSharedPreferencesStore store, List<CffCompletion> compls, String query,
    {@required String currentLocationString}) async {
  final levens = <FavoriteStop, double>{};

  for (final c in store.stops) {
    if (c.stop == null) continue;
    final leven = scaledLevenshtein(query, c.name.replaceAll(',', ''));
    // Skip if above threshold
    if (leven < _kConfidenceThreshold) {
      // log("$query - ${c.label} => $leven");
      levens[c] = leven;
    }
  }

  final favs = levens.entries.toList(growable: false);
  favs.sort((a, b) => a.value.compareTo(b.value));

  return [
    if (currentLocationString != null)
      CffCompletion(label: currentLocationString, isCurrentLocation: true),
    ...favs.sublist(0, min(favs.length, _kMaxFavoritesCount)).map((e) => e.key.toCompletion()),
    ...compls.where((c) => c.label != null),
  ];
}
