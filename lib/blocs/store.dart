import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_free/api/cff/cff_completion.dart';
import 'package:travel_free/blocs/cff.dart';

abstract class StoreBase {
  Future<List<CffCompletion>> getFavorites();
  Future<void> addFavorite(CffCompletion completion);
  Future<void> deleteFavorite(CffCompletion completion);
}

final storeProvider = Provider<StoreBase>((r) => LocalStore(r));

class LocalStore implements StoreBase {
  final ProviderReference ref;
  LocalStore(this.ref);

  SharedPreferences _prefs;

  Future<void> _checkState() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  @override
  Future<List<CffCompletion>> getFavorites() async {
    _prefs = await SharedPreferences.getInstance();
    final List<String> list = _prefs.getStringList("favoritesStop") ?? [];
    final List<CffCompletion> lComp = [];

    for (final l in list) {
      final List<CffCompletion> c = await ref.read(cffProvider).complete(l, showIds: true);
      lComp.add(c[0]);
    }

    return lComp;
  }

  @override
  Future<void> addFavorite(CffCompletion completion) async {
    await _checkState();
    final favs = await getFavorites();
    await _prefs.setStringList(
        "favoritesStop", favs.map((e) => e.id).toList()..add(completion.id ?? completion.label));
  }

  @override
  Future<void> deleteFavorite(CffCompletion completion) async {
    await _checkState();
    final favs = await getFavorites();
    final list = favs.map((e) => e.id).toList();
    if (!list.remove(completion.id) && !list.remove(completion.label)) {
      throw StateError("$completion isn't in favorites");
    }
    await _prefs.setStringList("favoritesStop", list);
  }
}
