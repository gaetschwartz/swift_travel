import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/switzerland/switzerland.dart';
import 'package:swift_travel/prediction/models/models.dart';
import 'package:swift_travel/utils/route_uri.dart';

import 'navigation.dart';

final linksProvider = Provider<DeepLinkBloc>((ref) {
  final deepLinkBloc = DeepLinkBloc(ref);
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
  static const stream =
      EventChannel('com.gaetanschwartz.swift_travel.deeplink/events');
  static const channel =
      MethodChannel('com.gaetanschwartz.swift_travel.deeplink/channel');

  late StreamSubscription<String> _sub;
  void Function(Pair<NavRoute, int> pair)? onNewRoute;
  final Ref ref;

  DeepLinkBloc(this.ref);

  Future<void> init({
    required void Function(Pair<NavRoute, int> pair) onNewRoute,
  }) async {
    log.log('Initialize', channel: 'LinksBloc');
    this.onNewRoute = onNewRoute;

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
    log.log('Initial link: $uri');
    if (uri.path == '/route') {
      log.log('We have a new route $uri');

      final pair =
          await parseRouteArguments(uri, ref.read(navigationAPIProvider));
      log.log(pair.toString());

      onNewRoute?.call(pair);
    }
  }

  static Future<Pair<NavRoute, int>> parseRouteArguments(
      Uri uri, BaseNavigationApi navApi) async {
    final params = decodeRouteUri(uri);

    final qUri = SearchChApi.queryBuilder('route', params);
    if (kDebugMode) {
      log.log(qUri.toString());
    }

    final route = await navApi.rawRoute(qUri);

    final i = int.parse(uri.queryParameters['i']!);
    return Pair(route, i);
  }

  void dispose() {
    unawaited(_sub.cancel());
  }

  Future<String?> getInitialLink() async {
    try {
      return channel.invokeMethod<String>('initialLink');
    } on MissingPluginException {
      log.log('Unsupported platform for deeplink');
      return null;
    }
  }
}
