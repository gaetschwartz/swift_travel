import 'dart:math' show min;

import 'package:swiss_travel/api/cff/cff_completion.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:utils/utils/levenshtein.dart';

const _kConfidenceThreshold = .9;

/// Add similar favorites to the completions
Future<List<CffCompletion>> completeWithFavorites(
  FavoritesSharedPreferencesStore store,
  List<CffCompletion> compls,
  String query,
) =>
    Future.microtask(() {
      final Map<CffCompletion, double> levens = {};

      for (final CffCompletion c in store.favorites) {
        if (c.label == null) continue;
        final double leven =
            levenshtein(query, c.label.replaceAll(",", "")) / c.label.length;
        // Skip if above threshold
        if (leven < _kConfidenceThreshold) {
          // log("$query - ${c.label} => $leven");
          levens[c] = leven;
        }
      }

      final List<MapEntry<CffCompletion, double>> favs =
          levens.entries.toList();
      favs.sort((a, b) => a.value.compareTo(b.value));
      final Iterable<CffCompletion> sublist = favs
          .toList()
          .sublist(0, min(favs.length, 3))
          .map((e) => e.key.copyWith(isFavorite: true));

      final List<CffCompletion> completions =
          compls.where((c) => c.label != null).toList();
      completions.insertAll(0, sublist);
      return completions;
    });
