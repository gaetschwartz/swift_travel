import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaets_logging/logging.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swift_travel/apis/navigation/models/route.dart';
import 'package:swift_travel/utils/route_uri.dart';
import 'package:theming/dialogs/confirmation_alert.dart';

import 'errors.dart';

const String websiteHost = 'travel.gaetanschwartz.com';

Future<void> shareRoute(BuildContext context, NavRoute route, int i) async {
  final params = encodeRouteUri(Uri.parse(route.requestUrl!), i);
  log.log(params);

  final sharedUri = Uri(scheme: 'https', host: websiteHost, path: 'route', queryParameters: params);
  log.log(sharedUri);

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
    } on MissingPluginException {
      ignoreError();
    }
  }
}
