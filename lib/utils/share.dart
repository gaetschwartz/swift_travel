import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:swift_travel/apis/search.ch/models/route.dart';
import 'package:swift_travel/utils/route_uri.dart';
import 'package:theming/dialogs/confirmation_alert.dart';

const String routeUrl = 'travel.gaetanschwartz.com';

Future<void> shareRoute(BuildContext context, CffRoute route, int? i) async {
  final params = encodeRouteUri(Uri.parse(route.requestUrl!), i);
  print(params);
  final sharedUri = Uri(scheme: 'https', host: routeUrl, path: 'route', queryParameters: params);
  log(sharedUri.toString());

  if (kIsWeb) {
    final b = await confirm(context,
        title: const Text('Copy to  clipboard ?'),
        content: Text(sharedUri.toString()),
        cancel: const Text('No'),
        confirm: const Text('Yes'));
    if (b) {
      await Clipboard.setData(ClipboardData(text: sharedUri.toString()));
    }
  } else {
    try {
      await Share.share(sharedUri.toString());
    } on Exception catch (_) {}
  }
}
