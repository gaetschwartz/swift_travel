import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final linksProvider = Provider<DeepLinkBloc>((ref) {
  final deepLinkBloc = DeepLinkBloc();
  ref.onDispose(() => deepLinkBloc.dispose());
  return deepLinkBloc;
});

class DeepLinkBloc {
  //Event Channel creation
  static const stream = EventChannel('com.gaetanschwartz.swiss_travel.deeplink/events');
  //Method channel creation
  static const platform = MethodChannel('com.gaetanschwartz.swiss_travel.deeplink/channel');

  StreamSubscription _sub;

  void init(void Function(String link) onLink) {
    log("Initialize", name: "LinksBloc");
    initialLink.then((s) {
      if (s != null) {
        _onRedirected(s, onLink);
      } else {
        log("No initial link");
      }
    });
    _sub = stream.receiveBroadcastStream().listen((d) => _onRedirected(d, onLink), onError: (e) {
      log("", error: e);
      _sub?.cancel();
    });
  }

  void _onRedirected(dynamic o, void Function(String link) onLink) {
    if (o != null && o is String) {
      final String s = o;
      log("Got an Uri of $s");
      onLink(s);
    } else {
      throw StateError("Redirected URI ($o) is not a String but a ${o.runtimeType}");
    }
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
