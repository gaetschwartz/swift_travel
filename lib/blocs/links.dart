import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/main.dart';
import 'package:swift_travel/utils/route_uri.dart';

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

  late StreamSubscription _sub;

  void init(BaseNavigationApi navApi) {
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

  Future<void> onLink(BaseNavigationApi navApi, String link) async {
    final uri = Uri.parse(link);
    log(uri.toString());
    if (uri.path == '/route') {
      log('We have a new route $uri');

      final map = await parseRouteArguments(uri, navApi);

      log(map.toString());

      await navigatorKey.currentState!.pushNamed('/routeDetails', arguments: map);
    }
  }

  static Future<Map<String, Object?>> parseRouteArguments(Uri uri, BaseNavigationApi navApi) async {
    final params = decodeRouteUri(uri);

    final qUri = SearchChApi.queryBuilder('route', params);
    print(qUri.toString());

    final route = await navApi.rawRoute(qUri);

    final i = int.parse(uri.queryParameters['i']!);
    final map = {'route': route, 'i': i};
    return map;
  }

  void dispose() {
    _sub.cancel();
  }

  Future<String?> get initialLink async {
    try {
      return platform.invokeMethod<String>('initialLink');
    } on MissingPluginException {
      return null;
    }
  }
}
