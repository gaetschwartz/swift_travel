import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/cff/cff.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/sncf/sncf.dart';

import 'preferences.dart';

final Provider<NavigationApi> navigationAPIProvider = Provider<NavigationApi>((ref) {
  final PreferencesBloc prefs = ref.watch(preferencesProvider);
  switch (prefs.api) {
    case NavigationApiType.cff:
      log("Using cff repository");
      return CffRepository();
    case NavigationApiType.sncf:
      log("Using sncf repository");
      return SncfRepository();
  }
  throw StateError("Unexpected state of nav api : ${prefs.api}");
});
