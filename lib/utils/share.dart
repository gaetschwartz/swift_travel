import 'dart:developer';

import 'package:share/share.dart';
import 'package:swift_travel/apis/cff/models/cff_route.dart';

const routeUrl = "gaetanschwartz.com";

Future<void> shareRoute(CffRoute route, int i) async {
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
  params["i"] = i.toString();
  final Uri sharedUri =
      Uri(scheme: "https", host: routeUrl, path: "route", queryParameters: params);
  log(sharedUri.toString());

  try {
    Share.share(sharedUri.toString());
  } on Exception catch (_) {
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //  content: Text(e.toString()),
    //));
  }
}

const translate = <String, String>{
  "fr": "from",
  "dt": "date",
  "to": "to",
  "tt": "time_type",
  "stc": "show_trackchanges",
  "sd": "show_delays",
  "dpt": "depart",
  "arv": "arrival"
};
