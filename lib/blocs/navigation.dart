import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';

import 'preferences.dart';

final navigationAPIProvider = Provider<BaseNavigationApi>((ref) {
  final prefs = ref.watch(preferencesProvider);

  final api = BaseNavigationApi.getFactory(prefs.api).create(ref.read);
  ref.onDispose(api.dispose);
  return api;
});
