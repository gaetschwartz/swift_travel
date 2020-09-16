import 'dart:math' show min;

import 'package:swiss_travel/api/cff/cff_completion.dart';
import 'package:swiss_travel/blocs/store.dart';
import 'package:utils/utils/levenshtein.dart';

const _kConfidenceThreshold = .9;

Future<List<CffCompletion>> completeWithFavorites(
  FavoritesSharedPreferencesStore store,
  List<CffCompletion> compls,
  String query,
) async {
  final List<CffCompletion> completions = await Future.microtask(() {
    final Map<CffCompletion, double> levens = {};
    for (final c in store.completions) {
      final leven = c.label == null ? 1.0 : levenshtein(query, c.label.replaceAll(",", ""));
      //log("\t${c.label}\t$leven\t${leven / c.label.length}");
      levens[c] = leven / c.label.length;
    }
    final favs = levens.entries.toList();
    favs.sort((a, b) => a.value.compareTo(b.value));
    final list = favs.where((e) => e.value < _kConfidenceThreshold).toList();
    final sublist = list.sublist(0, min(list.length, 3));

    final completions = compls.where((c) => c.label != null).toList();
    completions.insertAll(0, sublist.map((e) => e.key.copyWith(isFavorite: true)));
    return completions;
  });
  return completions;
}
