import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';

import 'preferences.dart';

final navigationAPIProvider = Provider<NavigationApi>((ref) {
  final prefs = ref.watch(preferencesProvider);

  final api = NavigationApi.getFactory(prefs.api).create();
  ref.onDispose(api.dispose);
  return api;
});
