import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/cff/cff.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/sncf/sncf.dart';

import 'preferences.dart';

final navigationAPIProvider = Provider<NavigationApi>((ref) {
  final prefs = ref.watch(preferencesProvider);

  NavigationApi api;
  switch (prefs.api) {
    case NavigationApiType.sncf:
      log('Using sncf repository');
      api = SncfRepository();
      break;
    case NavigationApiType.cff:
    default:
      log('Using cff repository');
      api = CffRepository();
      break;
  }
  ref.onDispose(api.dispose);
  return api;
});
