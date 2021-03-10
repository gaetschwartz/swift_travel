import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';

import '../db/preferences.dart';

final Provider<BaseNavigationApi> navigationAPIProvider = Provider((ref) {
  final prefs = ref.read(preferencesProvider);

  final api = BaseNavigationApi.getFactory(prefs.api.value).create(ref.read);
  ref.onDispose(api.dispose);
  return api;
});
