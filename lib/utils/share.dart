import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';
import 'package:theming/dialogs/confirmation_alert.dart';

const String routeUrl = 'travel.gaetanschwartz.com';

Future<void> shareRoute(BuildContext context, CffRoute route, int i) async {
  final String requestUrl = route.requestUrl;
  final Uri uri = Uri.parse(requestUrl);
  final params = <String, String>{};
  for (final e in uri.queryParameters.entries) {
    final newKey =
        translate.entries.firstWhere((e2) => e.key == e2.value, orElse: () => null)?.key ?? e.key;
    final newValue =
        translate.entries.firstWhere((e2) => e.value == e2.value, orElse: () => null)?.key ??
            e.value;
    params[newKey] = newValue;
  }
  params['i'] = i.toString();
  final Uri sharedUri =
      Uri(scheme: 'https', host: routeUrl, path: 'route', queryParameters: params);
  log(sharedUri.toString());

  if (kIsWeb) {
    final b = await confirm(context,
        title: const Text("Copy to  clipboard ?"),
        content: Text(sharedUri.toString()),
        cancel: const Text("No"),
        confirm: const Text("Yes"));
    if (b) {
      await Clipboard.setData(ClipboardData(text: sharedUri.toString()));
    }
  } else {
    try {
      Share.share(sharedUri.toString());
    } on Exception catch (_) {}
  }
}

const translate = <String, String>{
  'fr': 'from',
  'dt': 'date',
  'to': 'to',
  'tt': 'time_type',
  'stc': 'show_trackchanges',
  'sd': 'show_delays',
  'dpt': 'depart',
  'arv': 'arrival'
};
