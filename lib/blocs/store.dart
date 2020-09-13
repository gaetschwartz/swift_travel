import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_free/api/cff/cff_completion.dart';
import 'package:travel_free/blocs/cff.dart';
import 'package:travel_free/models/favorites_states.dart';

abstract class StoreBase {
  Future<List<CffCompletion>> getFavorites({bool notify = true});
  Future<void> addFavorite(CffCompletion completion);
  Future<void> deleteFavorite(CffCompletion completion);
}

final favoritesProvider = Provider<StoreBase>((r) => LocalStore(r));
final favoritesStatesProvider =
    StateProvider<FavoritesStates>((_) => const FavoritesStates.empty());

class LocalStore implements StoreBase {
  final ProviderReference ref;
  LocalStore(this.ref);

  SharedPreferences _prefs;
  List<CffCompletion> _completions = [];

  Future<void> _checkState() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  List<CffCompletion> get completions => _completions;

  @override
  Future<List<CffCompletion>> getFavorites({bool notify = true}) async {
    if (notify) ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();

    _prefs = await SharedPreferences.getInstance();
    final List<String> favsIds = _prefs.getStringList("favoritesStop") ?? [];
    final List<CffCompletion> lComp = [];

    for (final l in favsIds) {
      final List<CffCompletion> c = await ref.read(cffProvider).complete(l, showIds: true);
      lComp.add(c[0]);
    }
    _completions = lComp;
    sync();
    return _completions;
  }

  @override
  Future<void> addFavorite(CffCompletion completion) async {
    ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
    await _checkState();
    await getFavorites();
    _completions.add(completion);

    await sync();
  }

  Future<void> sync({bool notify = true}) async {
    if (notify) ref.read(favoritesStatesProvider).state = FavoritesStates.data(_completions);
    await _prefs.setStringList("favoritesStop", _completions.map((e) => e.id ?? e.label).toList());
  }

  @override
  Future<void> deleteFavorite(CffCompletion completion) async {
    ref.read(favoritesStatesProvider).state = const FavoritesStates.loading();
    await _checkState();
    await getFavorites();
    _completions.removeWhere((c) => c.label == completion.label || c.id == completion.id);

    await sync();
  }
}
