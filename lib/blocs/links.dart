import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/utils/share.dart';

final linksProvider = Provider<DeepLinkBloc>((ref) {
  final deepLinkBloc = DeepLinkBloc();
  ref.onDispose(() => deepLinkBloc.dispose());
  return deepLinkBloc;
});

class InvalidRouteException implements Exception {
  final Map<String, String> map;
  InvalidRouteException(this.map);

  @override
  String toString() => 'InvalidRouteException : $map';
}

class DeepLinkBloc {
  static const stream = EventChannel('com.gaetanschwartz.swift_travel.deeplink/events');
  static const platform = MethodChannel('com.gaetanschwartz.swift_travel.deeplink/channel');

  StreamSubscription _sub;

  void init(NavigationApi navApi) {
    log('Initialize', name: 'LinksBloc');
    initialLink.then((s) {
      if (s != null) {
        onLink(navApi, s);
      } else {
        log('No initial link');
      }
    });
    _sub = stream.receiveBroadcastStream().cast<String>().listen((d) => onLink(navApi, d));
  }

  Future<void> onLink(NavigationApi navApi, String link) async {
    final uri = Uri.parse(link);
    log(uri.toString());
    if (uri.path == '/route') {
      log('We have a new route $uri');

      final map = await parseRouteArguments(uri, navApi);

      log(map.toString());

      return navigatorKey.currentState.pushNamed('/routeDetails', arguments: map);
    }
  }

  static Future<Map<String, Object>> parseRouteArguments(Uri uri, NavigationApi navApi) async {
    final params = <String, String>{};

    for (final e in uri.queryParameters.entries) {
      params[translate[e.key] ?? e.key] = translate[e.value] ?? e.value;
    }

    params.remove('i');

    if (!params.containsKey('from') ||
        !params.containsKey('to') ||
        !uri.queryParameters.containsKey('i')) {
      throw InvalidRouteException(uri.queryParameters);
    }

    final qUri = Uri.https('timetable.search.ch', 'api/route.json', params);
    log(qUri.toString());

    final route = await navApi.rawRoute(qUri.toString());

    final i = int.parse(uri.queryParameters['i']);
    final map = {'route': route, 'i': i};
    return map;
  }

  void dispose() {
    _sub.cancel();
  }

  Future<String> get initialLink async {
    try {
      return platform.invokeMethod<String>('initialLink');
    } on MissingPluginException {
      return null;
    }
  }
}
