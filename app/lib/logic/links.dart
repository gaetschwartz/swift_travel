import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/utils/route_uri.dart';

final linksProvider = Provider<DeepLinkBloc>((ref) {
  final deepLinkBloc = DeepLinkBloc();
  ref.onDispose(deepLinkBloc.dispose);
  return deepLinkBloc;
});

class InvalidRouteException implements Exception {
  const InvalidRouteException(this.map);

  final Map<String, String> map;

  @override
  String toString() => 'InvalidRouteException : $map';
}

class DeepLinkBloc {
  static const stream = EventChannel('com.gaetanschwartz.swift_travel.deeplink/events');
  static const channel = MethodChannel('com.gaetanschwartz.swift_travel.deeplink/channel');

  late StreamSubscription _sub;
  late void Function(Pair<NavRoute, int> pair) onNewRoute;
  late BaseNavigationApi Function() getApi;

  Future<void> init({
    required BaseNavigationApi Function() getApi,
    required void Function(Pair<NavRoute, int> pair) onNewRoute,
  }) async {
    log.log('Initialize', channel: 'LinksBloc');
    this.onNewRoute = onNewRoute;
    this.getApi = getApi;

    _sub = stream.receiveBroadcastStream().cast<String>().listen(_onLink);

    final s = await getInitialLink();
    if (s != null) {
      await _onLink(s);
    } else {
      log.log('No initial link');
    }
  }

  Future<void> _onLink(String link) async {
    final uri = Uri.parse(link);
    print('Initial link: $uri');
    if (uri.path == '/route') {
      print('We have a new route $uri');

      final pair = await parseRouteArguments(uri, getApi());
      log.log(pair.toString());

      onNewRoute(pair);
    }
  }

  static Future<Pair<NavRoute, int>> parseRouteArguments(Uri uri, BaseNavigationApi navApi) async {
    final params = decodeRouteUri(uri);

    final qUri = SearchChApi.queryBuilder('route', params);
    if (kDebugMode) {
      log.log(qUri.toString());
    }

    final route = await navApi.rawRoute(qUri);

    final i = int.parse(uri.queryParameters['i']!);
    return Pair(route, i);
  }

  void dispose() => _sub.cancel();

  Future<String?> getInitialLink() async {
    try {
      return channel.invokeMethod<String>('initialLink');
    } on MissingPluginException {
      print('Unsupported platform for deeplink');
      return null;
    }
  }
}
