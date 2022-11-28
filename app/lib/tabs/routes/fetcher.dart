import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/switzerland/switzerland.dart';
import 'package:swift_travel/logic/location/location.dart';
import 'package:swift_travel/logic/location/models/models.dart';
import 'package:swift_travel/logic/navigation.dart';
import 'package:swift_travel/states/route_states.dart';
import 'package:swift_travel/tabs/routes/location_text_box_manager.dart';
import 'package:swift_travel/tabs/routes/route_tab.dart';
import 'package:swift_travel/utils/errors.dart';

final routeStatesProvider =
    StateNotifierProvider.autoDispose<FetcherBase, RouteStates>((ref) {
  ref.keepAlive();
  final fetcher = Fetcher();
  final from = ref.watch(fromTextfieldProvider);
  final to = ref.watch(toTextfieldProvider);
  final date = ref.watch(dateProvider);
  final timeType = ref.watch(timeTypeProvider);
  final api = ref.watch(navigationAPIProvider);
  fetcher.fetch(
    from: from,
    to: to,
    date: date,
    timeType: timeType,
    api: api,
  );
  return fetcher;
});

abstract class FetcherBase extends StateNotifier<RouteStates> {
  Future<void> fetch({
    required LocationTextBoxManager from,
    required LocationTextBoxManager to,
    required DateTime date,
    required SearchChMode timeType,
    required BaseNavigationApi api,
  });

  FetcherBase() : super(const RouteStates.empty());

  @override
  set state(RouteStates value) => super.state = value;
}

class Fetcher extends FetcherBase {
  static final log = Logger('Fetcher');

  @override
  Future<void> fetch({
    required LocationTextBoxManager from,
    required LocationTextBoxManager to,
    required DateTime date,
    required SearchChMode timeType,
    required BaseNavigationApi api,
  }) async {
    if (kDebugMode) {
      log.log('Something changed checking if we need to rebuild');
    }

    if (from.state.isEmpty || to.state.isEmpty) {
      if (from.state.isEmpty && to.state.isEmpty) {
        state = const RouteStates.empty();
      }
      return;
    } else if (from.state.maybeWhen(
          text: (t, l) => t.isEmpty || !l,
          orElse: () => false,
        ) ||
        to.state.maybeWhen(
          text: (t, l) => t.isEmpty || !l,
          orElse: () => false,
        )) {
      return;
    } else {
      state = const RouteStates.loading();
    }

    if (kDebugMode) {
      log.log('From: ${from.state}');
      log.log('To: ${to.state}');
    }

    GeoLocation? p;

    try {
      final departure = await from.state.when<FutureOr<String>?>(
        empty: () => null,
        text: (t, l) => t,
        useCurrentLocation: () async {
          p ??= await GeoLocationEngine.instance.getLocation();
          return '${p!.latitude},${p!.longitude}';
        },
      )!;
      final arrival = await to.state.when<FutureOr<String>?>(
        empty: () => null,
        text: (t, l) => t,
        useCurrentLocation: () async {
          p ??= await GeoLocationEngine.instance.getLocation();
          return '${p!.latitude},${p!.longitude}';
        },
      )!;
      if (kDebugMode) {
        log.log('Fetching route from $departure to $arrival');
      }
      final it = await api.route(
        departure,
        arrival,
        date: date,
        time: TimeOfDay.fromDateTime(date),
        timeType: timeType,
      );
      state = RouteStates(it);
    } on SocketException catch (e, s) {
      state = const RouteStates.networkException();
      reportDartError(e, s, library: 'fetcher', reason: 'while fetching');
    } on MissingPluginException {
      state = const RouteStates.missingPluginException();
    } on PermissionDeniedException {
      state = const RouteStates.locationPermissionNotGranted();
    } on LocationServiceDisabledException {
      state = const RouteStates.locationPermissionNotGranted();
    } on Exception catch (e, s) {
      state = RouteStates.exception(e);
      reportDartError(e, s, library: 'fetcher', reason: 'while fetching');
    }
  }
}
