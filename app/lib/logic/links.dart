import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/utils/predict/predict.dart';
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
  static const platform = MethodChannel('com.gaetanschwartz.swift_travel.deeplink/channel');

  late StreamSubscription _sub;
  late void Function(Pair<NavRoute, int> pair) push;
  late BaseNavigationApi Function() getApi;

  Future<void> init({
    required BaseNavigationApi Function() getApi,
    required void Function(Pair<NavRoute, int> pair) push,
  }) async {
    log('Initialize', name: 'LinksBloc');
    this.push = push;
    this.getApi = getApi;

    _sub = stream.receiveBroadcastStream().cast<String>().listen(_onLink);

    final s = await initialLink;
    if (s != null) {
      await _onLink(s);
    } else {
      log('No initial link');
    }
  }

  Future<void> _onLink(String link) async {
    final uri = Uri.parse(link);
    log(uri.toString());
    if (uri.path == '/route') {
      log('We have a new route $uri');

      final pair = await parseRouteArguments(uri, getApi());
      log(pair.toString());

      push(pair);
    }
  }

  static Future<Pair<NavRoute, int>> parseRouteArguments(Uri uri, BaseNavigationApi navApi) async {
    final params = decodeRouteUri(uri);

    final qUri = SearchChApi.queryBuilder('route', params);
    if (kDebugMode) {
      log(qUri.toString());
    }

    final route = await navApi.rawRoute(qUri);

    final i = int.parse(uri.queryParameters['i']!);
    return Pair(route, i);
  }

  void dispose() => _sub.cancel();

  Future<String?> get initialLink async {
    try {
      return platform.invokeMethod<String>('initialLink');
    } on MissingPluginException {
      return null;
    }
  }
}
